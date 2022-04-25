<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE</title>
</head>
<body>
<fieldset>

<h1>정보수정</h1>
<form action="/web/member/updatemypage" method = "post" name = "update" >
	이름 <input type="text" id="name" name="name" value = "${readmypage.name }" /><br>
	아이디 <input type="text" name = "id" id = "id" value= "${readmypage.id}" readonly> <br>
	변경할 비밀번호<input type="password" id="pw" name="pw"  /><br>
	변경할 비밀번호 확인<input type="password" name = "pwc" id = "pwc" /><br>
	휴대전화<input type="text" id="phone" name="phone" value = "${readmypage.phone }" /><br>
	생년월일<input type="date" id="birth" name="birth" value = "${readmypage.birth }" /><br>
	이메일<input type="text" id="email" name="email" value = "${readmypage.email }" readonly /><br>
	주소	<input  class="address1" placeholder="우편번호" readonly="readonly">
		<input type="text"class="address2" id="address1" name="address1" value = "${readmypage.address1 }"readonly = "readonly" />	<input type="button" onclick = "execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text"class="address3" id="address2" name="address2" value = "${readmypage.address2 }" readonly="readonly" /><br>
	닉네임<input type="text" id="nickname" name="nickname" value = "${readmypage.nickname }" readonly /><br>
		
	<input type = "submit" class="submit" id = "submit" value= "정보 수정하기" >
	<input type = "button" id = "cancel" value= "취소" onclick = "window:location='/web/member/readmypage/${readmypage.id}'">	
			
		
				
			
</form>
</fieldset>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
              
                var addr = ''; 
                var extraAddr = ''; 

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
             $(".address1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".address2").val(addr);
            //$("[name=memberAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $(".address3").attr("readonly",false);
                $(".address3").focus();
            }
        }).open();
    }
</script>
  <script>
	 $("#pw").change(function(){
	    checkPassword($('#pw').val());
	});
	function checkPassword(pw){
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#pw').val('').focus();
	        
	    }    
	   
	}
	
	 $(function(){
 		$('#pwc').blur(function(){
 		   if($('#pw').val() != $('#pwc').val()){
 		    	if($('#pwc').val()!=''){
 			    alert("비밀번호가 일치하지 않습니다.");
 		    	    $('#pwc').val('');
 		          $('#pwc').focus();
 		       }
 		    }
 		})  	   
 	});
</script>
 <script type="text/javascript" >
      $(document).ready(function(){
    	  $(".submit").on("click", function(){
    		  
    		  	if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				
			  	if($("#phone").val()==""){
					alert("휴대전화를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
			  	if($("#birth").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#birth").focus();
					return false;
				}
			  	if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
			  	if($("#address1").val()==""){
					alert("주소를 입력해주세요.");
					$("#address1").focus();
					return false;
				}
			  	if($("#address2").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#address2").focus();
					return false;
				}
			  	if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}else {
					document.update.action="/web/member/updatemypage";
					alert("정보가 수정되었습니다.")
					document.update.submit();
				}
			});  
      })
    </script>
</body>
</html>