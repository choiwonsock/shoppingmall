package com.shoppingmall.web.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoppingmall.web.order.basket.BasketVo;
import com.shoppingmall.web.order.item.AjaxCommand;
import com.shoppingmall.web.order.item.BasketBuyVo;
import com.shoppingmall.web.order.item.ItemBuyQtyVo;
import com.shoppingmall.web.order.service.BasketBuyService;

@Controller
public class BasketBuyController {

	private BasketBuyService basketBuyService;
	private List<Long> kartnums;

	@Autowired
	public BasketBuyController(BasketBuyService basketBuyService) {
		this.basketBuyService = basketBuyService;
	}

	public void setKartnums(List<Long> kartnums) {
		this.kartnums = kartnums;
	}

	@RequestMapping(value = "/order/buy", method = RequestMethod.POST)
	public String test(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		String[] check = request.getParameterValues("basketbuy");
		if (check != null) {
			List<Long> checks = new ArrayList<Long>();
			for (int i = 0; i < check.length; i++) {
				Long test = Long.parseLong(check[i]);
				checks.add(test);
				setKartnums(checks);
			}

		} else {
			redirect.addFlashAttribute("error", "주문 채크 부탁드립니다.");

			return "redirect:/order/basket";
		}

		return "order/buy";
	}

	@RequestMapping("/order")
	public String order(@ModelAttribute BasketBuyVo itembuyVo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
//		if(session != null) {
//		UserVo uservo = (UserVo) session.getAttribute("member");
//	}
		String test = "내 마음속";
		try {
			for (int i = 0; i < kartnums.size(); i++) {
				List<BasketVo> result = basketBuyService.basSelect(kartnums.get(i));
				BasketBuyVo basketbuyvo = new BasketBuyVo();
				basketbuyvo.setKartnum(result.get(0).getKartnum());
				basketbuyvo.setItemqty(result.get(0).getItemqty());
//				HttpSession session = request.getSession(false);
//				if (session != null) {
					Long test1 = (long) 1;
//					UserVo uservo = (UserVo) session.getAttribute("member");

					int buy = basketBuyService.basketBuyService(basketbuyvo, test1);

//				int buy = basketBuyService.basketBuyService(join.get(i), uservo);
					if (buy == 1) {
						model.addAttribute("good", "주문완료");
					} else {
						model.addAttribute("good", "주문실패");
					}
//				} else {
//					model.addAttribute("buy", "로그인 후 이용 하십시요.");
//				}
			}
			String address= itembuyVo.getUseraddr1().substring(2);
			for (int i = 0; i < kartnums.size(); i++) {
				itembuyVo.setKartnum(kartnums.get(i));
				itembuyVo.setUseraddr1(address);
//			int result = basketBuyService.addressinsert(itembuyVo,uservo);
				int result = basketBuyService.addressinsert(itembuyVo, test);
				if (result != 0) {
					model.addAttribute("good", "주문 성공~!!!");
				} else {
					model.addAttribute("good", "주문 실패ㅠㅠ");
				}
			}

		} catch (Exception e) {
			for (int i = 0; i < kartnums.size(); i++) {
				itembuyVo.setKartnum(kartnums.get(i));
//			int result = basketBuyService.addressinsert(itembuyVo,uservo);
				int result = basketBuyService.addressinsert(itembuyVo, test);
				if (result != 0) {
					model.addAttribute("good", "주문 성공~!!!");
				} else {
					model.addAttribute("good", "주문 실패ㅠㅠ");
				}
			}
		}

		return "home";
	}

	@RequestMapping("/buy/qty")
	@ResponseBody
	public AjaxCommand basketbuymius(@RequestBody ItemBuyQtyVo vo, Model model) {
		if (vo.getValue().equals("-")) {
			List<BasketVo> result = basketBuyService.basketbuymius(vo.getKartnum());
			AjaxCommand com = new AjaxCommand();
			com.setKartnum(result.get(0).getKartnum());
			com.setItemqty(result.get(0).getItemqty());
			com.setItemprice(vo.getItemprice());
			return com;
		} else {
			List<BasketVo> result = basketBuyService.basketbuyplus(vo.getKartnum());
			AjaxCommand com = new AjaxCommand();
			com.setKartnum(result.get(0).getKartnum());
			com.setItemqty(result.get(0).getItemqty());
			com.setItemprice(vo.getItemprice());
			return com;
		}

	}

	@RequestMapping("buy/check")
	@ResponseBody
	public String checkbox(@RequestBody String kartnum) {
		System.out.println(kartnum);
		return kartnum;
	}

}
