package kr.ac.daegu;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EndController {
	@Autowired
	private SaleDAO sale_ibatis;
	
	@Autowired
	private SaleLineDAO saleLine_ibatis;
	
	SaleDTO sale = new SaleDTO();
	
	@RequestMapping("end")
	public ModelAndView end(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		if(loginUser == null) {
			modelAndView.setViewName("login");
		}
		
		Cart cart = (Cart)session.getAttribute("cartList");
		if(cart == null || cart.isEmpty()) {
			modelAndView.setViewName("cart");
		}
		System.out.println(loginUser.getUser_id());
		
		createSale(loginUser, cart);
		
		sale_ibatis.insertSale(sale);
		
		for(SaleLineDTO saleLine : sale.getSaleLineList()) {
			saleLine_ibatis.insertSaleLine(saleLine);
		}
		cart.clearAll();
		modelAndView.addObject("loginUser", loginUser);
		modelAndView.setViewName("end");
		return modelAndView;
	}
	private SaleDTO createSale(UserDTO user, Cart cart) {
		sale.setSale_id(sale_ibatis.findMaxSaleId()+1);
		sale.setUser_id(user.getUser_id());
		Timestamp currentTime = getCurrentTime();
		sale.setUpdate_time(currentTime);
		
		List<ItemSet> itemList = cart.getItemList();
		for(int i=0; i<itemList.size(); i++) {
			ItemSet itemSet = (ItemSet)itemList.get(i);
			
			int saleLineId = i+1;
			SaleLineDTO saleLine = createSaleLine(sale, saleLineId, itemSet, currentTime);
			sale.addSaleLine(saleLine);
		}
		return sale;
	}
	private SaleLineDTO createSaleLine(SaleDTO sale, int saleLineId, ItemSet itemSet, Timestamp currentTime) {
		return new SaleLineDTO(sale.getSale_id(),new Integer(saleLineId), itemSet.getItem().getItem_ID(),currentTime, itemSet.getQuantity());
	}
	private Timestamp getCurrentTime() {
		return new Timestamp(Calendar.getInstance().getTimeInMillis());
	}
}
