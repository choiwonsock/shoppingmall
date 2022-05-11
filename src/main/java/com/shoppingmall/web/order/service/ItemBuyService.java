package com.shoppingmall.web.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.order.basket.BasketDaoImpl;
import com.shoppingmall.web.order.item.ItemBuyVo;
import com.shoppingmall.web.order.item.UserVo;

@Service
public class ItemBuyService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public ItemBuyService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public int itemBuyService(ItemBuyVo itemBuyVo, UserVo uservo, Long itemqty, Long itemcode) {
		if(itemBuyVo.getUseraddr1() == null) {//기존에 저장된 주소를 사용하는 경우
			
					ItemBuyVo itembuyvo = new ItemBuyVo();
					Long orderid = System.currentTimeMillis();
					itembuyvo.setOrderid(orderid);
					itembuyvo.setUserid(uservo.getUsernum());
					itembuyvo.setItemcode(itemcode);
					itembuyvo.setUseraddr1(uservo.getUseraddress());
					itembuyvo.setItemqty(itemqty);
					int result = basketDao.itembuyinsert(itembuyvo);
				
				
				return result;
		}else {//커맨드 객체로 주소를 입력받아 가져오는 경우
			
					ItemBuyVo itembuyvo = new ItemBuyVo();
					Long orderid = System.currentTimeMillis();
					itembuyvo.setOrderid(orderid);
					itembuyvo.setItemcode(itemcode);
					itembuyvo.setUserid(uservo.getUsernum());
					itembuyvo.setUseraddr1(itemBuyVo.getUseraddr1());
					itembuyvo.setItemqty(itemqty);
					int result = basketDao.itembuyinsert(itembuyvo);
					
					return result;
				}
			
			}
	}

