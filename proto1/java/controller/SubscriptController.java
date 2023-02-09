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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.ConsumerMybatisDao;
import dao.DrinkMybatisDao;
import dao.SubscriptMybatisDao;
import model.Consumer1;
import model.Drink;
import model.Interest;
import model.Subscript;


@Controller
@RequestMapping("/subscript/")
public class SubscriptController {

	@Autowired 
	SubscriptMybatisDao subdao;
	
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
			System.out.println("request ok");
			request.setAttribute("name", "/subscript/*");
			return "/index"; 
		}
		
		@GetMapping("subForm")
		public String drinkForm() {
			
			String login = (String) session.getAttribute("id");
			
			Consumer1 consumer = consumerdao.selectOne(login);
			m.addAttribute("consumer", consumer);
			
			List<Drink> list = subdao.selectAll();
			m.addAttribute("list", list);
			
			return "/subscript/subForm";	
		}
		
		
		
		@GetMapping("subInsertPro")
		public String subInsertPro(Subscript subscript, String serial) {
			Drink drink = drinkdao.selectOne(serial);
			String msg = "등록실패했습니다";
			String url = "/drink/drinkInfo?serial=" + serial;
			
			int dnum = subdao.updateInsertDrink(serial);
			int num = subdao.insertSubscript(serial);
			if (num > 0 && dnum > 0) { 
				msg = "구독리스트에 등록되었습니다.";
				url = "/drink/drinkList";					
				} 					

			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "alert";
		}
		
		@GetMapping("subList")
		public String drinkList() {	
		System.out.println();	
		List<Drink> list = subdao.selectAll();
		m.addAttribute("list", list);
		return "/subscript/subList";		}

		@GetMapping("subDeletePro")
		public String subDeletePro(String serial) {							
			
			String msg = "실패 했습니다";
			String url = "/subscript/subList";
			
			int dnum = subdao.updateDeleteDrink(serial);
			int num = subdao.deleteSubscript(serial);
				if (num > 0 && dnum > 0) {
					msg = "삭제되었습니다";
					url = "/subscript/subList";				
					} 					

				m.addAttribute("msg", msg);
				m.addAttribute("url", url);
			return "/alert";
		}
		
		
		@RequestMapping("submyPro")
		public String subPro(String subscript) {
			String login = (String) session.getAttribute("id");
			String msg = "로그인 후 구독이 가능합니다.";
			String url = "/consumer/loginForm";
			
			Consumer1 consumer1 = consumerdao.selectOne(login);

			if (subscript.equals("2")) {
				consumerdao.deleteUpdateScript(login);
				msg = consumer1.getName() + "구독취소.";
				url = "/subscript/subForm";
			} else if (subscript.equals("1")) {
				consumerdao.addUpdateScript(login);
				msg = "구독성공";
				url = "/subscript/subForm";
			}
			
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "/alert";
		}
		
		@GetMapping("submylist")
		public String submylist() {
			String login = (String) session.getAttribute("id");
			
			String subscript = consumerdao.submyList(login);
			m.addAttribute("subscript", subscript);

			return "/subscript/submylist";
		}
		
		@RequestMapping("submylistPro")
		public String submylistPro(String subscript) {
			String login = (String) session.getAttribute("id");
			String msg = "구독중이 아닙니다.";
			String url = "/subscript/submylist";

			Consumer1 consumer1 = consumerdao.selectOne(login);

			if (subscript.equals("2")) {
				consumerdao.deleteUpdateScript(login);
				msg = consumer1.getName() + "구독이 취소되었습니다.";
				url = "/subscript/submylist";
			} 
		
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);

			return "/alert";
		}
}
