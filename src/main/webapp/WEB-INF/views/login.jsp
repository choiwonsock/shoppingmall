<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>shoppingmall</title>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">

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
          <h1><a href="/web/member/main" rel="dofollow">?????? 3?????? ?????????</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              <form id="stripe-login" name="form"  method="post" action="/web/member/login" 
		onsubmit="return save_check();" >
                <div class="field padding-bottom--24">
                <div class="grid--50-50">
                  <label for="id">?????????</label>
		 	<div class="reset-pass">
                   <a href="/web/member/find_id_form">???????????????</a>
                    </div>
                    </div>
                  <input type="text" id="id" name="id"  /> 
                
                </div>
                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">????????????</label>
                    <div class="reset-pass">
                      <a href="/web/member/find_pw_form">???????????? ??????</a>
                    </div>
                  </div>
                  <input type="password" id="pw" name="pw"  />    
                </div>
		<c:if test="${msg eq 'failure'}">
		 <div style="color:red;"> ????????? ?????? ??????????????? ???????????? ????????????.
 		</div>
		</c:if>
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                  <label><input type="checkbox" id="save" name= "save" class= "save" > ????????? ?????? </label>
                </div>
                <div class="field padding-bottom--24">
                 <input type="submit" id="login_proc" name="login_proc" onclick = "loginProcess()" value = "??? ??? ??? "/>
                </div>
                <div class="field">
                  <a class="ssolink" href="/web/member/register">??? ??? ??? ???</a>
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
 
<script type="text/javascript">	
		$("#login_proc").click(function(){
			var userid=$("#id").val();
			 var passwd=$("#pw").val(); 
			 var remember = $("#save").is(":checked");
		
		 
		 if(userid == ""){
		  alert('???????????? ???????????????');
		  $("#id").val('').focus(); //??????????????? ??????
	
		   //?????? ??????
		}
		if(passwd==""){
		 alert('??????????????? ???????????????');  
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
        
        if (document.cookie.length > 0) { // ????????? ???????????? ????????? 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // ????????? ???????????? 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // ?????? ?????? ????????? ?????? ????????? ?????? ?????? 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end??????  : " + end);
                
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