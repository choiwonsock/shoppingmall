<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">
<style type="text/css">
section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; list-style: none;}
	
.orderInfo {
	position:relative;
	background: none;
	margin-right: 50%;
	top:-300px;
	left: 250px;}
.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
.orderList li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
.orderList li::after { content:""; display:block; clear:both; }
.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	
	<section id="content">
	<div class="orderInfo">
		<c:forEach var="detail" items="${orderDetail}" varStatus="status">
			<c:if test="${status.first}">
				<p><span>수령인 </span>${detail.userId}</p>
				<p><span>배송상태</span>${detail.delivery}</p>
			
				<div class="deliveryChange">
					<form action="/www/admin/orderDelivery" role="form" method="post" class="deliveryForm">
						<input type="hidden" name="orderId" value="${detail.orderId}">
						<input type="hidden" name="delivery" class="delivery" value="">
						<button type="button" class="delivery1_btn">배송중</button>  
						<button type="button" class="delivery2_btn">배송 완료</button>
					</form>	
				</div>
			</c:if>
		</c:forEach>
	</div>
	<div class="itemlist">
	<ul class="orderList" style="padding-left: 0px; margin-top: 10px;">
		<c:forEach var="detail" items="${orderDetail}">
			<li>
				<div class="thumb">
					<img src="<c:url value="/image/${detail.itemThumbImage }"/>" alt="no" />
				</div>
				<div class="gdsInfo">
					<p><span>상품 이름</span>${detail.itemName}</p>
					<p><span>상품 가격</span>${detail.itemPrice}</p>
					<p><span>주문 코드</span>${detail.orderDetailsNum}</p>
					<p><span>상품 수량</span>${detail.cartStock}</p>
				</div>
			</li>
		</c:forEach>
	</ul>
	</div>
	</section>
	</div>
</body>

<script type="text/javascript">
	$(".delivery1_btn").click(function(){
		$(".delivery").val("배송 중");
		alert("배송 중");
		run();
	});
					   
	$(".delivery2_btn").click(function(){
	   $(".delivery").val("배송 완료");
	   alert("완료");
	   run();
	});
	
	function run(){
		$(".deliveryForm").submit();
	}
</script>
</html>