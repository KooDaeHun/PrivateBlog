package kr.ac.pohang;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	BlogBoardDAO boardDAO = new BlogBoardDAO();
	JoinDAO joinDAO = new JoinDAO();
	ArrayList<BlogBoardDTO> list = new ArrayList<BlogBoardDTO>();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
//  a태그 href="index"를 눌렀을 때 index.jsp로 가기위해 requestMapping을 세팅함. 
	@RequestMapping("index")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public ModelAndView hadleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		list = (ArrayList<BlogBoardDTO>)boardDAO.boardAll();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("boardList", list);
		
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);

		modelAndView.setViewName("index.jsp?page=board");
		return modelAndView;
	}
	@RequestMapping(value = "clickTitle", method = RequestMethod.GET)
	public ModelAndView clickTitle(Integer num, HttpServletRequest request) {
		BlogBoardDTO boardDTO = boardDAO.getContent(num);
		
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		
		modelAndView.setViewName("index.jsp?page=blogBoardContent");
		modelAndView.addObject("content", boardDTO);
		return modelAndView;
	}
	@RequestMapping("write")
	public ModelAndView write(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index.jsp?page=write");
		return modelAndView;
	}
	@RequestMapping("join")
	public ModelAndView join(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index.jsp?page=join");
		return modelAndView;
	}
	
	@RequestMapping(value="joinProsessor", method=RequestMethod.GET)
	public ModelAndView joinHandleRequest(ModelAndView modelAndView, JoinDTO join){
		joinDAO.insertUser(join);
		
		modelAndView.addObject("userjoin", join);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping(value="loginProsessor", method=RequestMethod.POST)
	public ModelAndView loginHandle(ModelAndView modelAndView, String id, String pw, HttpServletRequest request) {
		JoinDTO user = joinDAO.login(id);
		if(user == null) {
			modelAndView.setViewName("index.jsp?page=loginFail");
		} else {
			modelAndView.addObject("user", user);
			request.getSession().setAttribute("loginUser", user);
			modelAndView.setViewName("index");
		}
		return modelAndView;
	}
	
	@RequestMapping("resume")
	public ModelAndView resume(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index.jsp?page=resume");
		return modelAndView;
	}
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		joinDTO = null;
		request.getSession().setAttribute("loginUser", joinDTO);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
}
