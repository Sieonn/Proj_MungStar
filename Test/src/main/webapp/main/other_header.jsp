<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="image/logo.png" />
    <title>멍뭉별</title>
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

      .nav_menu {
        display: flex;
        font-size: 17px;
        margin-top: 10px;
        margin-left: 10px; /* 로고와 오른쪽 여백을 조절하기 위해 남은 공간을 모두 차지하도록 설정 */
      }

      .nav_menu a {
        margin-right: 35px; /* 각 메뉴 간의 오른쪽 여백 설정 */
        margin-top: 50px;
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

      .welcome-message {
        font-size: 12px;
        margin-right: 20px;
      }

      /* 하단 선 스타일 */
      .header-line {
        border-top: 2px solid rgb(221, 224, 224);
        margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
      }

      a:link {
        color: black;
        text-decoration: none;
      }
      a:hover {
        color: black;
        font-weight: 700;
      }
    </style>
  </head>
  <body>
    <div class="header">
      <div class="logo">
        <img src="image/logo.png" alt="Logo" width="90px" />
      </div>
      <div class="nav_menu">
        <a href="#">산책로</a>
        <a href="#">24시 동물병원</a>
        <a href="#">동반 시설</a>
        <a href="#">미멍보호소</a>
        <a href="#">임시 보호해요</a>
      </div>
      <div class="welcome-message">회원님 안녕하세요!</div>
      <div class="user-info">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
        <img src="image/profile.png" alt="Profile" width="50px" />
      </div>
    </div>
    <div class="header-line"></div>
  </body>
</html>

