package com.shoppingmall.web.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.web.order.service.ItemDeleteService;

@Controller
public class ItemDeleteController {
	private ItemDeleteService itemdeleteservice;
	
	@Autowired
	public ItemDeleteController(ItemDeleteService itemdeleteservice) {
		this.itemdeleteservice = itemdeleteservice;
	}
	@RequestMapping(value = "/order/buy/item/delete/{ordernum}")
	public String itemdelete(@PathVariable Long ordernum, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			int result = itemdeleteservice.itemdelete(ordernum);
			if(result != 0) {
				model.addAttribute("del","주문이 취소 되었습니다.");
			}else {
				model.addAttribute("del","주문 취소가 실패 했습니다.");
			}
			
		}else {
			model.addAttribute("buy", "로그인 후 이용 하십시요.");
		}
		
		return "order/search";
	}
}
