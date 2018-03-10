package kr.ac.pohang;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	BlogBoardDAO ibaties = new BlogBoardDAO();
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
	public String login() {
		return "index.jsp?page=info";
	}
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public ModelAndView hadleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		list = (ArrayList<BlogBoardDTO>)ibaties.boardAll();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.jsp?page=board");
		modelAndView.addObject("boardList", list);
		return modelAndView;
	}
	@RequestMapping(value = "clickTitle", method = RequestMethod.GET)
	public ModelAndView clickTitle(Integer num) {
		BlogBoardDTO boardDTO = ibaties.getContent(num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.jsp?page=blogBoardContent");
		modelAndView.addObject("content", boardDTO);
		return modelAndView;
	}
	@RequestMapping("resume")
	public String resume() {
		return "index.jsp?page=resume";
	}
	
}
