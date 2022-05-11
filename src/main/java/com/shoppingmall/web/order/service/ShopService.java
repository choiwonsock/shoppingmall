package com.shoppingmall.web.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.order.basket.BasketDaoImpl;
import com.shoppingmall.web.order.item.ItemVo;

@Service
public class ShopService {
private BasketDaoImpl basketDao;
	
	@Autowired
	public ShopService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public List<ItemVo> search(String itemname, Long kategori){
		List<ItemVo> result = basketDao.search(itemname, kategori);
		return result;
	}
	public List<ItemVo> searchAll(String itemname){
		List<ItemVo> result = basketDao.searchAll(itemname);
		return result;
	}
}
