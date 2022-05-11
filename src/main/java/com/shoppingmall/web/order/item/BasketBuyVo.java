package com.shoppingmall.web.order.item;

public class BasketBuyVo {
	private Long orderid; //
	private Long userid;//
	private Long itemcode;//
	private String useraddr1;
	private Long itemqty;//
	private String orderinfo;
	private String orderphon;
	private Long kartnum;
	public Long getOrderid() {
		return orderid;
	}
	public void setOrderid(Long orderid) {
		this.orderid = orderid;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public Long getItemcode() {
		return itemcode;
	}
	public void setItemcode(Long itemcode) {
		this.itemcode = itemcode;
	}
	public String getUseraddr1() {
		return useraddr1;
	}
	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
	public String getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(String orderinfo) {
		this.orderinfo = orderinfo;
	}
	public String getOrderphon() {
		return orderphon;
	}
	public void setOrderphon(String orderphon) {
		this.orderphon = orderphon;
	}
	public Long getKartnum() {
		return kartnum;
	}
	public void setKartnum(Long kartnum) {
		this.kartnum = kartnum;
	}
	
	
}
