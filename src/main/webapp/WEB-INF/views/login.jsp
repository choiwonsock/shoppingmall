<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<nav class="navbar_fixed_top"> 
 <form name="form"  method="post" action="/web/member/login" onsubmit="return save_check();">
 
  
   <label for="id">아이디</label>
   <input type="text" id="id" name="id"  />      

  
  
   <label for="pw">패스워드</label>
   <input type="password" id="pw" name="pw"  />      
  
  <button type="submit" id="login_proc" name="login_proc" onclick = "loginProcess()">로그인 </button>
 	<a href="/web/member/main"><input type="button" value="메인으로"></a>
   <c:if test="${msg eq 'failure'}">
	 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 	</div>
	</c:if><br>

	

	
	<a href="/web/member/find_id_form"><input type="button" value="아이디찾기"></a>
	<a href="/web/member/find_pw_form"><input type="button" value="비밀번호 찾기"></a>
 	<label><input type="checkbox" id="save" name= "save" class= "save" > 아이디 저장 </label>
	<label><input type="checkbox" id="useCookie" name= "useCookie" value ="1" > 자동 로그인 </label>

	

 
 </form>   
</nav>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
<script type="text/javascript">	
		$("#login_proc").click(function(){
			var userid=$("#id").val();
			 var passwd=$("#pw").val(); 
			 var remember = $("#save").is(":checked");
		
		 
		 if(userid == ""){
		  alert('아이디를 입력하세요');
		  $("#id").val('').focus(); //입력포커스 이동
	
		   //함수 종료
		}
		if(passwd==""){
		 alert('비밀번호를 입력하세요');  
		 $("#pw").val('').focus();
		}
		
	});
</script>

<script type="text/javascript">
     $(function() {
         
           fnInit();
         
     });
     
     function save_check(){
         saveid();
     }
 
    function fnInit(){
        var cookieid = getCookie("save");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='save']").prop("checked", true);
            $('#id').val(cookieid);
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        
        
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#save").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("save", $("#id").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("save", $("#id").val(), expdate);
             
        }
    }
 
 
    
    
</script>


</body>
</html>