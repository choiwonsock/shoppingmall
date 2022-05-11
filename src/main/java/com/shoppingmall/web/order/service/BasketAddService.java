package com.shoppingmall.web.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.order.basket.BasketDaoImpl;
import com.shoppingmall.web.order.basket.BasketVo;

@Service
public class BasketAddService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public BasketAddService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	
	public int basketinsert(BasketVo basketvo, Long usernum, Long itemcode, Long itemqty) {
		Long kartnum = System.currentTimeMillis();
		
		basketvo.setUsernum(usernum);
		basketvo.setItemcode(itemcode);
		basketvo.setKartnum(kartnum);
		basketvo.setItemqty(itemqty);
		
		int result=basketDao.basketinsert(basketvo);
		if(result != 0) {
			return 1;
		}
		return 0;
	}
	
}
