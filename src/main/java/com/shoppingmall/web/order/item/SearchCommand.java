package com.shoppingmall.web.order.item;

public class SearchCommand {
	private String keyword;
	private Long itemcatecode;
	
	
	public Long getItemcatecode() {
		return itemcatecode;
	}
	public void setItemcatecode(Long itemcatecode) {
		this.itemcatecode = itemcatecode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
