package com.shoppingmall.web.order.basket;

//@Alias("basket")
public class BasketVo {
	private Long kartnum;
	private Long itemcode;
	private Long itemqty;
	private Long usernum;
	
	
	public Long getKartnum() {
		return kartnum;
	}
	public void setKartnum(Long kartnum) {
		this.kartnum = kartnum;
	}
	public Long getItemcode() {
		return itemcode;
	}
	public void setItemcode(Long itemcode) {
		this.itemcode = itemcode;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
	public Long getUsernum() {
		return usernum;
	}
	public void setUsernum(Long usernum) {
		this.usernum = usernum;
	}
}
