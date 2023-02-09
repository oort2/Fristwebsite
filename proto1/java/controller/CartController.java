package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.CartMybatisDao;
import dao.ConsumerMybatisDao;
import dao.DrinkMybatisDao;
import dao.SubscriptMybatisDao;
import model.Board;
import model.Cart;
import model.CartInner;
import model.Consumer1;
import model.Drink;
import model.Interest;

@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired 
	CartMybatisDao cartdao;
	DrinkMybatisDao drinkdao;
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
		System.out.println("request ok");
		request.setAttribute("name", "/cart/*");
		return "/index"; 
	}
	
	@GetMapping("cartForm")
	public String cartForm(String cart_serial ) {
		List<CartInner> list = cartdao.cartInnerSelectAll(cart_serial);
		m.addAttribute("list",list);
		m.addAttribute("cart_serial", cart_serial);
		System.out.println(list);
		System.out.println("cartForm request ok");
		return "/cart/cartForm";	
	}  
	

	@RequestMapping("cartAdd")
	public String cartAdd(Drink drink, CartInner cartinner, String seraial, String cart_serial) {
		
		System.out.println(drink);
		String consumer_serial   = (String) session.getAttribute("id");
		Cart dcart = cartdao.cartSelectOne(consumer_serial);
		m.addAttribute("cart_serial", cart_serial);
		int nextcart = cartdao.nextCart();
		


		
		if (dcart == null) {
			int num = (int) cartdao.insertCart(nextcart,consumer_serial);

		} 
			int num2 = (int) cartdao.insertCartInner(consumer_serial, drink, cartinner.getCart_qty());
			
		    String msg = "장바구니에 담겼습니다.";
			String url = "/cart/cartForm";

			
			dcart = cartdao.cartSelectOne(consumer_serial);
			List<CartInner> list = cartdao.cartInnerSelectAll(consumer_serial);
			m.addAttribute("list",list);
			m.addAttribute("dcart", dcart);

			
			m.addAttribute("fileName", drink.getFile1());
			m.addAttribute("drink", drink);
			
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			
			return "/cart/cartForm";
	}
	
	@GetMapping("deleteCart")
	public String deleteCart(String drink_serial, String cart_serial) {	
	
			int num3 = cartdao.deleteCart(drink_serial);
		
			String msg = "삭제되었습니다";
			String url = "/cart/cartForm";								

			m.addAttribute("msg", msg);
			m.addAttribute("url", url + "?cart_serial=" + cart_serial);
			
		return "/alert";	
	}

}
