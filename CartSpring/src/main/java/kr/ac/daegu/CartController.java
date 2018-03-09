package kr.ac.daegu;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	IBoardDAO item_ibatis = new IBoardDAO();

	@RequestMapping(value = "cartAdd")
	public ModelAndView add(Integer item_ID, Integer quantity, HttpSession session) {

		ItemDTO selectedItem = item_ibatis.selectOne(item_ID);
		ItemSet itemSet = new ItemSet(selectedItem, quantity);


		Cart cart = new Cart();

		if (session.getAttribute("cartList") != null) {
			cart = (Cart) session.getAttribute("cartList");
		}


		cart.push(itemSet);
		session.setAttribute("cartList", cart);


		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addObject("message", selectedItem.getItem_Name() + "을(를)" + quantity + "개 카트에 추가했습니다.");
		modelAndView.addObject("cart", cart);


		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
		if (loginUser != null) {
			modelAndView.addObject("loginUser", loginUser);
		}
		return modelAndView;
	}

	@RequestMapping(value = "cartClear")
	public ModelAndView clear(HttpSession session) {


		Cart cart = new Cart();
		cart = null;

		session.setAttribute("cartList", cart);

		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addObject("message", "카트를 비웠습니다.");

		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
		if (loginUser != null) {
			modelAndView.addObject("loginUser", loginUser);
		}
		return modelAndView;
	}

	@RequestMapping(value = "cartConfirm")
	public ModelAndView confirm(HttpSession session) {

		Cart cart = (Cart) session.getAttribute("cartList");
		if (cart == null) {
			session.setAttribute("cartList", cart);
		}

		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addObject("cart", cart);

		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
		if (loginUser != null) {
			modelAndView.addObject("loginUser", loginUser);
		}
		return modelAndView;
	}
}
