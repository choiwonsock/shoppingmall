<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- summernote 
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">

<style>
.user_image img{
	margin: 10px 0;
}
.form-control{display:block;width:50%;}
	
.list{
	position: relative;
	margin-right: 50%;
	background: none;
	font-size: 20px;
	line-height: 5;
	top:30px;
	left:30px;
}

section{
	position:relative; 
	background: none; 
	top:-300px; 
	left: 250px; 
	margin-right: 30%;
}
</style>

<title>관리자 상품 등록</title>
</head>
<body>
<div class="container-fluid">
	<h1>Shopping Mall</h1>
	<div class="list">
	<ul >
		<li><a href="/web/admin/memberManage">회원 관리</a></li>
		<li><a href="/web/admin/itemReg">상품 등록</a></li>
		<li><a href="/web/admin/itemList">상품 목록</a></li>
		<li><a href="/web/admin/order">주문 관리</a></li>
	</ul>
	</div>
	<form:form commandName="itemRegisterVo" name="form" class="form" method="post" enctype="multipart/form-data" >
		<section>
		<div class="inputBox" >
			<h3>상품 등록</h3>
			<label>분류</label>
			<select class="category" name="itemCateCode" id="itemCateCode">
				<option value="">전체</option>
				<option value="1">상의</option>
				<option value="2">하의</option>
				<option value="3">신발</option>
				<option value="4">악세사리</option>
			</select>
			
			<label for="itemSize">상품사이즈</label>
			<select class="itemSize" id="itemSize" name="itemSize" id="itemSize">
				<option value="">전체</option>
				<option value="S">S</option>
				<option value="M">M</option>
				<option value="L">L</option>
				<option value="XL">XL</option>
			</select>
			
		</div>
			<div class="check_font" id="itemCateCode_check" ></div>
			<div class="check_font" id="itemSize_check" ></div>
		<div class="form-group">
			<label for="itemCode">상품코드</label> 
			<form:input path="itemCode"  class="form-control"/>
		</div>
		
		<div class="form-group">
			<label for="itemPrice">상품가격</label>
			<form:input path="itemPrice" id="itemPrice" class="form-control"/>
			<div class="check_font" id="price_check" ></div>
		</div>
		
		<div class="form-group">
			<label for="itemName">상품명</label>
			<input type="text" class="form-control" placeholder="상품명" name="itemName" id="itemName" onkeyup="item_name_check()" checked="checked" />
			<div class="check_font" id="id_check" ></div>
		</div>
		
		<div class="form-group">
			<label for="itemQty">상품수량</label>
			<form:input path="itemQty" class="form-control"/>
			<div class="check_font" id="itemQty_check" ></div>
		</div>
		
		<div class="form-group">
			<label for="itemDesc">상품정보</label>
			<textarea rows="5" cols="25" id="itemDesc" class="form-control" name="itemDesc">기본 정보</textarea>
			<div class="check_font" id="itemDesc_check" ></div>
			 <script>
				var ckeditor_config={
				
				width : '70%',
				filebrowserUploadUrl : "/web/admin/imageUpload"
				};
	
				CKEDITOR.replace('itemDesc',ckeditor_config);
			</script> 
			<!--<script>
				$('#summernote').summernote({
					height: 150,
	  				lang: "ko-KR"
				});
			</script>-->
		</div>
		
		<div class="form-group">
			<label for="itemImage">상품이미지</label>
			<input type="file" name=file id="itemImage" onchange="PreviewImage();" accept="image/*" />
		</div>
		<div id="itemImage_check"></div>
 		
 		<div class="user_image"><img id="user_image" width="250"><br></div>
 		
		<input type="button" class="btn btn-success" value="등록" id="submit_btn">
		</section> 	
	</form:form>
</div>
</body>
<script>

function item_name_check(){
	item_overlap_input = document.querySelector('input[name="itemName"]');
	
	$.ajax({
		url:"itemNameCheck",
		data : {'itemName': item_overlap_input.value},
		datatype: 'json',
		success: function (data) {
			if (data == "1") {
				$('#id_check').text("이미 존재하는 상품명 입니다.").show();
				$("#id_check").css("color", "red");
				item_overlap_input.focus();
				search_var = 2;	
			}
			else if (data == "0") {
				$('#id_check').text("사용가능한 상품명 입니다.").show();
				$("#id_check").css("color", "green");
				search_var = 1;
			}
		}
	});
	return search_var;
}

$("#submit_btn").click(function(){
	if ($('#itemCateCode').val() == ""){
		$('#itemCateCode_check').text("상품 카테고리를 선택하세요.").show();
		$("#itemCateCode_check").css("color", "red");
		return;
	}
	if ($('#itemCateCode').val() != ""){
		$('#itemCateCode_check').hide();
	}
	if ($('#itemSize').val() == ""){
		$('#itemSize_check').text("상품 사이즈를 선택하세요.").show();
		$("#itemSize_check").css("color", "red");
		return;
	}
	if ($('#itemSize').val() != ""){
		$('#itemSize_check').hide();
	}
	if ($('#itemPrice').val() == ""){
		$('#price_check').text("가격을 입력하세요").show();
		$("#price_check").css("color", "red");
		return;
	}
	
	var itemPriceCheck = /[0-9]/;
	if (!itemPriceCheck.test($('#itemPrice').val())){
		$('#price_check').text("숫자만 입력하세요").show();
		$("#price_check").css("color", "red");
		return;
	}
	if ($('#itemPrice').val() != "" && itemPriceCheck.test($('#itemPrice').val())){
		$('#price_check').hide();
	}
	if($('#itemName').val() == ""){
		$('#id_check').text("상품명을 입력하세요.").show();
		$("#id_check").css("color", "red");
		return;
	}
	if($('#itemQty').val() == ""){
		$('#itemQty_check').text("상품 수량을 입력하세요.").show();
		$("#itemQty_check").css("color", "red");
		return;
	}
	var itemQtyCheck = /[0-9]/;
	if (!itemQtyCheck.test($('#itemQty').val())){
		$('#itemQty_check').text("숫자만 입력하세요").show();
		$("#itemQty_check").css("color", "red");
		return;
	}
	if($('#itemQty').val() != ""){
		$('#itemQty_check').hide();
	}
	
	if ($('#itemImage').val() == ""){
		$('#itemImage_check').text("상품 이미지 파일을 선택하세요.").show();
		$("#itemImage_check").css("color", "red");
		return;
	}
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	if (!$('#itemImage').val().match(fileForm)){
		$('#itemImage_check').text("이미지 파일 종류를 확인하세요.").show();
		$("#itemImage_check").css("color", "red");
		return;
	}	
	if (item_name_check() == true){
		$(".form").submit();	 
  	}else{
  		console.log("else : " + item_name_check())
		alert("등록 폼 확인바랍니다.");
    	form.itemName.focus();
  	}	
})

function PreviewImage() {

	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById("user_image").src = e.target.result;
	}
	preview.readAsDataURL(document.getElementById("itemImage").files[0]);
}

</script>
</html>