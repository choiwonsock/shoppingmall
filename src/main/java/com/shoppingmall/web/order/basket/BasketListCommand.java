package com.shoppingmall.web.order.basket;

public class BasketListCommand {
	private Long itemcode;
	private Long itemqty;
	
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
}
