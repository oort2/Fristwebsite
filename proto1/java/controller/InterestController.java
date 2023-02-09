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

import dao.DrinkMybatisDao;
import dao.InterestMybatisDao;
import model.Drink;
import model.Interest;

@Controller
@RequestMapping("/interest/")
public class InterestController {

	@Autowired
	InterestMybatisDao interestdao;

	@Autowired
	DrinkMybatisDao drinkdao;

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

	@GetMapping("interestForm")
	public String interestForm(String drinkserial) {
		m.addAttribute("drinkserial", drinkserial);
		return "/interest/interestForm";
	}

	@RequestMapping("interestPro")
	public String interestPro(Interest interest, String id, String drinkserial) throws Exception {
		String consumerid = (String) session.getAttribute("id"); 
		System.out.println(drinkserial);
		Interest inter = interestdao.selectOne(drinkserial, consumerid); 
		m.addAttribute("inter", inter);

		String msg = " ";
		String url = " ";
		if (consumerid != null) {
			if (inter == null) {
				int num = (int) interestdao.insertInterest(drinkserial, consumerid);
				if (num > 0) {
					msg = "이미 찜한 상품입니다.";
					url = "/interest/interestList";
				}msg = "찜했습니다.";
				 url = "/interest/interestList";
			} else {
				msg = "이미 찜한 상품입니다.";
				url = "/interest/interestList";
			}
		} else {
			msg = "로그인 하세요";
			url = "/consumer/loginForm";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

	@GetMapping("interestList")
	public String interestList(String drinkserial) {
		String consumerid = (String) session.getAttribute("id");
		
		List<Drink> dlist = drinkdao.selectInterest(drinkserial, consumerid);
		System.out.println(dlist);
		m.addAttribute("dlist", dlist);
		m.addAttribute("consumerid", consumerid);
		return "/interest/interestList";
	}

	
	@RequestMapping("interestDelete")
	public String interestDelete(String drinkserial) {
		String consumerid = (String) session.getAttribute("id");
		Interest inter = interestdao.selectOne(drinkserial, consumerid);
		
		System.out.println(inter+"11");
		m.addAttribute("drinkserial", drinkserial);
		return "/interest/interestDeleteForm";
	}

	@RequestMapping("interestDeletePro")
	public String interestDeletePro(String drinkserial) throws Exception {
		System.out.println("======="+drinkserial);
		String consumerid = (String) session.getAttribute("id");
		

		String msg = "찜하지 않은 상품입니다";
		String  url = "/drink/drinkList";

		int num = interestdao.deleteInterest(drinkserial, consumerid);
		if (num > 0) {
			msg = "찜해제 되었습니다";

			url = "/drink/drinkList";
		}
		

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

}
