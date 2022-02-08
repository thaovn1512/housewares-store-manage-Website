package ptithcm.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.Entity.Admin;
import ptithcm.Entity.Users;

@Component
public class AuthorizeInterceptor  extends HandlerInterceptorAdapter {
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	// TODO Auto-generated method stub
	HttpSession session=request.getSession();
	Users user=(Users) session.getAttribute("user");
	Admin admin=(Admin) session.getAttribute("admin");
	if(user==null && admin==null) {
//		session.setAttribute("back-url", request.getRequestURI());
		response.sendRedirect(request.getContextPath() + "/login.htm");
		return false;
	}
	return true;
}
}
