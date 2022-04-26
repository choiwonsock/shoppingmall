package com.shoppingmall.web.admin.service;

import java.util.Collection;

import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.memberDto.MemberDto;

public interface MemberManageService {
	
	public Collection<MemberDto> memberAllList();
	public Collection<MemberDto> memberSearchList(MemberSearchVo memberSearchVo);
	public void memberDelete(String id);
	public void itemRegister(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception;
	public Collection<ItemRegisterVo> itemList();
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo);
	public Collection<ItemRegisterVo> itemDetail(String itemCode);
	public void itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception;
	public int itemNameCheck(String itemName);
	public void itemDelete(String itemName);
	public Collection<OrderListVo> orderList();
	public Collection<OrderDetailVo> orderDetail(String userId);
	public void orderDelivery(OrderDetailVo orderDetailVo);
	public void orderQtyChange(OrderDetailVo orderDetailVo);
}
