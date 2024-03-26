<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <title>비밀번호 재설정</title>
    <style>
      @font-face {
        font-family: "JalnanGothic";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      @font-face {
        font-family: "Pretendard-Regular";
        src: url("https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
          format("woff");
        font-weight: 400;
        font-style: normal;
      }

      body,
      html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
      .header {
        margin: 0 16.6%;
        height: 10%;

        display: flex;
        align-items: center;
        justify-content: space-between;
        color: white;
        padding: 0 20px;
        position: relative; /* 로고 중앙 정렬을 위해 position 설정 */
      }
      .logo {
        height: 100%;
        max-height: 100%;
        width: auto;
        margin-top: 20px;
      }

      .user-info {
        display: flex;
        align-items: center;
        margin-left: 10px;
        font-size: 12px;
        margin-top: 10px;
      }

      .user-info a {
        margin-right: 10px;
        margin-top: 50px;
      }

      .user-info img {
        height: 100%;
        border-radius: 100%;
        margin-top: 10px;
      }

      /* 하단 선 스타일 */
      .header-line {
        border-top: 2px solid rgb(221, 224, 224);
        margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
      }

      /* 중앙 로고 스타일 */
      .center-logo {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 20px;
      }

      .card {
        margin: 10% auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
      }

      #btn-Yes {
        background-color: #0155b7;
        border: none;
      }

      .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
      }
      .checkbox {
        margin-right: 20px;
        text-align: right;
      }
      .card-title {
        margin-left: 30px;
      }

      a {
        color: #0155b7;
        text-decoration: none;
      }

      .links {
        text-align: center;
        font-size: 14px;
        margin-bottom: 15px;
      }
      .text2 {
        color: #0155b7;
      }
      a:link {
        color: rgb(117, 117, 117);
        text-decoration: none;
      }
      a:hover {
        color: black;
        font-weight: 700;
      }
    </style>
  </head>
  <body width="100%" height="100%" align="center">
    <div class="header">
      <div class="logo">
        <img src="image/logo.png" alt="Logo" width="90px" />
      </div>
      <div class="center-logo">
        <img src="image/cen_logo.png" alt="Cen Logo" width="90px" />
      </div>
      <div class="user-info">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
        <img src="image/profile.png" alt="Profile" width="50px" />
      </div>
    </div>
    <div class="header-line"></div>
    <div class="card align-middle" style="width: 25rem">
      <div class="card-body">
        <form action="resetPw" class="form-signin" method="POST">
          <p class="text2" style="font-family: 'JalnanGothic'; font-size: 24px">
            비밀번호 재설정
          </p>
          <input type="hidden" name="member_id" value="<%" ="finduid" %></input>
          <input type="passwor"name="pw" id="pw" class="form-control" placeholder="비밀번호" required/>
          <br />
          <input
            type="passwor"
            name="pw2"
            id="pw2"
            class="form-control"
            placeholder="비밀번호 재확인"
            required
          />
          <p class="check" id="check2"></p>
          <br />
          <button
            type="button"
            id="btn-Yes"
            onclick="regist()"
            class="btn btn-lg btn-primary btn-block"
          >
            비밀번호 재설정
          </button>
        </form>
      </div>
      <div class="links">
        <a href="memberId">아이디 찾기</a> | <a href="memberLogin">로그인</a> |
        <a href="memberRegist">회원가입</a>
      </div>
    </div>
  </body>

  <script>

     	var check2 = "${findpw_checkt}";
    if(check2 != ""){
     	alert(check2);
    }

    // 비밀번호 정규식
    var pwJ = /^[a-z0-9]{6,20}$/;
    var pwc = false;
    var pwc2 = false;

    $("#pw").focusout(function(){
         if($('#pw').val() == ""){
       		$('#check').text('비밀번호를 입력해주세요.');
       	  	$('#check').css('color', 'red');

         }else if(!pwJ.test($(this).val())){
    		$('#check').text('6~20자의 영문 소문자, 숫자만 사용가능합니다');
    		$('#check').css('color', 'red');
         }else{
        	 pwc2 = true;
        	 $('#check').hide();
         }
      });

    $("#pw2").focusout(function(){
         if($('#pw2').val() == ""){
       		$('#check').text('필수 정보입니다.')
       	  	$('#check').css('color', 'red')
     	}else
      	 	$('#check').hide()
      });

    $("#pw2").keyup(function(){

        if($(this).val()!=$("#pw").val()){
            $("#check2").html("비밀번호가 다릅니다");
            $("#check2").css("color",'red');
            pwc = false;

        }else{
            $("#check2").html("비밀번호가 일치합니다");
            $("#check2").css("color",'blue');
            pwc = true;
        }
    });

    $("#pw").keyup(function(){

        if($(this).val()!=$("#pw2").val()){
            $("#check2").html("비밀번호가 다릅니다");
            $("#check2").css("color",'red');
            pwc = false;

        }else{
            $("#check2").html("비밀번호가 일치합니다");
            $("#check2").css("color",'blue');
            pwc = true;
        }
    });

    function regist(){
    	if(pwc2 == false){
    	      alert('비밀번호는 6~20자의 영문 소문자, 숫자만 사용가능합니다')
    	 }else if(pwc == false ){
    		  	alert('비밀번호를 다시 확인해주세요')
    	}else{
    	 $('form').submit();
    	}
    	<%session.invalidate();%>
    	};
  </script>
</html>

