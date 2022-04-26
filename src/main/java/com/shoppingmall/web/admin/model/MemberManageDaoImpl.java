package com.shoppingmall.web.admin.model;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.web.memberDto.MemberDto;

@Repository
public class MemberManageDaoImpl implements MemberManageDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 	
	
	@Override
	public Collection<MemberDto> memberList() {
		
		return sqlSessionTemplate.selectList("memberInfoAll");
	}
	
	@Override
	public Collection<MemberDto> memberSearchList(MemberSearchVo memberSearchVo){
		return sqlSessionTemplate.selectList("memberSearch",memberSearchVo);
	}
	
	@Override
	public void memberDelete(MemberDeleteVo id) {
		
		sqlSessionTemplate.delete("memberDelete", id);
	}
	
	@Override
	public void itemRegister(ItemRegisterVo itemRegisterVo) {
		
		sqlSessionTemplate.insert("itemRegister", itemRegisterVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemList(){
		return sqlSessionTemplate.selectList("itemList");
	}
	
	@Override
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo){
		return sqlSessionTemplate.selectList("itemSearch", memberSearchVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo){
		
		return sqlSessionTemplate.selectList("itemDetail", itemRegisterVo);
	}
	
	@Override
	public void itemUpdate(ItemRegisterVo itemRegisterVo) {
		sqlSessionTemplate.update("itemUpdate",itemRegisterVo);
	}
	
	@Override
	public int itemNameCheck(String itemName) {
		
		ItemNameCheckVo name = new ItemNameCheckVo();
		name.setItemName(itemName);
		
		return sqlSessionTemplate.selectOne("itemName", name);
	}
	
	@Override
	public void itemDelete(ItemDeleteVo itemName) {
	
		sqlSessionTemplate.delete("itemDelete", itemName);
	}
	
	@Override
	public Collection<OrderListVo> orderList(){
		return sqlSessionTemplate.selectList("orderList");
	}
	
	@Override
	public Collection<OrderDetailVo> orderDetail(OrderListVo orderListVo) {
		return sqlSessionTemplate.selectList("orderDetail", orderListVo);
	}
	
	@Override
	public void orderDelivery(OrderDetailVo orderDetailVo) {
		sqlSessionTemplate.update("orderDelivery", orderDetailVo);
	}
	
	@Override
	public void orderQtyChange(OrderDetailVo orderDetailVo) {
		if(orderDetailVo.getDelivery().equals("배송 완료")) {
			orderDetailVo.setDelivery("-");
			sqlSessionTemplate.update("orderQtyChange", orderDetailVo);
		}else if(orderDetailVo.getDelivery().equals("배송 중")) {
			orderDetailVo.setDelivery("+");
			sqlSessionTemplate.update("orderQtyChange", orderDetailVo);
		}
		
	}
	
	@Override
	public Collection<OrderDetailVo> orderQtyChangeSub(OrderDetailVo orderDetailVo){
		return sqlSessionTemplate.selectList("orderQtyChange_sub", orderDetailVo);
	}
}




