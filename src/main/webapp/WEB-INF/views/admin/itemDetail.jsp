<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">
<style>
.list{
	position: relative;
	margin-right: 50%;
	background: none;
	font-size: 20px;
	line-height: 5;
	top:30px;
	left:30px;
}

.itemdetail{
	position:relative;
	background: none;
	margin-right: 30%;
	top:-300px;
	left: 250px;
}
</style>
<title>관리자 상품 상세</title>
</head>
<body>
<div class="container-fluid">
	<h1>상품 정보</h1>
	<ul class="list">
		<li><a href="/web/admin/memberManage">회원 관리</a></li>
		<li><a href="/web/admin/itemReg">상품 등록</a></li>
		<li><a href="/web/admin/itemList">상품 목록</a></li>
		<li><a href="/web/admin/order">주문 관리</a></li>
	</ul>
	
	<div class="itemdetail">
	<c:forEach var="itemDetail" items="${itemDetail}">
	<table class="table table-striped">
		<tr>
			<td align="center" rowspan="7" style="margin-right: 200px;" ><img src="<c:url value="/image/${itemDetail.itemThumbImage }"/>" width="200px" height="250px" alt="no"></td>
		</tr>
		<tr>
			<th>상품 코드</th>
			<td align="center">${itemDetail.itemCode}</td>
		</tr>
		<tr>
			<th>상품 이름</th>
			<td align="center">${itemDetail.itemName}</td>
		</tr>
		<tr>
			<th>상품 가격</th>
			<td align="center">${itemDetail.itemPrice}</td>
		</tr>
		<tr>
			<th>상품 사이즈</th>
			<td align="center">${itemDetail.itemSize}</td>
		</tr>
		<tr>	
			<th>상품 수량</th>
			<td align="center">${itemDetail.itemQty}</td>
		</tr>
		<tr>	
			<th>카테고리 코드</th>
			<td align="center">${itemDetail.itemCateCode}</td>
		</tr>
		<tr>	
			<th>상품 설명</th>
			<td align="center">${itemDetail.itemDesc}</td>
		</tr>
		<tr>
			<td align="center" colspan="3">
			<button onclick="window:location='/web/admin/itemUpdateForm/${itemDetail.itemCode}'">상품 수정</button>
			<button onclick="window:location='/web/admin/itemDelete/${itemDetail.itemName}'">상품 삭제</button>
			</td>
		</tr>	
	</table>
	</c:forEach>
	</div>
</div>
</body>
</html>