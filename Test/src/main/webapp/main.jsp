<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>멍뭉별</title>
    <style>
      body {
        margin: 0 16.6%;
      }
      html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }

      .header {
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
      .container {
        display: flex;
        justify-content: center;
      }

      .slider {
        width: 100%;
        height: 250px;
        border-radius: 40px;
        overflow: hidden;
        position: relative;
        margin-top: 15px;
      }

      .slider img {
        width: 100%;
        height: 250px;
        position: absolute;
        transition: left 3s ease-in-out;
        border-radius: 10px; /* 왼쪽에도 border-radius 적용 */
      }

      .dots-container {
        text-align: center;
        margin-top: 5px;
      }

      .dot {
        display: inline-block;
        width: 11px;
        height: 11px;
        background-color: #c5c5c5;
        border-radius: 50%;
        margin: 5px;
        cursor: pointer;
      }

      .dot.active {
        background-color: #fed74b;
      }

      .menu_container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        height: 100px;
      }

      .menu {
        width: 235px;
        height: 100px;
        border-radius: 20px;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px #c5c5c5;
        margin-left: 10px;
        text-align: center;
        line-height: 105px;
        font-weight: 500;
        overflow: hidden;
      }
      .menu:hover {
        background-color: #fed74b;
        font-weight: 700;
        color: #ffffff;
      }
      @font-face {
        font-family: "JalnanGothic";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      .place {
        margin-top: 40px;
      }
      .text_h {
        font-size: 40px;
        font-family: "JalnanGothic";
        text-align: center;

        color: #0155b7;
      }
    </style>
  </head>
  <body>
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
    <div class="container">
      <div class="slider">
        <div class="img">
          <img src="image/banner1.png" alt="이미지 1" />
        </div>
        <div class="img">
          <img src="image/banner2.png" alt="이미지 2" />
        </div>
        <div class="img">
          <img src="image/cat.jpg" alt="이미지 3" />
        </div>
      </div>
    </div>
    <div class="dots-container">
      <span
        class="dot active"
        onclick="currentSlide = 0; showSlide(currentSlide);"
      ></span>
      <span
        class="dot"
        onclick="currentSlide = 1; showSlide(currentSlide);"
      ></span>
      <span
        class="dot"
        onclick="currentSlide = 2; showSlide(currentSlide);"
      ></span>
    </div>

    <div class="menu_container">
      <div class="menu">산책로 추천</div>
      <div class="menu">24시 동물병원</div>
      <div class="menu">애견 동반 시설</div>
      <div class="menu">미멍보호소</div>
      <div class="menu">임시보호</div>
    </div>

    <div class="place" style="margin-top: 40px">
      <div class="text_h">이번주말 함께하개?</div>
      <div
        class="text_h"
        style="
          font-size: 14px;
          font-family: 'Pretendard-Regular';
          font-weight: 700;
          color: rgb(80, 80, 80);
          line-height: 1.13;
        "
      >
        따뜻한 봄이왔어요~🌸
      </div>
    </div>
    <script>
      let currentSlide = 0;
      const slides = document.querySelectorAll(".img");
      const dots = document.querySelectorAll(".dot");
      const slideCount = slides.length;

      function showSlide(n) {
        slides.forEach((slide) => (slide.style.display = "none"));
        slides[n].style.display = "block";
        dots.forEach((dot) => dot.classList.remove("active"));
        dots[n].classList.add("active");
      }

      function nextSlide() {
        currentSlide = (currentSlide + 1) % slideCount;
        showSlide(currentSlide);
      }

      function prevSlide() {
        currentSlide = (currentSlide - 1 + slideCount) % slideCount;
        showSlide(currentSlide);
      }

      document.addEventListener("DOMContentLoaded", () => {
        showSlide(currentSlide);
        setInterval(nextSlide, 5000); // 3초마다 자동 슬라이드
      });
    </script>
  </body>
</html>


