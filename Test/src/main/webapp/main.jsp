<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
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
      .content {
        margin: 0 16.6%;
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
      .place {
        margin-top: 52px;
      }
      .text_h {
        font-size: 40px;
        font-family: "JalnanGothic";
        text-align: center;

        color: #0155b7;
      }
      .loc {
        margin: 20px 0 40px 0;
        display: flex;
        justify-content: center;
        gap: 20px; /* plac 사이의 간격 설정 */
      }
      .plac {
        width: 277px; /* plac의 고정 너비 */
        height: 307px; /* plac의 고정 높이 */
        border-radius: 10px;
        background-color: #e9eff6;
        text-align: center;
        font-weight: 500;
        overflow: hidden;
        position: relative;
      }
      .plac img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 66.67%; /* 이미지가 보더의 3분의 2에 맞춰지도록 설정 */
      }
      .plac .text {
        font-family: 'JalnanGothic';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 33.33%; /* 텍스트가 보더의 나머지 1/3에 맞춰지도록 설정 */
        padding: 25px;
        box-sizing: border-box; /* 내부 패딩이 보더 크기에 포함되도록 설정 */
        overflow: hidden;
        font-size: 20px;
        text-align: center;
      }
      .plac:hover {
        transform: scale(1.1);
      }
      .free {
        gap: 20px;
        display: flex;
        margin-bottom: 20px;
      }
      .free_b {
        width: 50%; /* .free_b를 반씩 차지하도록 설정 */
        box-sizing: border-box; /* padding, border를 요소의 크기에 포함 */
        padding: 0 10px; /* 좌우 여백 추가 */
      }
      .free_box {
        width: 100%;
        height: 128px;
        background-color: #f0f0f0;
      }
      .text {
        font-size: 20px;
        font-family: "JalnanGothic";
        margin: 10px 0;
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
    <div class="content">
      <div class="container">
        <div class="slider">
          <div class="img">
            <img src="image/banner1.png" alt="이미지 1" />
          </div>
          <div class="img">
            <img src="image/banner2.png" alt="이미지 2" />
          </div>
          <div class="img">
            <img src="image/banner3.png" alt="이미지 3" />
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

      <div class="place">
        <div class="text_h">이번주말 함께하개?</div>
        <div
          class="text_h"
          style="
          margin-top: 10px;
            font-size: 18px;
            font-family: 'Pretendard-Regular';
            font-weight: bold;
            color: #7b7b7b;
            line-height: 1.13;
          "
        >
          따뜻한 봄이왔어요~🌸
        </div>
      </div>
      <div class="loc">
        <div class="plac">
            <img src="image/loc_1.jpg" alt="Image 1"/>
            <div class="text">경북 의성 펫월드<br>
            <div style="font-size: 14px; font-family: 'Pretendard-Regular';">경북 의성 단북면 안계길</div></div>
        </div>
        <div class="plac">
            <img src="image/loc_2.jpg" alt="Image 2"/>
            <div class="text" style="font-size: 18px;">인천 반려동물 놀이터
              <div style="font-size: 14px; font-family: 'Pretendard-Regular';">인천 남동구 무네미로</div></div>
        </div>
        <div class="plac">
            <img src="image/loc_3.jpg" alt="Image 3"/>
            <div class="text" style="font-size: 18px;">반려동물 테마파크
              <div style="font-size: 14px; font-family: 'Pretendard-Regular';">경기 오산시 오산로</div></div>
        </div>
        <div class="plac">
            <img src="image/loc_4.jpg" alt="Image 4"/>
            <div class="text"  style="font-size: 18px;">임실 오수의경관광지
              <div  style="font-size: 14px; font-family: 'Pretendard-Regular';">전북 임실군 오수면 금암리</div></div>
        </div>
    </div>
      <div class="free">
        <div class="free_b">
          <div class="text">자유게시판</div>
          <div class="free_box"></div>
        </div>
        <div class="free_b">
          <div class="text">자유게시판</div>
          <div class="free_box"></div>
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

