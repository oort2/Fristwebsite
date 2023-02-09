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
@RequestMapping("/drink/")	
	public class DrinkController {
	
	 @Autowired 
			DrinkMybatisDao drinkdao;
			
	 Model m;
		HttpSession session;
		HttpServletRequest request;
		
		@ModelAttribute  
		void init(HttpServletRequest request, Model m) {
			this.request=request;
			this.m=m;
			session = request.getSession();
		}
	 
			@RequestMapping("index")
			public String index() {
				m.addAttribute("name", "/drink/*");
				return "/index";	
			}
			
		
			@GetMapping("drinkForm")
			public String drinkForm() {
				
				return "/drink/drinkForm";	
			}  
			
			@PostMapping("drinkPro")
            public String drinkPro(@RequestParam("file2")MultipartFile multipartFile, Drink drink) {

                String path = request.getServletContext().getRealPath("/") + "view/drink/img/";
                String filename = "";

                  if(!multipartFile.isEmpty()) { 
                      File file = new File(path,multipartFile.getOriginalFilename()); 
                      filename = multipartFile.getOriginalFilename();
                      drink.setFile1(filename);
                      try { 
                          multipartFile.transferTo(file);
                              } catch (IllegalStateException e) { 

                                  e.printStackTrace(); 
                              } catch (IOException e) {
                                  e.printStackTrace();
                              } 
                } System.out.println("bbb");
                     drink.setFile1(filename);

                     String msg = "게시물 등록 실패"; 
                     String url = "/drink/drinkForm";
                     System.out.println("ccc");
                     int num = drinkdao.insertDrink(drink);
                     if (num >0) { 
                      msg = "게시물 등록 성공";
                      url = "/drink/drinkList"; 
                  } 
                      m.addAttribute("msg",msg);
                      m.addAttribute("url", url);
                return "/alert";             }
			
			@GetMapping("drinkList")
			public String drinkList() {							
			List<Drink> list = drinkdao.selectAll();
		   
			m.addAttribute("list", list);
			return "/drink/drinkList";		}		
			
			@GetMapping("drinkListsaled")
			public String drinkListsaled() {							
			List<Drink> list = drinkdao.selectAllsaled();
			m.addAttribute("list", list);			
			return "/drink/drinkList"; 		}
			
			@GetMapping("drinkListhigh")
			public String drinkListhigh() {							
			List<Drink> list = drinkdao.selectAllhigh();
			m.addAttribute("list", list);
			return "/drink/drinkList"; 		}
			
			@GetMapping("drinkListlow")
			public String drinkListlow() {							
			List<Drink> list = drinkdao.selectAlllow();
			m.addAttribute("list", list);		
			return "/drink/drinkList"; 		}
			
			@GetMapping("drinkListricewine")
			public String drinkListricewine() {							
			List<Drink> list = drinkdao.selectAllricewine();
			m.addAttribute("list", list);		
			return "/drink/drinkList"; 		}
			
			@GetMapping("drinkListsoju")
			public String drinkListsoju() {							
			List<Drink> list = drinkdao.selectAllsoju();
			m.addAttribute("list", list);		
			return "/drink/drinkList"; 		}
			
			
			@RequestMapping("selectLocation")
			public String selectLocation() {	
			String location = request.getParameter("location");			
			switch (location){
			case "서울경기":
				location = "서울경기"; break;
			case "경상도":
				location = "경상도"; break;
			case "전라도":
				location = "전라도"; break;
			case "충청도":
				location = "충청도"; break;
			case "강원도":
				location = "강원도"; break;
			case "제주도":
				location = "제주도"; break; }
			System.out.println(location);
		 	
			List<Drink> list = drinkdao.selectLocation(location);
			System.out.println("22"+ list); 
			
			m.addAttribute("list", list);	
			
			return "/drink/drinkList"; 		}
		
			@RequestMapping("drinkInfo")  
			public String drinkInfo(String serial) {
				Drink drink = drinkdao.selectOne(serial);					
			m.addAttribute("drink", drink);
								
				return "/drink/drinkInfo"; 						
			}
			
					@RequestMapping("drinkUpdateForm")
			public String drinkUpdateForm(String serial) {
						Drink drink = drinkdao.selectOne(serial);
				
		        	m.addAttribute("drink", drink);
				return "/drink/drinkUpdateForm";	 
				
				}
			
			
			@RequestMapping("drinkUpdatePro")
			public String drinkUpdatePro(@RequestParam("f") MultipartFile multipartFile, Drink drink) throws Exception  {
				 
				Drink dbdrink = drinkdao.selectOne(drink.getSerial());
				
				String path = request.getServletContext().getRealPath("/") + "view/drink/img/";
			
				
				if (!multipartFile.isEmpty()) {
					File file = new File(path, multipartFile.getOriginalFilename());
					String filename = multipartFile.getOriginalFilename();
					drink.setFile1(filename);
					
					try {
						multipartFile.transferTo(file);
					} catch (IllegalStateException e) {
						
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				} else {
					drink.setFile1(dbdrink.getFile1());
				}
				
				String msg = "정보 수정이 실패 했습니다.";
				String url = "/drink/drinkUpdateForm?serial=" +drink.getSerial();
				
				if(drinkdao.updateDrink(drink)>0){
					msg = "수정 완료";
					url = "/drink/drinkInfo?serial="+drink.getSerial();
					} 
					m.addAttribute("msg", msg);
					m.addAttribute("url", url);
					return "/alert";
			}	
				
			@RequestMapping("drinkDelete")
			public String drinkDelete(String serial) {
				Drink drink = drinkdao.selectOne(serial);
				System.out.println("drinkDelete");
	        	m.addAttribute("drink", drink);
			return "/drink/drinkDeleteForm";	 							
			}

			@RequestMapping("drinkDeletePro")
			public String drinkDeletePro(String serial) throws Exception {
				Drink drink = drinkdao.selectOne(serial);
				System.out.println("1"+drink);
				String msg = "실패 했습니다";
				String url = "/drink/drinkList";
				
					Drink dserial = drinkdao.selectOne(serial);
					System.out.println("1"+dserial);
						int num = drinkdao.deleteDrink(serial);
						if (num > 0) {
							msg = "삭제되었습니다";
							session.invalidate(); 
							url = "/drink/drinkList";					} 					

					m.addAttribute("msg", msg);
					m.addAttribute("url", url);
				return "/alert";
			}
			
			
			
			
			
			@GetMapping("cartForm")
			public String cartForm() {

				System.out.println("cart ok");
				return "/drink/cartForm";
			}
				
			@RequestMapping("drinkSearch")
			public String drinksearch() {
				
			return "/drink/drinkSearch";	 							
			}
			
			
			@RequestMapping("drinkListSearch")
			public String drinkListSearch() {
				String name = request.getParameter("name");
				Drink drink = drinkdao.selectsearch(name);
				m.addAttribute("drink", drink);
			return "/drink/drinkListSearch";	 							
			}
			
		}
