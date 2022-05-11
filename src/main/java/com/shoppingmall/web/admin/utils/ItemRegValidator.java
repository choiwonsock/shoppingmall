package com.shoppingmall.web.admin.utils;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shoppingmall.web.admin.model.ItemRegisterVo;

@Component
public class ItemRegValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ItemRegisterVo.class.equals(clazz);
	}
	
	@Override
	public void validate(Object obj, Errors error) {
		ValidationUtils.rejectIfEmpty(error, "itemPrice", "itemName.empty","상품명을 입력해주세요.");
		ValidationUtils.rejectIfEmpty(error, "itemDesc", "itemDesc.empty","상품정보를 입력해주세요");
		ValidationUtils.rejectIfEmpty(error, "itemQty", "itemDesc.empty","상품수량을 입력해주세요");
		ValidationUtils.rejectIfEmpty(error, "itemSize", "itemQty.empty","상품수량을 입력해주세요");
		
	}
}
