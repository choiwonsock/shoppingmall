package com.sock.web.controller;


import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sock.web.memberDto.MemberDto;
import com.sock.web.service.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	private LoginService loginService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	@Autowired
	
	
	//로그인(get)
	@RequestMapping(value="/member/login", method = RequestMethod.GET)
	public String getlogin(@ModelAttribute MemberDto memberDto) throws Exception{
		
		
		logger.info("get login");
	
		return "login";
	}
	
	//로그인 (post)
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute MemberDto memberDto, HttpServletRequest request, RedirectAttributes rttr) {
	
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		ModelAndView mav = new ModelAndView();
		MemberDto login = loginService.viewlogin(memberDto);
		
		if(login != null) {
			rawPw = memberDto.getPw();
			encodePw = login.getPw();
		}
		
		if(true == passEncoder.matches(rawPw, encodePw)) {
			login.setPw("");
			session.setAttribute("loginuser", login);
			session.setAttribute("name", login.getName());
			session.setAttribute("admin", login.getAdmin());
			
			mav.setViewName("/main");
				
				
			
		} else {
			rttr.addFlashAttribute("result", 0);
			mav.addObject("msg", "failure");
			mav.setViewName("/login");
			
		}
		return mav;
	}
	
		


	
	//로그아웃
	@RequestMapping(value = "/member/logout",method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("get logout");
		loginService.logout(session);
		
		return "redirect:/member/main";
	}
}

//if(Cookie.equals("1")) {
//	int amount = 60*60*24*7;
//	Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
//	sessionService.keepLogin(memberDto.getId(), session.getId(), sessionLimit);
//
//}
