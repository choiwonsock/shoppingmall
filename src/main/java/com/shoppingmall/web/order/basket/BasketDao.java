package com.shoppingmall.web.order.basket;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.shoppingmall.web.order.item.BasketBuyVo;
import com.shoppingmall.web.order.item.ItemBuyVo;
import com.shoppingmall.web.order.item.ItemVo;

@Repository
public interface BasketDao {
	public int basketinsert(BasketVo basketvo); //장바구니에 담는거
	public List<BasketVo> basketSelect(Long usernum); //회원번호를 가지고 장바구니 목록을 가져온다.
	public Long count(); //회원 번호를 가지고 그 회원이 가지고 있는 장바구니에 전체 수량체크
	public int update(Long usernum, Long itemcode); //
	public List<ItemVo> basketList(Long itemcode);
	public int basketbuyinsert (BasketBuyVo basketBuyVo);
	public int itembuyinsert (ItemBuyVo itemBuyVo);
	public int basketdelete(Long kartnum);
	public int itemdelete(Long ordernum);
	public List<ItemVo> search(String itemname, Long kategori);
	public List<ItemVo> searchAll(String itemname);
	public int plusupdate(Long kartnum);
	public int miusupdate(Long kartnum);
	public List<BasketVo> basSelect(Long kartnum);
	public int addressinsert(BasketBuyVo basketBuyVo);
}
