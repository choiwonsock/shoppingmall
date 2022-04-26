package com.shoppingmall.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	 public boolean preHandle(HttpServletRequest req,
	    HttpServletResponse res, Object obj) throws Exception {
	  
	  HttpSession session = req.getSession();
	  int member = (int)session.getAttribute("admin");
	  
	  System.out.println("member:" +member);
	  if(member != 1) {
		  
	   res.sendRedirect("/web/");
	   return false;
	  }
	  
	  return true;
	 }
}
