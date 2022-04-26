<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

.itemlist{
	position:relative;
	background: none;
	margin-right: 30%;
	top:-300px;
	left: 250px;
}
</style>

<title>관리자 상품 목록</title>
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
	
	<div class="itemlist">
	<h3>상품 목록</h3>
	<table class="table table-striped">
		<tr>
			<th align="center">상품 코드</th><th align="center">상품 이름</th><th align="center">상품 가격</th>
			<th align="center">상품 사이즈</th><th align="center">상품 수량</th><th align="center">카테고리 코드</th>
		</tr>
	<c:forEach var="list" items="${itemList}">
		<tr>
			<td><a href="/web/admin/itemDetail/${list.itemCode}">${list.itemCode}</a></td>
			<td>${list.itemName}</td>
			<td>${list.itemPrice}</td>
			<td>${list.itemSize}</td>
			<td>${list.itemQty}</td>
			<td>${list.itemCateCode}</td>
		</tr>	
	</c:forEach>
	
	</table>
		<form action="/web/admin/itemSearch" method="post">
		<select name="select">
			<option value="ITEMCODE">상품 번호</option>
			<option value="ITEMNAME">상품 이름</option>
		</select>
		<input type="text" name="search"/>
		<input type="submit" value="검색">
	</form>
	</div>
</div>
</body>
</html>