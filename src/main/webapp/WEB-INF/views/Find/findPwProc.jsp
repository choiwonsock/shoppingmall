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
<title>Insert title here</title>
</head>
<body>
<form method="post" action="update_pw" name="findpw" >
	<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<label>일치하는 정보가 존재하지 않습니다.</label>
			<a href="/web/member/find_pw_form"><input type="button" value="다시 입력" /></a>
		</c:if>
	
		<!-- 이름과 비밀번호가 일치할 때 -->
		<c:if test="${check == 0 }">
		<div>
			<label>비밀번호를 변경해주세요.</label>
		</div>
		<div class="form-label-group">
		<input type="hidden" id="id" name="updateid" value="${updateid}">
		
			<input type="password" id="pwd" name="pwd" />
			<label for="password">변경 할 비밀번호</label>
		</div>
		
		<div class="form-label-group">
			<input type="password" id="confirmpwd" name="confirmpwd" />
			<label for="confirmpassword">변경 할 비밀번호 확인</label>
		</div>
		
		<div class="form-label-group">
				<input 
					type="button" value="비밀번호 변경하기" onclick="updatePassword()">
			</div>
		</c:if>
		</form>
</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
  <script>
	 $("#pwd").change(function(){
	    checkPassword($('#pwd').val());
	});
	function checkPassword(pwd){
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#pwd').val('').focus();
	        
	    }    
	   
	}
</script>
 
 
  <script type="text/javascript">
		function updatePassword(){
			if(document.findpw.pwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findpw.pwd.focus();
			} else if(document.findpw.pwd.value != document.findpw.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findpw.confirmpwd.focus();
			} else {
				document.findpw.action="update_pw";
				alert("비밀번호 변경되었습니다.")
				document.findpw.submit();
			}
		}
	</script>
</html>