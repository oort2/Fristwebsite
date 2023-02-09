package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CartMybatisDao;
import dao.ConsumerMybatisDao;
import dao.DrinkMybatisDao;
import dao.OrderMybatisDao;
import model.Cart;
import model.CartInner;
import model.Consumer1;
import model.Drink;
import model.Order1;
import model.CartInner;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderMybatisDao orderdao;
	
	@Autowired
	CartMybatisDao cartdao;
	
	@Autowired
	DrinkMybatisDao drinkdao;
	
	@Autowired
	ConsumerMybatisDao consumerdao;

	Model m;
	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	@RequestMapping("index")
	public String index() {
		request.setAttribute("name", "/subscript/*");
		return "/index";
	}

	
	@PostMapping("orderDetailForm")
	public String orderDetailForm(@RequestParam(name="cart_serial") String cart_serial, CartInner cartinner, Consumer1 consumer ) {   
		m.addAttribute("cart_serial", cart_serial);  
		List<CartInner> list = cartdao.cartInnerSelectAll(cart_serial); 
		m.addAttribute("list", list);  
		
		
		String consumer_serial = (String) session.getAttribute("id");

		
		List<Consumer1> con = consumerdao.selectOneCon(cart_serial);
		m.addAttribute("con", con);

		
		
		
		
		m.addAttribute("cart_serial", cart_serial);
	
		return "/order/orderDetailForm";
	}

}
