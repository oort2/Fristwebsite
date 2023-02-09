 package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.DrinkMybatisDao;
import model.Consumer1;
import model.Drink;


@Controller
@RequestMapping("/map/")	
	public class MapController {
			
	    Model m;
		HttpSession session;
		HttpServletRequest request;
		
		@ModelAttribute  
		void init(HttpServletRequest request, Model m) {
			this.request=request;
			this.m=m;
			session = request.getSession();
		}
	 
		
		
			@GetMapping("mapForm")
			public String drinkForm() {
				
				return "/map/mapForm";	
			}  
			
		
				
			
		}
