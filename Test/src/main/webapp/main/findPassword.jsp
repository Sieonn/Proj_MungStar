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
              height: 100%;
      }
        .content {
        display: flex;
        justify-content: center;
        align-items: center;	
        height: calc(100vh - 95px); /* 화면 전체 높이에 대한 100% */
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

  <body>
    <jsp:include page="../main/header.jsp"></jsp:include>
    <body >
<div class="content">
      <div class="card" style="width:25rem;">
                 <div class="card-title">
          <h2 class="card-title" style="color: #0155b7"></h2>
        </div>
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