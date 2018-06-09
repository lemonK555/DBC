package com.kk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kk.form.UserForm;
import com.kk.model.User;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//String url = request.getRequestURI();
		
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		if(userForm != null){
			return true;
		}
		
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/page/login.jsp").forward(request, response);
		
		
		
		return false;
	}

}
