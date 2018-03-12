package kr.ac.daegu;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;


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
	IBoardDAO ibaties = new IBoardDAO();
	ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		list = (ArrayList<ItemDTO>)ibaties.selectAll();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		modelAndView.addObject("itemList",list);
		return modelAndView;
	}
	@RequestMapping("jsp_header")
	public String jsp_header() {
		return "jsp_header";
	}
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detailItem(int item_ID) {
		ItemDTO item = ibaties.selectOne(item_ID);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("detail");
		modelAndView.addObject("item",item);
		return modelAndView;
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("loginSuccess")
	public String loginSuccess() {
		return "loginSuccess";
	}
	@RequestMapping(value="loginProcess", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mav, String user_id, String password, HttpServletRequest request) {
		UserDTO user = ibaties.selectTwo(user_id);
		System.out.println(user_id);
		if(user == null) {
			System.out.println("아이디를 입력하세요.");
		} else {
			if(password.equals(user.getPassword())) {
				mav.addObject("user",user);
				request.getSession().setAttribute("loginUser", user); 
			} else {
				System.out.println("로그인되었습니다.");
			}
		}
		mav.setViewName("loginSuccess");
		return mav;
	}
	@RequestMapping("userEntry")
	public String userEntry() {
		return "userEntry";
	}
	
	
	
	
	@RequestMapping(value="userEntryProc", method=RequestMethod.GET)
	public ModelAndView userEntry(ModelAndView mav, UserDTO user) {
		ibaties.insertUser(user);
		
		mav.addObject("user",user);
		mav.setViewName("userEntrySuccess");
		return mav;
	}
	
}
