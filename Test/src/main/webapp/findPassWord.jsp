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
    <title>비밀번호 찾기</title>
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
      .wrapper {
        /*헤더 고정*/
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 100;
        background-color: #ffffff;
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
        margin: 5% auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
      }

      #btn-Yes {
        background-color: #0155b7;
        border: none;
        margin-top: 10px;
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
      .card-title {
        margin-left: 30px;
      }
      .links {
        text-align: center;
        margin-bottom: 15px;
      }

      a {
        color: #0155b7;
        text-decoration: none;
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
    <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

      <div class="card align-middle" style="width:25rem;">
            
        <div class="card-body">
          <form action="findPw" class="form-signin" method="POST">
            <p class="text2" style="font-family: 'JalnanGothic'; font-size: 24px">
              비밀번호  찾기
            </p>
            <input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" required><br>
            <input type="text" name="name" id="name" class="form-control" placeholder="이름" required><BR>
            <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
            <p class="checks" id="checks"></p>
            <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
          </form>
          
        </div>
            <div class="links">
                <a href="memberId">아이디 찾기</a> | <a href="memberLogin">로그인</a> | <a href="memberRegist">회원가입</a>
    
            </div>
      </div>
      
      </body>
        <script type="text/javascript">
    
      
          //아이디 정규식
        var idJ = /^[a-z0-9]{5,20}$/;
        
          $("#member_id").focusout(function(){
           if($('#member_id').val() == ""){
             $('#checks').text('아이디를 입력해주세요.');
               $('#checks').css('color', 'red');
           }
           });
          
          $("#member_id").focusout(function(){
            if(!idJ.test($(this).val())){
            $('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
            $('#checks').css('color', 'red');
          }
           });
          
          $("#name").focusout(function(){
           if($('#name').val() == ""){
             $('#checks').text('이름을 입력해주세요.');
               $('#checks').css('color', 'red');
           }
           });
           
          $("#email").focusout(function(){
           if($('#email').val() == ""){
             $('#checks').text('이메일을 입력해주세요');
               $('#checks').css('color', 'red');
           }
           });
      
      </script>
    </html>