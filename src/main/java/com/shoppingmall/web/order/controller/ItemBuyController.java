package com.shoppingmall.web.order.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.web.order.item.ItemBuyVo;
import com.shoppingmall.web.order.item.UserVo;
import com.shoppingmall.web.order.service.ItemBuyService;

@Controller
public class ItemBuyController {
	
	private ItemBuyService itemBuyService;

	@Autowired
	public ItemBuyController(ItemBuyService itemBuyService) {
		this.itemBuyService = itemBuyService;
	}
	@RequestMapping("/order/buy/item/{itemcode}/{itemqty}")
	public String itembuy(@PathVariable Long itemcode, @PathVariable Long itemqty, 
			@ModelAttribute("itembuyVo")ItemBuyVo itemBuyVo,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			UserVo uservo = (UserVo) session.getAttribute("member");
			int buy= itemBuyService.itemBuyService(itemBuyVo, uservo, itemqty, itemcode);
			if(buy == 1) {
				model.addAttribute("good","주문완료");
			}else {
				model.addAttribute("good","주문실패");
			}
		}else {
			model.addAttribute("buy", "로그인 후 이용 하십시요.");
		}
		return "order/buy";
	}

	


}
