package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ConsumerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String dname = (String) session.getAttribute("name");
		
		if(dname == null) {
			response.sendRedirect(request.getContextPath()+"/drink/alert?name=dname");
			return false;
		}else {			return  true;
		}
		
	}

}
