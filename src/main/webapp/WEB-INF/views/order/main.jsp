<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="cmd" action="/web/main" method="POST">
		<label>
			<select name="itemcatecode">
				<option value=1>전체</option>
				<option value=2>상의</option>
				<option value=3>하의</option>
				<option value=4>신발</option>
				<option value=5>악세서리</option>
				<option value=6>모자</option>
			</select>
		</label>
		<label> 
			검색 키워드 입력: <input name ="keyword" placeholder="검색하실 이름을 입력하세요"/>
		</label>
		<input type="submit" value="검색">
	</form:form>

</body>
</html>