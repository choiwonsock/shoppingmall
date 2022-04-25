<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<fieldset>
	<h2>회원탈퇴</h2>
	<form action="/web/member/deletemypage" method="post" id="deleteForm" name="deleteForm">
                       <input type="hidden" id="id" name="id" value="${id}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "pw" name="pw" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="pwc" name="pwc"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="delete" name="delete" class="btn btn-primary">회원탈퇴</button> <a href="/web/member/readmypage/${id}" class="btn btn-default">뒤로가기</a>
            </div>
        </div>
    </div>
    </form>
	
</fieldset>
</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
		
			$("#delete").on("click", function(){
				
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#pw").focus();
					return false
				}
				
				if($("#pwc").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#pwc").focus();
					return false
				}
				
				if ($("#pw").val() != $("#pwc").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("pwc").focus();
					 
					return false;
					}
				
				
				$.ajax({
					url : "/web/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					
					success: function(data){
						console.log("data" + data);
						
						if(data == "0"){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			});
		})
	</script>
    	  
</html>