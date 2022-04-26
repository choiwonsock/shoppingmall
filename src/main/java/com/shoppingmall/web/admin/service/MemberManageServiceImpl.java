package com.shoppingmall.web.admin.service;

import java.io.File;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.admin.model.ItemDeleteVo;
import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberDeleteVo;
import com.shoppingmall.web.admin.model.MemberManageDaoImpl;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.admin.utils.UploadFileUtils;
import com.shoppingmall.web.memberDto.MemberDto;

@Repository
public class MemberManageServiceImpl implements MemberManageService{
	
	@Autowired
	private MemberManageDaoImpl memberManageDaoImpl;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Override
	public Collection<MemberDto> memberAllList() {
		return memberManageDaoImpl.memberList();
	}
	
	@Override
	public Collection<MemberDto> memberSearchList(MemberSearchVo memberSearchVo){
		return memberManageDaoImpl.memberSearchList(memberSearchVo);
	}
	
	@Override
	public void memberDelete(String id) {
		
		MemberDeleteVo memberDeleteVo = new MemberDeleteVo();
		memberDeleteVo.setid(id);
		
		memberManageDaoImpl.memberDelete(memberDeleteVo);
	}
	
	@Override
	public void itemRegister(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception{

		try {
			
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		 
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		itemRegisterVo.setItemImage("imgUpload" + ymdPath + File.separator + fileName);
		System.out.println("이름 확인 : " + itemRegisterVo.getItemImage());
		itemRegisterVo.setItemThumbImage("imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		memberManageDaoImpl.itemRegister(itemRegisterVo);
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("등록 오류");
		}
		
	}
	
	@Override
	public Collection<ItemRegisterVo> itemList(){
		return memberManageDaoImpl.itemList();
	}
	
	@Override
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo){
		return memberManageDaoImpl.itemSearchList(memberSearchVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemDetail(String itemCode){
		ItemRegisterVo itemRegisterVo = new ItemRegisterVo();
		itemRegisterVo.setItemCode(itemCode);
		return memberManageDaoImpl.itemDetail(itemRegisterVo);
	}
	
	@Override
	public void itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception {
		
		if(file.getOriginalFilename() != "") {
			
			File delFile = new File("C:/image/"+itemRegisterVo.getItemImage());
			File delThumbFile = new File("C:/image/"+itemRegisterVo.getItemThumbImage());
			if(delFile.exists() && delThumbFile.exists()) {
				delFile.delete();
				delThumbFile.delete();
			}
			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);	
			itemRegisterVo.setItemImage("imgUpload" + ymdPath + File.separator + fileName);
			System.out.println("이름 확인 : " + itemRegisterVo.getItemImage());
			itemRegisterVo.setItemThumbImage("imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
			memberManageDaoImpl.itemUpdate(itemRegisterVo);
		}else {
			
			memberManageDaoImpl.itemUpdate(itemRegisterVo);
		}
	}
	
	@Override
	public int itemNameCheck(String itemName){
		return memberManageDaoImpl.itemNameCheck(itemName);
	}
	
	@Override
	public void itemDelete(String itemName) {
		
		ItemDeleteVo itemDeleteVo = new ItemDeleteVo();
		itemDeleteVo.setItemName(itemName);

		memberManageDaoImpl.itemDelete(itemDeleteVo);
	}
	
	@Override
	public Collection<OrderListVo> orderList(){
		return memberManageDaoImpl.orderList();
	}
	
	@Override
	public Collection<OrderDetailVo> orderDetail(String userId) {
		
		OrderListVo orderListVo = new OrderListVo();
		orderListVo.setOrderId(userId);
		
		return memberManageDaoImpl.orderDetail(orderListVo);
	}
	
	@Override
	public void orderDelivery(OrderDetailVo orderDetailVo) {
		memberManageDaoImpl.orderDelivery(orderDetailVo);
	}
	
	@Override
	public void orderQtyChange(OrderDetailVo orderDetailVo) {
		
		List<OrderDetailVo> list = (List<OrderDetailVo>)memberManageDaoImpl.orderQtyChangeSub(orderDetailVo);
		OrderDetailVo change = new OrderDetailVo();
		
		for(OrderDetailVo i : list) {
			change.setGdsNum(i.getGdsNum());
			change.setCartStock(i.getCartStock());
			change.setDelivery(orderDetailVo.getDelivery());
			memberManageDaoImpl.orderQtyChange(change);
		}
	}
}



