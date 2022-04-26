<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">
<style type="text/css">
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

.itemupdate{
	position:relative; 
	background: none; 
	top:-300px; 
	left: 250px; 
	margin-right: 30%;
}
</style>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
</head>
<body>
<div class="container-fluid">
	<h1>Shopping Mall</h1>
	<ul class="list">
		<li><a href="/web/admin/memberManage">회원 관리</a></li>
		<li><a href="/web/admin/itemReg">상품 등록</a></li>
		<li><a href="/web/admin/itemList">상품 목록</a></li>
		<li><a href="/web/admin/order">주문 관리</a></li>
	</ul>
	
	<div class="itemupdate">
	<h3>상품 정보 수정</h3>
	<c:forEach var="itemDetail" items="${itemDetail}">
	<form action="/web/admin/itemUpdate" class="form" method="post" enctype="multipart/form-data" onsubmit="return item_name_check()">
				
		<img src="<c:url value="/image/${itemDetail.itemThumbImage }"/>" width="200px" height="250px" alt="no">
		<input type="hidden" name="itemThumbImage" value="${itemDetail.itemThumbImage }">
		<input type="hidden" name="itemImage" value="${itemDetail.itemImage }">
		
		<input type="hidden" name="itemCode" id="itemCode" value="${itemDetail.itemCode }">
		
		<div class="form-group">
			<label for="itemPrice">상품가격</label>
			<input name="itemPrice" id="itemPrice" value="${itemDetail.itemPrice}" class="form-control"/>
		</div>
		
		<div class="form-group">
			<label for="itemSize">상품사이즈</label>
			<input name="itemSize" id="itemSize" value="${itemDetail.itemSize}" class="form-control"/>
		</div>
		
		<div class="form-group">
			<label for="itemName">상품명</label>
			<input type="text" name="itemName" id="itemName" onkeyup="item_name_check()" checked="checked" 
			value="${itemDetail.itemName}" class="form-control"/>
			<div class="check_font" id="id_check" ></div>
		</div>
		
		<div class="form-group">
			<label for="itemQty">상품수량</label>
			<input name="itemQty" id="itemQty" value="${itemDetail.itemQty}" class="form-control"/>
		</div>
		
		<div class="form-group" >
			<label for="itemDesc">상품정보</label>
			<textarea rows="5" cols="25" id="itemDesc" name="itemDesc" class="form-control">${itemDetail.itemDesc }</textarea>
			<script>
				var ckeditor_config={
					resize_enaleb : false,
					enterMode : CKEDITOR.ENTER_BR,
					shiftEnterMode : CKEDITOR.ENTER_P,
					filebrowserUploadUrl : "/web/admin/imageUpload"
				};

				CKEDITOR.replace('itemDesc',ckeditor_config);
			</script> 
		</div>
				
		<div class="form-group">
			<label for="itemImage">상품이미지</label>
			<input type="file" name="file" id="itemImage" onchange="PreviewImage();" accept="image/*" />
		</div>
		<div class="user_image"><img id="user_image" width="250"><br></div>
		
		<input type="submit" value="등록"> 	
	</form>
	</c:forEach>
	</div>
</div>
</body>

<script type="text/javascript">
function PreviewImage() {

	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById("user_image").src = e.target.result;
	}
	preview.readAsDataURL(document.getElementById("itemImage").files[0]);
}
</script>
</html>