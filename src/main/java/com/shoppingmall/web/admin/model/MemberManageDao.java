package com.shoppingmall.web.admin.model;

import java.util.Collection;

import com.shoppingmall.web.memberDto.MemberDto;

public interface MemberManageDao {

	public Collection<MemberDto> memberList();
	public Collection<MemberDto> memberSearchList(MemberSearchVo memberSearchVo);
	public void memberDelete(MemberDeleteVo id);
	public void itemRegister(ItemRegisterVo itemRegisterVo);
	public Collection<ItemRegisterVo> itemList();
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo);
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo);
	public void itemUpdate(ItemRegisterVo itemRegisterVo);
	public int itemNameCheck(String itemName);
	public void itemDelete(ItemDeleteVo itemName);
	public Collection<OrderListVo> orderList();
	public Collection<OrderDetailVo> orderDetail(OrderListVo orderListVo);
	public void orderDelivery(OrderDetailVo orderDetailVo);
	public void orderQtyChange(OrderDetailVo orderDetailVo);
	public Collection<OrderDetailVo> orderQtyChangeSub(OrderDetailVo orderDetailVo);
}
