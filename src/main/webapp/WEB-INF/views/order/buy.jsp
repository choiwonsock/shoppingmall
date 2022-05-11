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
<meta charset="UTF-8">
<title>상품 주문</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h2>주문서 작성하기</h2>

	<form:form commandName="itembuyVo" action="order" method="POST">
		<table border="1">
			<tr>
				<td>배송지 선택</td>
				<td>신규 배송지 <input type="radio" value="1" name="useraddr1" checked></td>
				<td>기존 배송지 <input type="radio" value="0" name="useraddr1"></td>
			</tr>
			<tr>
				<td>수령인</td>
				<td colspan="2"><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>배송지 주소</td>
				<td colspan="2">
				<input type="text" class = "user_addr1" name="useraddr1" placeholder="주소">
				
				<input type="button" onclick = "execDaumPostcode()" value = "우편번호 찾기"/><br>
				
				<input type="text" class = "user_addr2" name="useraddr2" placeholder="상세주소">
			</tr>
			<tr>
				<td>배송시 요청사항</td>
				<td><select name="orderinfo">
						<option value="부재시 문앞">부재시 문앞</option>
						<option value="부재시 경비실">부재시 경비실</option>
						<option value="문앞에 두고 문자">문앞에 두고 문자</option>
						<option value="문앞에 두고 전화">문앞에 두고 전화</option>
						
				</select></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				
				<td colspan="2"><input type="text"  id="orderphon" name="orderphon"></td>
				    <div class="phone_check"></div>
					
			</tr>

		</table>
		<input type="submit" value="주문">
	</form:form>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
	<script type = "text/javascript">
		$(document).ready(function() {

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=useraddr1]").click(function() {

				if ($("input[name=useraddr1]:checked").val() == "1") {
					$("input:text[name=useraddr1]").attr("disabled", false);
					// radio 버튼의 value 값이 1이라면 활성화

				} else if ($("input[name=useraddr1]:checked").val() == "0") {
					$("input:text[name=useraddr1]").attr("disabled", true);
					// radio 버튼의 value 값이 0이라면 비활성화
				}
			});
		});
		
		
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		var phonech ="";
		$("#orderphon").blur(function() {
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
             $(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".user_addr1").val(addr);
            //$("[name=memberAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $(".user_addr2").attr("readonly",false);
                $(".user_addr2").focus();
            }
        }).open();
    }
</script>


	
</body>
</html>