//package com.sock.web.interceptor;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//public class LoginInterceptor extends HandlerInterceptorAdapter {
//	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);	
//		@Override
//	   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//			String Cookie = request.getParameter("useCookie");
//			System.out.println(Cookie);
//	    	logger.info("interceptor postHandel");
//	        HttpSession session = request.getSession();
//	        ModelMap modelMap = modelAndView.getModelMap();
//	        Object memberDto =  modelMap.get(Cookie);//
//	        System.out.println("use Cookie =" + modelMap.get(Cookie));
//	        
//	        if (memberDto != null) {
//	            logger.info("new login success");
//	            session.setAttribute("login", memberDto);
//	           // response.sendRedirect("/board/list");
//	            if(Cookie.equals("")) {
//	            	logger.info("안된다");
//	            	Cookie loginCookie = new Cookie("loginCookie",session.getId());
//	            	loginCookie.setPath("/");
//	            	loginCookie.setMaxAge(60*60*24*7);
//	            	response.addCookie(loginCookie);
//	            }
//	            
//	            Object destination = session.getAttribute("destination");
//	            Object URL = session.getAttribute("URL");
//	            response.sendRedirect(destination != null ? (String) destination : (String) URL);
//	        }
//
//	    }	
//		
//}
