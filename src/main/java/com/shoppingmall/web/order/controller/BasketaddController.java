package com.shoppingmall.web.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.web.order.basket.BasketVo;
import com.shoppingmall.web.order.service.BasketAddService;

@Controller
public class BasketaddController {
	private BasketAddService basketService;
	
	@Autowired
	public BasketaddController(BasketAddService basketService) {
		this.basketService = basketService;
	}
	@RequestMapping("/basket/item/{itemcode}/{itemqty}") //url로 상품 품번과 수량을 요청해줘야 한다.
	public String basketinfo(@PathVariable Long itemcode, @PathVariable Long itemqty,
							BasketVo basketvo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
//		UserVo uservo = (UserVo) session.getAttribute("member");
		Long test = (long)1;
//		int result = basketService.basketinsert(basketvo, uservo.getUsernum(), itemcode, itemqty);
		int result = basketService.basketinsert(basketvo, test, itemcode, itemqty);
		if(result == 1) {
			model.addAttribute("basket","장바구니에 추가 하셨습니다.");
			}
		}else {
			model.addAttribute("basket","로그인 후 이용 하십쇼");
		}
		return "order/jmain";
	}
	
}
