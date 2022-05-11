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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>shoppingmall</title>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
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
				<c:if test="${admin == 0 || loginuser == null }">
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
		
			<c:if test="${loginuser != null && admin == 1 }">  
			<ul class="nav flex-column mb-2">
				<li class="nav-item "><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin"> <span
						data-feather="file-text"></span> 관리자 페이지
				</a></li>
				
			</ul>
			</c:if>
		</div>

	</nav>
	<div class="row"
		style="margin-left: 330px; margin-top: -300px; text-align: center; position: relative; left: 10%; transform: translateX(-15%);">

		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">

				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 오첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>


		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>

		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>
		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>


		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>
		<li></li>

		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>
		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>
		<div class="col-lg-2 col-md-6">
			<div class="card" style="width: 15rem;">
				<img
					src="https://w.namu.la/s/0c6301df01fc4f180ec65717bad3d0254258abf0be33299e55df7c261040f517518eb9008a1a2cd3d7b8b7777d70182c185bc891b1054dc57b11cc46fd29130a3474f1b75b816024dfdc16b692a0c77c"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">아닌데요 저 뚱인데요</h5>
					<p class="card-text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뚱이 첨보나</p>
					<a href="#" class="btn btn-primary">정보 보기</a>
				</div>
			</div>
		</div>

	</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>