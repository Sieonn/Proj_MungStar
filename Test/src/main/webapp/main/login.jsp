<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멍뭉별 | 로그인</title>
    <style>
      * {
        padding: 0;
        margin: 0;
        border: none;
      }
      .login-wrapper {
        width: 400px;
        height: 350px;
        padding: 40px;
        box-sizing: border-box;
        margin: 10% auto;
      }

      .login-wrapper > h2 {
        font-family: "JalnanGothic";
        font-size: 24px;
        color: #0155b7;
        margin-bottom: 10px;
        font-size: 48px;
        font-weight: 900;
        text-align: center;
      }
      #login-form > input {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #f8f8f8;
      }
      #login-form > input::placeholder {
        color: #d2d2d2;
      }
      #login-form > input[type="submit"] {
        color: #fff;
        font-size: 16px;
        background-color: #0155b7;
        margin-top: 20px;
      }
      #login-form > input[type="checkbox"] {
        display: none;
      }
      #login-form > label {
        color: #999999;
      }
      #login-form input[type="checkbox"] + label {
        cursor: pointer;
        padding-left: 26px;
        background-image: url("checkbox.png");
        background-repeat: no-repeat;
        background-size: contain;
      }
      #login-form input[type="checkbox"]:checked + label {
        background-image: url("checkbox-active.png");
        background-repeat: no-repeat;
        background-size: contain;
      }
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
      .content {
      width:1280px;
             margin:0 auto;
      }
      .container {
        display: flex;
        justify-content: center;
      }
      .title {
        position: absolute; /* 절대 위치 지정 */ /* 상단 여백을 50%로 설정 */
        left: 50%; /* 좌측 여백을 50%로 설정 */
        transform: translate(
          -50%,
          -50%
        ); /* 좌측과 상단으로 이동하여 가운데 정렬 */
        font-size: 48px;
        font-weight: 900;
      }
      a:link {
        color: black;
        text-decoration: none;
      }
      a:hover {
        color: black;
        font-weight: 700;
      }
      .links {
        margin-top: 5px;
        text-align: center;
      }
    </style>
  </head>
  <body>
   <jsp:include page="../main/header.jsp"></jsp:include>
    <div class="content">
      <div class="login-wrapper">
        <h2>LOGIN</h2>
        <form method="post" action="#" id="login-form">
          <input
            type="text"
            name="userName"
            placeholder="ID"
            autofocus
            required
          />
          <input type="password" name="userPassword" placeholder="Password" />

          <label for="remember-check">
            <input type="checkbox" id="remember-check" style="margin-right:10px;" />아이디 저장하기
          </label>

          <input type="submit" value="Login" required />
        </form>
        <div class="links">
          <a href="memberId">아이디 찾기</a> |
          <a href="memberPw">비밀번호 찾기</a> |
          <a href="memberRegist">회원가입</a>
        </div>
      </div>
    </div>
  </body>
</html>
