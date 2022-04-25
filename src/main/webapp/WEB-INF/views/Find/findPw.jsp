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
.clear_ok{color:green; display: none;}
.clear_already{color:red; display: none;}
.correct{
    color : green;
}
.incorrect{
    color : red;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="find_pw" name="findpw" class="find">
<div class="form-label-group">
		<label for="id">ID :</label>
			<input type="text" id="id" name="id" class="form-control"/>
			
		</div>
		
		<div class="form-label-group">
		<label for="name">이름 : </label>
			<input type="text" id="name" name="name"/>
			
		</div>
		
		<div class="form-label-group">
		<label for="email">이메일 :</label>
			
			<input type="text" class="email_input" id="email" name="email"/>
			<input type="button" onclick = "emailCheck()" value="인증번호 전송"><br>
			<span class="clear_ok">이메일이 전송 되었습니다. 이메일을 확인해주세요.</span>
 			<span class="clear_already">올바르지 못한 이메일 형식입니다.</span>
			
			<div class="email_check_input_box" id = "email_check_input_box_false">
			<input type="text" class="email_check_input" id="emailch" name="emailch" disabled="disabled">	
				<div class="clearfix"></div>
 	 					<span id = "email_check_input_box_warn"></span>
 	 			</div>
			</div>
		<div class="form-label-group">
			<input class="button"
				type="button" value="비밀번호 찾기">
		</div>

	

	</form>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
 
	  <script type="text/javascript" >
	  var buttonCheck="";
      $(document).ready(function(){
    	  $(".button").on("click", function(){
    		 	
    		  if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					buttonCheck = false;
				}else{
					buttonCheck = true;
				}
    		  
    		  if($("#name").val()==""){
					alert("이름를 입력해주세요.");
					$("#name").focus();
					buttonCheck = false;
				}else{
					buttonCheck = true;
				}
    		  if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					buttonCheck = false;
				}else{
					buttonCheck = true;
				}
    		  

    		  if($("#emailch").val()==""){
					alert("인증번호를 입력해주세요");
					buttonCheck = false;
				}else{
					buttonCheck = true;
				}
    		  
    	  });
      })
    </script>
   

	
<script type="text/javascript">

         
/* 인증번호 이메일 전송 */
var code = "";     
//$(".email_check_button").click(function(){
	
function emailFormCheck(email){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(email);
}
	
	
function emailCheck() {
	var email = $(".email_input").val(); //입력한 이메일
	 var checkBox = $(".email_check_input");        // 인증번호 입력란
	 var boxWrap = $(".email_check_input_box"); // 인증번호 입력란 박스

	 if(emailFormCheck(email)){
		 $('.clear_ok').css("display","inline-block");
  		$('.clear_already').css("display", "none");
	    } else {
	   		$('.clear_already').css("display", "inline-block");
	    	 $('.clear_ok').css("display","none");
	        return false;
	    }    
	 
	 $.ajax({
			url:"mailCheck?email=" + email,
	        type:"GET",
	        success:function(data){
	        	
	        	
	        	 console.log("data : " + data);
	        	 checkBox.attr("disabled", false);
	        	 boxWrap.attr("id", "email_check_input_box_true");
	        	 code = data;
	        	
	        }
	
	});
};
var emailnumCheck = "";        // 이메일 인증번호 확인
/* 인증번호 비교*/
$(".email_check_input").blur(function(){
		console.log("code : " + code);
	var inputCode = $(".email_check_input").val();        // 입력코드    
    var checkResult = $("#email_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");
        emailnumCheck = true;
        
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        emailnumCheck = false;
       
    }    
});

</script>
 <script type="text/javascript">

//회원가입 버튼(회원가입 기능 작동)

$(".button").click(function(){
    if(emailnumCheck == true && buttonCheck == true){
    	
	 $(".find").submit();
    }
    	
});
</script>
</body>
</html>