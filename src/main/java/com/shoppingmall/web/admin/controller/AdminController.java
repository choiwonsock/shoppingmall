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
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.HomeController;
import com.shoppingmall.web.admin.model.ItemAddListVo;
import com.shoppingmall.web.admin.model.ItemDeleteVo;
import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberDeleteVo;
import com.shoppingmall.web.admin.model.MemberDetailVo;
import com.shoppingmall.web.admin.model.MemberManageVo;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.admin.service.MemberManageServiceImpl;
import com.shoppingmall.web.admin.utils.ItemRegValidator;

@Controller
public class AdminController {
 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	@Autowired
	private MemberManageServiceImpl memberManageServiceImpl;
	@Autowired
	private ItemRegValidator itemRegValidator;
	
	@InitBinder("ItemRegisterVo")
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(itemRegValidator);
	}
	
	@RequestMapping( value = "/admin", method = RequestMethod.GET)
	public String mainPage(Model model) {
		
		logger.info("????????? ??????????????????.");
		 
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberAllList();
		
		System.out.println("list :" + list);
		model.addAttribute("list",list);
		
		return "admin/main";
	}
	 
	@RequestMapping( value = "/admin/memberManage", method = RequestMethod.GET)
	public String memberManage(Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
			
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberAllList();
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/memberDetail/{id}", method = RequestMethod.GET)
	public String memberDetail(Model model, MemberDetailVo memberDetailVo) {
		
		logger.info("?????? ?????? ?????? ??????????????????.");
		
		List<MemberDetailVo> list = (List<MemberDetailVo>)memberManageServiceImpl.memberDetailSub(memberDetailVo);
		List<MemberDetailVo> detailList = (List<MemberDetailVo>)memberManageServiceImpl.memberDetail(memberDetailVo);
		
		model.addAttribute("list",list);
		model.addAttribute("detailList",detailList);
		
		return "admin/memberDetail";
	}
	
	@RequestMapping( value = "/admin/memberSearch", method = RequestMethod.POST)
	public String memberSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		logger.info("?????? ?????? ??????????????????. :" + memberSearchVo.getSearch());
			
		System.out.println("search :" + memberSearchVo.getSearch());
		System.out.println("select :" + memberSearchVo.getSelect());
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberSearchList(memberSearchVo);
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/itemReg", method = RequestMethod.GET)
	public String itemRegOption(ItemRegisterVo itemRegisterVo) {
		
		logger.info("?????? ?????? ?????? ?????? ??????????????????.");
		
		return "admin/itemRegOption";
	}
	
	@RequestMapping( value = "/admin/itemNewReg", method = RequestMethod.GET)
	public String itemRegForm(ItemRegisterVo itemRegisterVo, Model model) {
		
		logger.info("?????? ?????? ?????? ??????????????????.");
		
		return "admin/itemReg";
	}

	@RequestMapping( value = "/admin/itemNewReg", method = RequestMethod.POST)
	public String itemRegService(@Valid ItemRegisterVo itemRegisterVo, BindingResult result, MultipartFile file) throws Exception{
		 
		logger.info("?????? ?????? ?????? ??????????????????.");    
		
		if(result.hasErrors()) {
			return "admin/itemReg";
		}
		memberManageServiceImpl.itemRegister(itemRegisterVo, file);
	
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemAddList", method = RequestMethod.GET)
	public String itemAddList(ItemRegisterVo itemRegisterVo, MultipartFile file, Model model) throws Exception{
		 
		logger.info("?????? ????????? ?????? ?????? ??????????????????.");    

		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		
		model.addAttribute("itemList", itemList);
		
		return "admin/itemAddList";
	}
	
	@RequestMapping( value = "/admin/itemAddForm/{itemCode}", method = RequestMethod.GET)
	public String itemAddForm(@PathVariable("itemCode") String itemCode, Model model) throws Exception{
		 
		logger.info("?????? ?????? ?????? ?????? ?????? ??????????????????.");    
		
		ItemAddListVo itemAddListVo = new ItemAddListVo();
		itemAddListVo.setItemCode(itemCode);
		
		List<ItemAddListVo> addList = (List<ItemAddListVo>)memberManageServiceImpl.itemAddList(itemAddListVo);
	
		model.addAttribute("addList", addList);
		
		return "admin/itemAddForm";
	}
	
	@RequestMapping( value = "/admin/itemAddForm", method = RequestMethod.POST)
	public String itemAddOptionService(@Valid ItemAddListVo itemAddListVo, BindingResult result) {
		 
		logger.info("?????? ?????? ?????? ?????? ?????? ??????????????????.");   

		System.out.println(itemAddListVo.getItemQty());
		System.out.println(itemAddListVo.getItemSize());
		System.out.println(itemAddListVo.getItemCode());
		memberManageServiceImpl.itemAddOption(itemAddListVo);
		
		return "redirect:/admin/itemList";
	}
	
	@ResponseBody
	@RequestMapping( value = "/admin/itemSizeCheck" ,method=RequestMethod.GET)
	public String itemSizeCheck(String itemSize) {
		
		logger.info("????????? ?????? ?????? ?????? ??????????????????. :" + itemSize);
		
		int result = memberManageServiceImpl.itemSizeCheck(itemSize);
		
		return Integer.toString(result);
	}
	
	@RequestMapping( value = "/admin/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		
		model.addAttribute("itemList", itemList);

		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemSearch", method = RequestMethod.POST)
	public String itemSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		
		logger.info("?????? ?????? ??????????????????. :" + memberSearchVo.getSelect());
			
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemSearchList(memberSearchVo);
		System.out.println(itemList);
		model.addAttribute("itemList",itemList);
		
		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemDetail/{itemCode}&{itemSize}", method = RequestMethod.GET)
	public String itemDetail(@PathVariable("itemCode") String itemCode, @PathVariable("itemSize") String itemSize, ItemRegisterVo itemRegisterVo,Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
		System.out.println("itemCode : " + itemCode);
		System.out.println("itemSize : " + itemSize);
		System.out.println("Vo itemSize : " + itemRegisterVo.getItemSize());
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemRegisterVo);
		
		model.addAttribute("itemDetail", itemDetail);

		return "admin/itemDetail";
	}
	
	@RequestMapping( value = "/admin/itemUpdateForm/{itemCode}&{itemSize}", method = RequestMethod.GET)
	public String itemUpdateForm(@PathVariable("itemCode") String itemCode, ItemRegisterVo itemRegisterVo, Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
		System.out.println("Vo itemSize : " + itemRegisterVo.getItemSize());
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemRegisterVo);
		
		model.addAttribute("itemDetail",itemDetail);
		
		return "admin/itemUpdateForm";
	}
	
	@RequestMapping( value = "/admin/itemUpdate", method = RequestMethod.POST)
	public String itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file, Model model) throws Exception{
		
		logger.info("?????? ?????? ?????? ?????? ??????????????????.");
		
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("vo: ??????" + itemRegisterVo.getItemName());
		memberManageServiceImpl.itemUpdate(itemRegisterVo, file);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/order", method = RequestMethod.GET)
	public String orderList(Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
 
		List<OrderListVo> orderList = (List<OrderListVo>)memberManageServiceImpl.orderList();
		
		model.addAttribute("orderList", orderList);
		
		return "admin/order";
	}
	
	@RequestMapping( value = "/admin/orderDetail/{orderId}", method = RequestMethod.GET)
	public String orderDetail(@PathVariable("orderId") String orderId ,Model model) {
		
		logger.info("?????? ?????? ??????????????????.");
		
		List<OrderDetailVo> orderDetail = (List<OrderDetailVo>)memberManageServiceImpl.orderDetail(orderId);
		
		model.addAttribute("orderDetail", orderDetail);
		
		return "admin/orderDetail";
	}
	
	@RequestMapping( value = "/admin/orderDelivery", method = RequestMethod.POST)
	public String orderDelivery(@RequestParam("delivery") String delivery, OrderDetailVo vo, Model model) {
		 
		logger.info("?????? ?????? ??????????????????." + vo.getItemSize());
		
		if(vo.getDelivery().equals("?????? ???")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);
		}
		else if (vo.getDelivery().equals("?????? ??????")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);	
		}
		
		return "redirect:/admin/orderDetail/"+vo.getOrderId();
	}
	
	@RequestMapping( value = "/admin/memberDelete", method = RequestMethod.GET)
	@ResponseBody
	public String memberDelete(MemberDeleteVo memberDeleteVo, Model model) {
		
		logger.info("?????? ?????? ??????????????????.");

		if(memberDeleteVo.getAdmin().equals("1")) {
			return "2";
		}
		try {
			memberManageServiceImpl.memberDelete(memberDeleteVo);
			return "1";
		}catch(DataIntegrityViolationException e) {
//			e.printStackTrace();
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping( value = "/admin/itemNameCheck")
	public String itemNameCheck(String itemName) {
		
		logger.info("????????? ?????? ?????? ??????????????????.");
		
		int result = memberManageServiceImpl.itemNameCheck(itemName);
		
		return Integer.toString(result);
	}
	
	@RequestMapping( value = "/admin/itemDelete", method = RequestMethod.POST)
	public String itemDelete(ItemDeleteVo itemDeleteVo, Model model) {
		
		logger.info("?????? ?????? ??????????????????." + itemDeleteVo.getItemCode());

		memberManageServiceImpl.itemDelete(itemDeleteVo);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/imageUpload", method = RequestMethod.POST)
//	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, 
			MultipartFile upload) throws Exception{
		
		logger.info("textarea ????????? ????????? ??????????????????.");
		//?????? ?????? ??????
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//?????????
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
		try {
			//?????? ?????? ????????????
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//????????? ?????? ??????
			String path = "D:/imgUpload";
			System.out.println("path : " + path);
			String ckUploadPath = path+ File.separator + uid + "_" + fileName;
			File folder = new File(path);
			
			//?????? ???????????? ??????
			if(!folder.exists()) {
				try {
					//?????? ??????
					folder.mkdirs();
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
//			outputStream??? ????????? ???????????? ???????????? ?????????
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








