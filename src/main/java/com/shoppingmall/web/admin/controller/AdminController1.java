package com.shoppingmall.web.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.HomeController;
import com.shoppingmall.web.admin.model.ItemRegisterVo;

import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.admin.service.MemberManageServiceImpl;
import com.shoppingmall.web.memberDto.MemberDto;

@Controller
public class AdminController1 {
 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	@Autowired
	private MemberManageServiceImpl memberManageServiceImpl;
	

	 
	@RequestMapping( value = "/admin/memberManage", method = RequestMethod.GET)
	public String memberManage(Model model) {
		
		logger.info("회원 관리 페이지입니다.");
			
		List<MemberDto> list = (List<MemberDto>)memberManageServiceImpl.memberAllList();
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/memberSearch", method = RequestMethod.POST)
	public String memberSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		logger.info("회원 검색 페이지입니다. :" + memberSearchVo.getSearch());
			
		
		List<MemberDto> list = (List<MemberDto>)memberManageServiceImpl.memberSearchList(memberSearchVo);
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/itemReg", method = RequestMethod.GET)
	public String itemRegForm(ItemRegisterVo itemRegisterVo) {
		
		logger.info("상품 등록 페이지입니다.");
		
		return "admin/itemReg";
	}

	@RequestMapping( value = "/admin/itemReg", method = RequestMethod.POST)
//	@ResponseBody
	public String itemRegService(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception{
		 
		logger.info("상품 등록 페이지입니다.");    
	
		memberManageServiceImpl.itemRegister(itemRegisterVo, file);
	
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		logger.info("상품 목록 페이지입니다.");
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		
		model.addAttribute("itemList", itemList);

		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemSearch", method = RequestMethod.POST)
	public String itemSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		logger.info("상품 검색 페이지입니다. :" + memberSearchVo.getSelect());
			
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemSearchList(memberSearchVo);
		System.out.println(itemList);
		model.addAttribute("itemList",itemList);
		
		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemDetail/{itemCode}", method = RequestMethod.GET)
	public String itemDetail(@PathVariable("itemCode") String itemCode, Model model) {
		
		logger.info("상품 상세 페이지입니다.");
		
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemCode);
		
		model.addAttribute("itemDetail", itemDetail);

		return "admin/itemDetail";
	}
	
	@RequestMapping( value = "/admin/itemUpdateForm/{itemCode}", method = RequestMethod.GET)
	public String itemUpdateForm(@PathVariable("itemCode") String itemCode, Model model) {
		
		logger.info("상품 수정 페이지입니다.");
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemCode);
		
		model.addAttribute("itemDetail",itemDetail);
		
		return "admin/itemUpdateForm";
	}
	
	@RequestMapping( value = "/admin/itemUpdate", method = RequestMethod.POST)
	public String itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file, Model model) throws Exception{
		
		logger.info("상품 수정 내용 전송 페이지입니다.");
		
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("vo: 내용" + itemRegisterVo.getItemName());
		memberManageServiceImpl.itemUpdate(itemRegisterVo, file);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/order", method = RequestMethod.GET)
	public String orderList(Model model) {
		
		logger.info("주문 관리 페이지입니다.");

		List<OrderListVo> orderList = (List<OrderListVo>)memberManageServiceImpl.orderList();
		
		model.addAttribute("orderList", orderList);
		
		return "admin/order";
	}
	
	@RequestMapping( value = "/admin/orderDetail/{orderId}", method = RequestMethod.GET)
	public String orderDetail(@PathVariable("orderId") String orderId ,Model model) {
		
		logger.info("주문 상세 페이지입니다.");
		
		List<OrderDetailVo> orderDetail = (List<OrderDetailVo>)memberManageServiceImpl.orderDetail(orderId);
		
		model.addAttribute("orderDetail", orderDetail);
		
		return "admin/orderDetail";
	}
	
	@RequestMapping( value = "/admin/orderDelivery", method = RequestMethod.POST)
	public String orderDelivery(@RequestParam("delivery") String delivery, OrderDetailVo vo, Model model) {
		 
		logger.info("배송 상태 페이지입니다.");
		
		if(vo.getDelivery().equals("배송 중")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);
		}
		else if (vo.getDelivery().equals("배송 완료")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);
			
		}
		
		return "redirect:/admin/orderDetail/"+vo.getOrderId();
	}
	
	
	@RequestMapping( value = "/admin/memberDelete", method = RequestMethod.GET)
	@ResponseBody
	public String memberDelete(String id, Model model) {
		
		logger.info("회원 삭제 페이지입니다.memberId : " + id);
	 
		try {
			memberManageServiceImpl.memberDelete(id);
			return "1";
		}catch(DataIntegrityViolationException e) {
//			e.printStackTrace();
			return "0";
		}
//		return "redirect:/admin/memberManage";
	}
	
	@ResponseBody
	@RequestMapping( value = "/admin/itemNameCheck")
	public String itemNameCheck(String itemName) {
		
		logger.info("상품명 중복 확인 페이지입니다.");
		
		int result = memberManageServiceImpl.itemNameCheck(itemName);
		
		return Integer.toString(result);
	}
	
	@RequestMapping( value = "/admin/itemDelete/{itemName}", method = RequestMethod.GET)
	public String itemDelete(@PathVariable("itemName") String itemName, Model model) {
		
		logger.info("상품 삭제 페이지입니다." + itemName);
	
		memberManageServiceImpl.itemDelete(itemName);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/imageUpload", method = RequestMethod.POST)
//	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, 
			MultipartFile upload) throws Exception{
		
		logger.info("textarea 이미지 업로드 페이지입니다.");
		//랜던 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
		try {
			//파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//이미지 경로 생성
			String path = "D:/imgUpload";
			System.out.println("path : " + path);
			String ckUploadPath = path+ File.separator + uid + "_" + fileName;
			File folder = new File(path);
			
			//해당 디렉토리 확인
			if(!folder.exists()) {
				try {
					//폴더 생성
					folder.mkdirs();
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
//			outputStream에 저장된 데이터를 전송하고 초기화
			out.flush(); 
			
//			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl =  "/imgUpload/" + uid + "_" + fileName;
	
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();
			
//			JsonObject json = new JsonObject();
//			json.addProperty("uploaded", 1);
//			json.addProperty("fileName", fileName);
//			json.addProperty("url", fileUrl);
//			printWriter.println(json);
//			printWriter.flush();
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {out.close();}
				if(printWriter != null) {printWriter.close();}
			}catch(IOException e) {e.printStackTrace();}
		}
		return ;
		
	}	
}








