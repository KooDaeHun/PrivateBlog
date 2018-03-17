package kr.ac.daegu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CheckoutController {
	
	@RequestMapping("checkout")
	public ModelAndView checkOut(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		if(loginUser == null) {
			modelAndView.setViewName("login");
			return modelAndView;
		}
		Cart cart = (Cart)session.getAttribute("cartList");
		if(cart == null || cart.isEmpty()) {
			modelAndView.setViewName("redirect:cartConfirm");
			return modelAndView;
		}
		modelAndView.addObject("loginUser",loginUser);
		List<ItemSet> itemList = cart.getItemList();
		modelAndView.addObject("itemList",itemList);
		
		Integer totalAmount = calculateTotalAmount(itemList);
		modelAndView.addObject("totalAmount",totalAmount);
		modelAndView.setViewName("checkout");
		return modelAndView;
	}
	public Integer calculateTotalAmount(List<ItemSet> itemList) {
		int totalAmount = 0;
		for(ItemSet itemSet : itemList) {
			int price = itemSet.getItem().getPrice().intValue();
			int quantity = itemSet.getQuantity().intValue();
			totalAmount = totalAmount + (price * quantity);
		}
		return new Integer(totalAmount);
	}
	
}
