<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원가입 </title>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath }/resources/css/register.css">
<style type="text/css">
  
input[class="btn btn-default"] {
    background-color: rgb(84, 105, 212);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(84, 105, 212) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="/web/member/main" rel="dofollow">회원가입</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              
              <form action="/web/member/register" method="post" class= "submit" >

                <div class="field padding-bottom--24">
                <div class="grid--50-50">
                  <label for="name">이름</label>
		 	<div class="reset-pass">
    
                    </div>
                    </div>
                 <input class="form-control" id="name" name = "name">
 	 				<div class="name_check">
                
                </div>

                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="id">아이디</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input class="form-control" id="id" name = "id" oninput="idCheck()">
 	 				<span class="id_ok">사용 가능한 아이디 입니다.</span>
 					<span class="id_already">사용중인 아이디 입니다.</span>   
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">비밀번호</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="password" class="form-control" id="pw" name = "pw">  
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pwcheck">비밀번호 확인</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="password" class="form-control" id="pwcheck" name = "pwcheck">   
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="phone">휴대전화</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input type="tel" class="form-control" id="phone" name = "phone">
 	 				<div class="phone_check"></div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="birth">생년월일</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="date" class="form-control" id="birth" name = "birth">
 	 				<div class="birth_check"></div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">이메일</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input  class="form-control" id="email_input" name = "email" oninput="emailCheck3()">
 					<span class="email_ok">사용 가능한 이메일 입니다.</span><br>
 					<span class="email_already">사용중인 이메일 입니다.</span><br>
 	 				<span class="clear_ok">이메일이 전송 되었습니다. 이메일을 확인해주세요.</span>
 					<span class="clear_already">올바르지 못한 이메일 형식입니다.</span>    
<div class="btn btn-default">
							<span onclick = "emailCheck()">인증번호 전송</span>
						</div>                
</div>				<div class="grid--50-50" id = "email_check_input_box_false">
				<input type="text" class="form-control" id="emailch" name="emailch" disabled="disabled" placeholder="인증번호 입력">
					
 	 		
				</div>
				<div class="clearfix"></div>
 	 					<span id = "email_check_input_box_warn"></span>

<div class="field padding-bottom--24">
                 
                    <label for="pw">주소</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 	<div class ="address_input_1_wrap">
 	 					
 	 					<div class="btn btn-default">
		 	 				<span onclick = "execDaumPostcode()">우편번호 찾기</span>
		 	 			</div>
		 	 			
		 	 			
		 	 			<div class="form-group">
 	 						<input  class="grid--50-50" id = "address_input_1" placeholder="우편번호" readonly="readonly">
 	 					
		 	 			
		 	 			</div>
 	 						<div class="clearfix"></div>	
 	 				</div>
 	 				<div class="address_input_2_wrap">
 	 					<div class="form-group">
 	 						<input class="grid--50-50" id = "address_input_2" name = "address1" placeholder="주소" readonly="readonly">
 	 					</div>
 	 				</div>  
 	 		 		<div class ="address_input_3_wrap">
						<div class="form-group">
							<input class="grid--50-50" id = "address_input_3" name = "address2" placeholder="상세주소" readonly="readonly">
						</div>
					</div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">닉네임</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input class="form-control" id="nickname" name = "nickname" oninput="nickCheck()">
 	 				<span class="nick_ok">사용 가능한 닉네임 입니다.</span>
 					<span class="nick_already">사용중인 닉네임 입니다.</span>    
                </div>
		
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                  
                </div>





                <div class="field padding-bottom--24">
                 <input type="button" class="btn btn-default" id="button" value="가입하기" />
                </div>
                <div class="field">
                  <a class="ssolink" href="/web/member/main">메 인 으 로</a>
                </div>
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
           
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="#">Home</a></span>
              <span><a href="#">Features</a></span>
              <span><a href="#">Pricing</a></span>
              <span><a href="#">FAQs</a></span>
              <span><a href="#">About</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
 <!-- 정규식 -->
<script type="text/javascript">

</script>
 
 
<script type="text/javascript" >

var idckCheck = "";            // 아이디 중복 검사
	function idCheck(){
            var id = $('#id').val();
        $.ajax({
            url:'/web/member/idCheck',
            type:'post',
            data:{"id":id},
            success:function(cnt){   //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == "0"){    //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
             		$('.id_ok').css("display","inline-block");
             		$('.id_already').css("display", "none");
             		idckCheck = true;
             		
                } else{ 
                	$('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    idckCheck = false; 
                    
                }
             },
         
        });
      };
      //닉네임 중복
      var nicknameCheck = "";            
  	function nickCheck(){
              var nickname = $('#nickname').val();
          $.ajax({
              url:'/web/member/nickCheck',
              type:'post',
              data:{"nickname":nickname},
              success:function(cnt){   //컨트롤러에서 넘어온 cnt값을 받는다 
                  if(cnt == "0"){    //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
               		$('.nick_ok').css("display","inline-block");
               		$('.nick_already').css("display", "none");
               		nicknameCheck = true;
               		
                  } else{ 
                  	$('.nick_already').css("display","inline-block");
                      $('.nick_ok').css("display", "none");
                      nicknameCheck = false; 
                      
                  }
               },
           
          });
        };    
        
        //이메일 중복
        var emailCheck2 = "";            
    	function emailCheck3(){
                var email = $('#email_input').val();
            $.ajax({
                url:'/web/member/emailCheck',
                type:'post',
                data:{"email": email},
                success:function(cnt){   //컨트롤러에서 넘어온 cnt값을 받는다 
                    if(cnt == "0"){    //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                 		$('.email_ok').css("display","inline-block");
                 		$('.email_already').css("display", "none");
                 		emailCheck2 = true;
                 		
                    } else{ 
                    	$('.email_already').css("display","inline-block");
                        $('.email_ok').css("display", "none");
                        emailCheck2 = false; 
                        
                    }
                 },
             
            });
          };  
   
    //비밀번호 확인
      $(function(){
    		$('#pwcheck').blur(function(){
    		   if($('#pw').val() != $('#pwcheck').val()){
    		    	if($('#pwcheck').val()!=''){
    			    alert("비밀번호가 일치하지 않습니다.");
    		    	    $('#pwcheck').val('');
    		          $('#pwcheck').focus();
    		       }
    		    }
    		})  	   
    	});
      </script>
      <script type="text/javascript" >
      $(document).ready(function(){
    	  $("#button").on("click", function(){
    		  
    		  	if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
    		  	if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
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
			  	if($("#email_input").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email_input").focus();
					return false;
				}
			  	if($("#address1").val()==""){
					alert("주소를 입력해주세요.");
					$("#address1").focus();
					return false;
				}
			  	if($("#address2").val()==""){
					alert("주소를 입력해주세요.");
					$("#address2").focus();
					return false;
				}
			  	if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				
			});  
      })
    </script>
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
             $("#address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $("#address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#address_input_3").attr("readonly",false);
                $("#address_input_3").focus();
            }
        }).open();
    }
</script>


<!--정규식 -->

<script type="text/javascript">


// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;

// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

//생년월일 정규식
var birthJ = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
				


/*이름 정규식*/
var namech ="";
$("#name").blur(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$(".name_check").text('');
			namech = true;
	}else {
		$('.name_check').text('2~6글자 사이의 이름을 입력해주세요.');
		$('.name_check').css('color', 'red');
		namech =  false;
	}
	
});

/* 휴대폰 정규식*/
var phonech ="";
$("#phone").blur(function() {
	if (phoneJ.test($(this).val())) {
			console.log(phoneJ.test($(this).val()));
			$(".phone_check").text('');
			phonech = true;
	} else {
		$('.phone_check').text('휴대전화를 다시 입력해주세요.');
		$('.phone_check').css('color', 'red');
		phonech = false;
	}
});



/*생년월일 정규식*/
var birthch ="";
$("#birth").blur(function() {
	if (birthJ.test($(this).val())) {
			console.log(birthJ.test($(this).val()));
			$(".birth_check").text('');
			birthch = true;
	} else {
		$('.birth_check').text('생년월일을 다시 입력해주세요.');
		$('.birth_check').css('color', 'red');
		birthch = false;
	}
});

/*닉네임 정규식*/
$("#nickname").change(function(){
    checknickname($('#nickname').val());
});
function checknickname(nickname){
    
    if(!/^[가-힣ㄱ-ㅎa-zA-Z0-9._ -]{2,8}$/.test(nickname)){            
        alert('2~8자리 이내 닉네임을 입력해주세요.');
        $('#nickname').val('').focus();
       
    }    
    
}

/*아이디 정규식*/
$("#id").change(function(){
    checkId($('#id').val());
});
function checkId(id){
    
    if(!/^[a-z0-9]{4,12}$/.test(id)){            
        alert('숫자나 영문자 조합으로 4~12자리 이내 사용해야 합니다.');
        $('#id').val('').focus();
       
    }    
    
}

/*비밀번호 정규식*/
$("#pw").change(function(){
    checkPassword($('#pw').val());
});
function checkPassword(pw){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#pw').val('').focus();
        
    }    
   
}

/* 입력 이메일 형식 정규식 검사 */

function emailFormCheck(email){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(email);
}



</script>

<script type="text/javascript">

         
/* 인증번호 이메일 전송 */
var code = "";     
//$(".email_check_button").click(function(){
function emailCheck() {
	var email = $("#email_input").val(); //입력한 이메일
	 var checkBox = $("#emailch");        // 인증번호 입력란
	 var boxWrap = $(".email_check_input_box"); // 인증번호 입력란 박스

	 if(emailCheck2 == false){
	    	alert("사용중인 이메일입니다.")
	    	$("#email_input").focus();
	    	return false;
	    }
	 if(emailFormCheck(email)){
		 $('.clear_ok').css("display","inline-block");
  		$('.clear_already').css("display", "none");
	 }else {
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
$("#emailch").blur(function(){
		console.log("code : " + code);
	var inputCode = $("#emailch").val();        // 입력코드    
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

$("#button").click(function(){
    if(idckCheck == true && emailCheck2 == true && emailnumCheck == true && namech == true && nicknameCheck == true && phonech == true && birthch == true){

	 $(".submit").submit();
    }
});
</script>

    	
</body>
</html>