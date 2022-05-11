package com.shoppingmall.web.order.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingmall.web.order.item.ItemVo;
import com.shoppingmall.web.order.item.SearchCommand;
import com.shoppingmall.web.order.service.ShopService;

@Controller
public class ShopController {
	private ShopService shopService;

	@Autowired
	public ShopController(ShopService shopService) {
		this.shopService = shopService;
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String fuck() {
		return "order/main";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String search(@ModelAttribute("cmd") SearchCommand searchCommand, HttpServletResponse response, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
//		UserVo uservo = (UserVo) session.getAttribute("member");
		System.out.println(session);
		if (searchCommand.getItemcatecode() == 1) {
			List<ItemVo> search = shopService.searchAll(searchCommand.getKeyword());
			model.addAttribute("search", search);
		} else {
			List<ItemVo> search = shopService.search(searchCommand.getKeyword(), searchCommand.getItemcatecode());
			model.addAttribute("search", search);
		}
		Cookie[] cookies = request.getCookies(); // 모든 쿠키를 배열로 가져온다.
		List<String> cook = new ArrayList<String>();// 그 쿠키를 리스트에 담을 리스트 생성한다.
		if (cookies != null) {// 만약에 쿠키배열이 값이 있다
				for (Cookie c : cookies) { // 쿠키
					try {
						System.out.println(c.getName());
						cook.add(URLDecoder.decode(c.getName(), "UTF-8"));
						for(int i = 0 ; i<cook.size();i++) {
							if(cook.get(i).equals("JSESSIONID")) {
								System.out.println(cook.get(i));
//									cook.remove("JSESSIONID");
									
								
							}
						}
						
						model.addAttribute("cookies", cook);
						
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
				
			for (int j = 0; j < cook.size(); j++) {
				if (!cook.get(j).equals(searchCommand.getKeyword())) {
					if (session != null) {
						Cookie cookie;
						try {
							cookie = new Cookie(URLEncoder.encode(searchCommand.getKeyword(), "utf-8"),
									URLEncoder.encode(searchCommand.getKeyword(), "utf-8"));
							cookie.setMaxAge(60 * 60 * 24);
							// cookie.setMaxAge(10);
							cookie.setPath("/");
							response.addCookie(cookie);
//							cook.add(URLDecoder.decode(cookie.getValue(), "UTF-8"));
//							model.addAttribute("cookies",cook);
							// model.addAttribute("cookie",searchCommand.getKeyword());
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					} else {
						if (request.getCookies() == null) {
							Cookie cookie;
							try {
								cookie = new Cookie(URLEncoder.encode(searchCommand.getKeyword(), "utf-8"),
										URLEncoder.encode(searchCommand.getKeyword(), "utf-8"));
								cookie.setMaxAge(60 * 60 * 24);
								// cookie.setMaxAge(10);
								cookie.setPath("/");
								response.addCookie(cookie);
//								cook.add(URLDecoder.decode(cookie.getValue(), "UTF-8"));
//								model.addAttribute("cookies",cook);
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						} else {
							Cookie[] cokie = request.getCookies();
							for (int i = 0; i < cokie.length; i++) {
								cokie[i].setMaxAge(0);
								cokie[i].setPath("/");
								response.addCookie(cokie[i]);
							}
						}
					}

				} else {
					continue;
				}
			}

		}
		return "list";
	}

}
