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
	PageDTO pageDTO = new PageDTO();
	
	ArrayList<BlogBoardDTO> list = new ArrayList<BlogBoardDTO>();
//	page.jsp에 넘겨줄 페이지 숫자 배열
	ArrayList<PageDTO> pageArray = new ArrayList<PageDTO>();
//	결과 레코드를 50개씩 담는 용도로 쓸 배열
	ArrayList<BlogBoardDTO> fiftyArray = new ArrayList<BlogBoardDTO>();
//	50개씩 묶음을 1방씩 저장해둔 ArrayList
	ArrayList<ArrayList<BlogBoardDTO>> allArray = new ArrayList<ArrayList<BlogBoardDTO>>();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
 
	@RequestMapping("index")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		JoinDTO joinDTO = (JoinDTO)request.getSession(false).getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public ModelAndView hadleRequest(Integer pageNumber, HttpServletRequest request, ModelAndView modelAndView) throws Exception{
		list = (ArrayList<BlogBoardDTO>)boardDAO.boardAll();
		int count = 0;
		int last = (int)list.size()-1;
		
//		새로 고침 눌렀을 때 엉뚱한 카운터 방지.
		fiftyArray.clear();
		allArray.clear();
		pageArray.clear();
		
		
		if(list.size()>50) {
			for(int i=0; i<list.size(); i++) {
				count+=1;
				if(count%50 == 0) {
					fiftyArray.add(list.get(i));
					allArray.add(fiftyArray);
					fiftyArray = new ArrayList<BlogBoardDTO>();
				} else if(count%50 != 0) {
					fiftyArray.add(list.get(i)); 
				}
				if(i == last) {
					allArray.add(fiftyArray);
				}
			}
//			50개 묶음 1페이지 기준 총 몇 페이지인지
			for(Integer x=1; x<allArray.size()+1; x++) {
				pageDTO.setPageNumber(x);
				pageArray.add(pageDTO);
				pageDTO = new PageDTO();
			}
			for(Integer y=0; y<pageArray.size(); y++) {
				System.out.println("페이지 번호 : "+pageArray.get(y).getPageNumber());
			}
			modelAndView.addObject("pageCount", pageArray);
			if(pageNumber != null) {
				Integer trueNum = pageNumber-1;
				int getNum = (int)trueNum;
				modelAndView.addObject("boardList", allArray.get(getNum));
			} else {
				modelAndView.addObject("boardList", allArray.get(0));
			}
			JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
			modelAndView.addObject("user", joinDTO);
			modelAndView.setViewName("index.jsp?page=board");
//		결과 레코드가 50개 이하라면.
		} else {
//			기본 1 페이지.
			pageDTO.setPageNumber(1);
			pageArray.add(pageDTO);
			modelAndView.addObject("boardList", list);
			modelAndView.addObject("pageCount", pageArray);
			JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
			modelAndView.addObject("user", joinDTO);
			modelAndView.setViewName("index.jsp?page=board");
		}
		return modelAndView;
	}
	@RequestMapping(value = "boardSearch", method = RequestMethod.POST)
	public ModelAndView searchTitle(ModelAndView modelAndView, String title, HttpServletRequest request) {
		list = (ArrayList<BlogBoardDTO>)boardDAO.boardSearch(title);
		
		modelAndView.addObject("boardList", list);
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		
		modelAndView.setViewName("index.jsp?page=board");
		return modelAndView;
	}
	@RequestMapping(value = "clickTitle", method = RequestMethod.GET)
	public ModelAndView clickTitle(Integer num, HttpServletRequest request, ModelAndView modelAndView) {
		BlogBoardDTO boardDTO = boardDAO.getContent(num);
		
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

		String today = boardDAO.today();
		modelAndView.addObject("today", today);
		
		modelAndView.addObject("user", joinDTO);
		modelAndView.setViewName("index.jsp?page=write");
		
		return modelAndView;
	}
	@RequestMapping(value="writeCompletion", method=RequestMethod.POST)
	public ModelAndView writeCompl(ModelAndView modelAndView, BlogBoardDTO boardDTO, HttpServletRequest request) {
		boardDAO.insertBoard(boardDTO);
		
		list = (ArrayList<BlogBoardDTO>)boardDAO.boardAll();
		modelAndView.addObject("boardList", list);
		try {
			hadleRequest(null,request, modelAndView);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JoinDTO joinDTO = (JoinDTO)request.getSession().getAttribute("loginUser");
		modelAndView.addObject("user", joinDTO);
		
		modelAndView.addObject("boardList", allArray.get(0));
		modelAndView.setViewName("index.jsp?page=board");
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
	public ModelAndView logout(ModelAndView modelAndView, HttpServletRequest request) {
		request.getSession(false).invalidate();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
}
