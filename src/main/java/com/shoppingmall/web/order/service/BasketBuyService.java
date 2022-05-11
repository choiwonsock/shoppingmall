package com.shoppingmall.web.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.order.basket.BasketDaoImpl;
import com.shoppingmall.web.order.basket.BasketVo;
import com.shoppingmall.web.order.item.BasketBuyVo;

@Service
public class BasketBuyService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public BasketBuyService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public List<BasketVo> basketbuymius(Long kartnum) {
		basketDao.miusupdate(kartnum);
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}
	public List<BasketVo> basketbuyplus(Long kartnum) {
		basketDao.plusupdate(kartnum);
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}
	public List<BasketVo> basSelect(Long kartnum){
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}
//	public int addressinsert(BasketBuyVo basketBuyVo, UserVo uservo) {
	public int addressinsert(BasketBuyVo basketBuyVo, String test) {
		if(basketBuyVo.getUseraddr1().equals("0")) {//기존주소 사용
			basketBuyVo.setUseraddr1(test);
//			basketBuyVo.setAddress(uservo.getUseraddress());
			int result = basketDao.addressinsert(basketBuyVo);
			return result;
		}else {
			int result = basketDao.addressinsert(basketBuyVo);
			return result;
		}
	}
	public int basketBuyService(BasketBuyVo basketBuyVo, Long test) {
		//UserVo uservo
//				List<BasketVo> basketselect = basketDao.basketSelect(uservo.getUsernum());
		List<BasketVo> basketselect = basketDao.basSelect(basketBuyVo.getKartnum());
				List<BasketBuyVo> buylist = new ArrayList<BasketBuyVo>();
				for(int i = 0 ; i < basketselect.size() ; i++) {
					BasketBuyVo basketbuyvo = new BasketBuyVo();
					Long orderid = System.currentTimeMillis();
					basketbuyvo.setOrderid(orderid);
					basketbuyvo.setKartnum(basketselect.get(i).getKartnum());
					basketbuyvo.setItemcode(basketselect.get(i).getItemcode());
//					basketbuyvo.setUsernum(uservo.getUsernum());
					basketbuyvo.setUserid(test);
					basketbuyvo.setItemqty(basketselect.get(i).getItemqty());
					buylist.add(basketbuyvo);
					//장바구니 번호를 가지고 딜리트 해서 지우기
					basketDao.basketdelete(basketselect.get(i).getKartnum());
				}
				for(int i = 0 ; i < buylist.size() ; i++) {
					int result = basketDao.basketbuyinsert(buylist.get(i));
					if(result != 0) {
						System.out.println("들어감");
					}else {
						System.out.println("안들어감");
					}
					
				}
				
				return 1;
		
	}
}
