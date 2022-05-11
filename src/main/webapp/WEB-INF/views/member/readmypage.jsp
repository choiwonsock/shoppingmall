<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>MYPAGE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
<style>
.container-fluid {
	font-family: 'Dokdo', cursive;
}
</style>

</head>
<body>

	<nav class="navbar navbar-light bg-success p-2 text-dark bg-opacity-25"
		class="border border-info">
		<div class="container-fluid">
			<a class="navbar-brand"><h3 class="text-success">훈남 3인방 쇼핑몰</h3></a>
			<ul class="nav">
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link active" aria-current="page" href="/web/member/main">Home</a></li>
		 
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link" href="/web/member/readmypage">MyPage</a></li>
				<c:if test="${admin == 0 }">
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link" href="/web/order/basket">Basket</a></li>
				</c:if>
				
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link disabled">고객센터</a></li>
			</ul>
			<form class="d-flex">
				<select class="form-select" style="width:110px;height:62px;" aria-label="Default select example">
					<option value=1>전체</option>
					<option value=2>상의</option>
					<option value=3>하의</option>
					<option value=4>신발</option>
					<option value=5>악세서리</option>
					<option value=6>모자</option>

				</select> <input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">검색</button>
			</form>
		</div>
	</nav>


	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		<div class="position-sticky pt-3">
			<ul class="nav flex-column">
			<c:if test="${loginuser == null}"> 
				<li class="nav-item"><a class="nav-link active btn d-inline-flex align-items-center rounded"
					aria-current="page" href="/web/member/login""> <span data-feather="home"></span>
						로그인
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/member/register"> <span
						data-feather="file"></span> 회원가입
				</a></li>
			</c:if>
			<c:if test="${loginuser != null}"> 
			<li style = "color: blue"> ${name}님 환영합니다.<li>
			<li class="nav-item"><a class="nav-link active btn d-inline-flex align-items-center rounded"
					aria-current="page" href="/web/member/logout""> <span data-feather="home"></span>
						로그아웃
				</a></li>
			</c:if>
			</ul>
			
			<h6
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				<span>카테고리</span> <a class="link-secondary" href="#"
					aria-label="Add a new report"> <span data-feather="plus-circle"></span>
				</a>
			</h6>
			<c:if test="${loginuser != null && admin == 0 }">  
			<ul class="nav flex-column mb-2">
				<li class="nav-item "><a class="nav-link btn d-inline-flex align-items-center rounded" href="#"> <span
						data-feather="file-text"></span> 상의
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="#"> <span
						data-feather="file-text"></span> 하의
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="#"> <span
						data-feather="file-text"></span> 신발
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="#"> <span
						data-feather="file-text"></span> 악세서리
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="#"> <span
						data-feather="file-text"></span> 모자
				</a></li>
			</ul>
			</c:if>
			<c:if test="${loginuser != null && admin == 1 }">  
			<ul class="nav flex-column mb-2">
				<li class="nav-item "><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin/memberManage"> <span
						data-feather="file-text"></span> 회원 관리
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin/itemReg"> <span
						data-feather="file-text"></span> 상품 등록
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin/itemList"> <span
						data-feather="file-text"></span> 상품 목록
				</a></li>
				<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin/order"> <span
						data-feather="file-text"></span> 주문 관리
				</a></li>
			</ul>
			</c:if>
		</div>

	</nav>

<nav class="total" style = "float: center; text-align: center; position: relative; left: 10%; transform: translateX(-5%);">
<table border = "1">
	
	<h2>마이페이지</h2>
	<tr>
		<td>이름</td>
		<td>${readmypage.name}</td>
	</tr>
		<tr>
		<td>아이디</td>
		<td>${readmypage.id}</td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td>${readmypage.phone}</td>
	</tr>
		<tr>
		<td>생년월일</td>
		<td>${readmypage.birth}</td>
	</tr>
		<tr>
		<td>이메일</td>
		<td>${readmypage.email}</td>
	</tr>
		<tr>
		<td>주소</td>
		<td>${readmypage.address1}${readmypage.address2}</td>
	
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${readmypage.nickname}</td>
	</tr>
	
	<input type="button" value="메인 으로" onclick = "window:location='/web/member/main'">
	<input type="button" value="정보 수정" onclick = "window:location='/web/member/updatemypage/${readmypage.id}'">
	<input type="button" value="회원 탈퇴" onclick = "window:location='/web/member/deletemypage/${readmypage.id}'">
	
</table>
</nav>
<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Pricing</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
			<p class="text-center text-muted">&copy; 2022 Company, Inc</p>
		</footer>
	</div>
	
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</html>