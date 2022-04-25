<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
</head>
<body>
<h2>마이페이지</h2>
<table border = "1">
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
</body>
</html>