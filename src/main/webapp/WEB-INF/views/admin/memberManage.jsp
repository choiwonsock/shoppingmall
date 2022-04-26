<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
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
.info{
position:relative;
background: none;
margin-right: 30%;
top:-300px;
left: 250px;
}
</style>
<style class= "navbar_fixed_top">
.top_gnb_area{
	width: 100%;
	height: 50px;
	background-color: #f0f0f1;
    position:relative;
}
 
.top_gnb_area .list{
    position: absolute;
    top: 0px;
    right: 0;
    
}
 
.top_gnb_area .listtop li{
    list-style: none;    
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
</style>

<title>관리자 회원 관리</title>
</head>
<body>
<div class="container-fluid">
<nav class="navbar_fixed_top"> 
<div class = "top_gnb_area">

	<a href = "/web/member/main">★석이네쇼핑몰★</a>
	<ul class= "listtop">
	<c:if test="${loginuser != null && admin == 1 }">
   <li>
  ${name}님 환영합니다.
 </li>
 			<li>
     		<a href="/web/admin/memberManage">회원 관리</a>
			</li>
			<li>
		<a href="/web/admin/itemReg">상품 등록</a>
			</li>
			<li>
		<a href="/web/admin/itemList">상품 목록</a>
			</li>
		<li>
		<a href="/web/admin/order">주문 관리</a>	
		  </li>
		  	<li>
		  <a href="/web/member/logout">로그아웃</a>
        	</li>
        </c:if>
        </ul>
      </div>
      </nav>
	<ul class="list">
		<li><a href="/web/admin/memberManage">회원 관리</a></li>
		<li><a href="/web/admin/itemReg">상품 등록</a></li>
		<li><a href="/web/admin/itemList">상품 목록</a></li>
		<li><a href="/web/admin/order">주문 관리</a></li>
	</ul>
	
	<div class="info">
	<h3>회원 관리</h3>
	<table  class="table table-striped">
		<tr>
			<th>회원 번호</th><th>회원 이름</th><th>회원 아이디</th>
			<th>회원 닉네임</th><th>회원 주소</th><th></th>
		</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.num}</td>
			<td>${list.name}</td>
			<td>${list.id}</td>
			<td>${list.nickname}</td>
			<td>${list.address1}</td>
			<td>
				<button class="checkbtn" >회원 삭제</button>
			</td>
		</tr>	
	</c:forEach>
	</table>
	
	<form action="/web/admin/memberSearch" method="post">
		<select name="select">
		
			<option value="NUM">회원 번호</option>
			<option value="NAME">회원 이름</option>
			<option value="ID">회원 아이디</option>
		</select>
		<input type="text" name="search"/>
		<input type="submit" value="검색">
	</form>
	</div>
</div>
</body>
<script>
$(".checkbtn").click(function(){ 
	var rlt = confirm('삭제하시겠습니까?')
	
	if(rlt){
	var checkbtn = $(this)
	var tr = checkbtn.parent().parent()
	var td = tr.children();
	
	console.log("memberid tr : " + tr.text());
	console.log("memberid td : " + td.eq(1).text());
	
	$.ajax({
		url:"memberDelete",
		data : {'id': td.eq(2).text()},
		datatype: 'json',
		success: function (data) {
			console.log("data : " + data);
			if(data == 1){
				console.log(data)
				alert("회원이 삭제되었습니다.")
				location.reload(true)
			}else if(data == 0){
				console.log(data)
				alert("회원을 다시 확인해주세요.")
			}
		}
	});
	}else{
		return false;	
	}
});
</script>

</html>






