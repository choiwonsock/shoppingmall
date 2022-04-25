<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style class= "navbar_fixed_top" >
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
 
.top_gnb_area .list li{
    list-style: none;    
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
     		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<body>


<nav class="navbar_fixed_top"> 
<div class = "top_gnb_area">
<a class = "navbar_brand" href = "/web/member/main">★석이네쇼핑몰★</a>
<ul class= "list">
<c:if test="${loginuser == null}">   
   
   	                      <!-- 로그인 안된경우 -->
 <li>
  <a href="/web/member/login">로그인</a>
 </li>
 <li>
  <a href="/web/member/register">회원가입</a>
 </li>
 
</c:if>






<c:if test="${loginuser != null}">     <!-- 로그인 경우 -->
 <li>
  ${name}님 환영합니다.
 </li>
 <li>
  <a href="/web/member/logout">로그아웃</a>
 </li>
 <li>
 <a href="/web/member/readmypage/${loginuser.id}">내정보 조회</a>
 </li>
 <li>
 장바구니
 </li>
  <c:if test="${admin == 1 }">
     			<li><a href="javascript:void(0)" onClick="javascript:goPost()" >관리자 페이지</a></li>
        </c:if>
</c:if>
</ul>
</div>
</nav>	


 


 
<script>
	function goPost(){
	    var f = document.createElement('form');
	    console.log("data : " + f);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'admin');
	    document.body.appendChild(f);
	    f.submit();
	}
</script>
</body>
</html>