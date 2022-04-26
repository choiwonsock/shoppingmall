<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">
<style type="text/css"> 
section#content ul { padding-left: 0px; }
section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; list-style: none; }
section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px;}

.list{
	position: relative;
	margin-right: 50%;
	background: none;
	font-size: 20px;
	line-height: 5;
	top:30px;
	left:30px;
}

.orderlist{
	position:relative;
	background: none;
	margin-right: 50%;
	top:-300px;
	left: 250px;
}
</style>
<title>관리자 주문 관리</title>
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
	<div class="orderlist">
	<h3>주문 관리</h3>
	<section id="content">
		<ul class="orderList">	
		<c:forEach var="list" items="${orderList}">
			<li>
			<p><span>주문번호</span><a href="/www/admin/orderDetail/${list.orderId}">${list.orderId}</a></p>
			<p><span>수령인</span>${list.userId}</p>
			<p><span>주소</span>(${list.userAddr1}) ${list.userAddr2} ${list.userAddr3}</p>
			<p><span>가격</span>${list.amount}원</p>
			<p><span>배송상태</span>${list.delivery}</p>
			</li>
		</c:forEach>
		</ul>
	</section>
	</div>
</div>	
</body>
</html>