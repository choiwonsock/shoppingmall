<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}
.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

</style>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<form method="post" class="form-signin" action="find_id" name="findid">
		<div class="form-label-group">
			<label for="name">이름 :</label>
			<input type="text" id="name" name="name" />
			
		</div>
		
		<div class="form-label-group">
			<label for="email">이메일 :</label>
			<input type="text" id="email" name="email" />
		
		</div>

		<div class="form-label-group">
			<input class="submit" 
				type="submit" value="아이디찾기">
		</div>
		
	<!-- 이름과 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 이메일이 일치할 때 -->
		<c:if test="${check == 0 }">
		<label>찾으시는 아이디는' ${id}' 입니다.</label>
		<div class="form-label-group">
				 <a href="/web/member/login"><input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="로그인하기"></a>
				<a href="/web/member/find_pw_form"><input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="비밀번호 찾기"></a>
			</div>
		</c:if>
	
	

	</form>

	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
 
	  <script type="text/javascript" >
      $(document).ready(function(){
    	  $(".submit").on("click", function(){
    		 	
    		  if($("#name").val()==""){
					alert("이름를 입력해주세요.");
					$("#name").focus();
					return false;
				}
    		 
    		  if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
    		  
    	  });
      })
    </script>
    

</body>
</html>