package com.shoppingmall.web.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.web.memberDto.MemberDto;
import com.shoppingmall.web.order.basket.BasketCommand;
import com.shoppingmall.web.order.service.BasketSelectService;

@Controller
public class BasketSelectController {
	private BasketSelectService basketSelectService;
	
	@Autowired
	public BasketSelectController(BasketSelectService basketSelectService) {
		this.basketSelectService = basketSelectService;
	}
	
	@RequestMapping("/order/basket")
	public String basketselect(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		MemberDto uservo = (MemberDto) session.getAttribute("loginuser");
		
		
		if(uservo != null) {
			List<BasketCommand> result = basketSelectService.basketselect(uservo.getNum());
			model.addAttribute("basketselect",result);
			return "order/basketList";
		}else {
			return "login";
		}
		
		
	}
}
	



