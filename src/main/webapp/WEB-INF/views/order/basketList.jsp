<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--스프링프레임워크의 JSP 기술중에 form taglib 가 있습니다. form 태그라이브러리를 사용하면 
	HTML 폼에 데이터를 바인딩하거나 에러메세지 처리등을 간편하게 할 수 있습니다.-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--메시지를 사용하기 위해 추가-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--JSTL 사용-->
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>장바구니 목록</title>
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
			<li class="nav-item"><a class="nav-link active btn d-inline-flex align-items-center rounded"
					aria-current="page" href="/web/member/login""> <span data-feather="home"></span>
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
		</div>

	</nav>

<script>
var i = 0;
</script>
	<h2>장바구니</h2>
	<form action="/web/order/buy" method="POST">
		<c:if test="${basketselect != null}">
			<table border="1">
				<tr>
					<td id="qtyall" >전체 0 개</td>
					<td>장바구니 번호</td>
					<td>상품사진</td>
					<td>상품이름</td>
					<td>총 가격</td>
					<td>사이즈</td>
					<td>수량</td>
				</tr>

				<c:forEach var="bb" items="${basketselect}">
					<tr>
						<td><input type="checkbox" id="check${bb.kartnum}"
							name="basketbuy" value="${bb.kartnum}"
							onclick="checkqty(${bb.kartnum},${bb.price})"></td>
						<td>${bb.kartnum}</td>
						<td>${bb.itemimage}</td>
						<td>${bb.itemname}</td>
						<c:if test="${basketselect != null}">
							<td id="price${bb.kartnum}">${bb.price*bb.itemqty}원</td>
						</c:if>
						<c:if test="${basketselect == null}">
							<td id="price${bb.kartnum}"></td>
						</c:if>
						<td>${bb.itemsize}</td>
						<td>
							<table>
								<tr>
									<td><input type="button" id="mius" name="mius" value="-"
										onclick="miusqty(${bb.kartnum},${bb.price})"></td>
									<c:if test="${basketselect != null}">
										<td id="qty${bb.kartnum}">${bb.itemqty}</td>
									</c:if>
									<c:if test="${basketselect == null}">
										<td id="qty${bb.kartnum}"></td>
									</c:if>
									<td><input type="button" id="plus" name="plus" value="+"
										onclick="plusqty(${bb.kartnum},${bb.price})"></td>
								</tr>
							</table>
							
				</c:forEach>
			</table>
		</c:if>
		<input type="submit" value="주문">
	</form>
	<c:if test="${basket != null}">
		<script>alert("${basket}");</script>
	</c:if>
	<c:if test="${error != null}">
		<script>alert("${error}");</script>
	</c:if>
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
<script> 
		function plusqty(name,price) {
			fetch("buy/qty", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
					value : '+',
					itemprice : price,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					 var jsonObj = JSON.parse(text);
					 console.log(jsonObj);
					 document.querySelector('#qty'+jsonObj.kartnum).innerHTML = jsonObj.itemqty;
					 document.querySelector('#price'+jsonObj.kartnum).innerHTML = jsonObj.itemprice*jsonObj.itemqty+'원';
				})
			})
		}
		function miusqty(name,price) {
			fetch("buy/qty", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
					value : '-',
					itemprice : price,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					 var jsonObj = JSON.parse(text);
					 console.log(jsonObj);
					 document.querySelector('#qty'+jsonObj.kartnum).innerHTML = jsonObj.itemqty;
					 document.querySelector('#price'+jsonObj.kartnum).innerHTML = jsonObj.itemprice*jsonObj.itemqty+'원';
				})
			})
			
		}
		function checkqty(name) {
			fetch("buy/check", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					console.log('1111111111111111');
					console.log(text);
					console.log('1111111111111111');
					var jsonObj = JSON.parse(text);
					console.log('2222222222222222');
					console.log(jsonObj);
					console.log('2222222222222222');
					console.log(jsonObj.kartnum);
					console.log('33333333333333333');
					var aa = document.getElementById('check'+jsonObj.kartnum).checked;
					if(aa){
						i = i + 1;
					}else{
						i = i - 1;
					}
					console.log(document.querySelector('#price'+jsonObj.kartnum));
					document.querySelector('#qtyall').innerHTML = '전체 '+i+' 개';
					
				})
			})
		}
	</script>
</html>