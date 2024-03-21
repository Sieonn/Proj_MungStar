<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <title>멍뭉별</title>
    <style>
      body,
      html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }

      .header {
        height: 10%;
        margin: 0 16.6%;
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
        margin-top: 30px;
      }

      .user-info img {
        height: 100%;
        border-radius: 100%;
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
      }
    </style>
  </head>
  <body>
    <div class="header">
      <div class="logo">
        <img src="<%=request.getContextPath()%>/image/logo.png" alt="Logo" width="90px" />
      </div>
      <div class="center-logo">
        <img src="<%=request.getContextPath()%>/image/cen_logo.png" alt="Cen Logo" width="90px" />
      </div>
      <div class="user-info">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
        <img src="<%=request.getContextPath()%>/image/profile.png" alt="Profile" width="50px" />
      </div>
    </div>
    <div class="header-line"></div>
  </body>
</html>