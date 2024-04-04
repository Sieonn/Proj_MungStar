<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="../image/logo.png" />
<title>멍뭉별</title>
<style>
@font-face {
	font-family: "JalnanGothic";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "Pretendard-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
		format("woff");
	font-weight: 400;
	font-style: normal;
}

body, html {
	margin: 0;
	padding: 0;
	font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
}

.content {
	width: 1280px;
	margin: 0 auto;
	padding-bottom: 100px;
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
	height: 90px;
	border-radius: 20px;
	background-color: #ffffff;
	box-shadow: 0px 4px 8px #c5c5c5;
	margin-left: 10px;
	text-align: center;
	line-height: 95px;
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
	display: grid;
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
	height: 270px; /* plac의 고정 높이 */
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
	font-family: "JalnanGothic";
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
	margin: 3% 0;
}

.free_b {
	width: 100%; /* .free_b를 반씩 차지하도록 설정 */
	box-sizing: border-box; /* padding, border를 요소의 크기에 포함 */
	/* 좌우 여백 추가 */
}

.free_box {
	width: 100%;
	height: 128px;
	background-color: #f0f0f0;
}

.headline-container {
	display: grid;
	margin-top: 40px;
}

.more {
	text-align: right;
}

.headline {
	font-family: "JalnanGothic";
	font-size: 24px;
}

.archive {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	justify-content: space-between;
	margin-top: 20px;
}

.photo {
	width: calc(( 100% - 80px)/5);
	height: 230px;
	border-radius: 10px;
	background-color: #ffffff;
	border: 1px solid #969090;
}

.inner_photo {
	width: 100%;
	height: 160px;
	padding: 10px;
	box-sizing: border-box;
}

.inner_photo img {
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

.inner_title {
	margin-top: 7px;
	font-weight: 700;
	font-size: 16px;
}

.inner_text {
	margin-top: 5px;
	font-size: 12px;
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
	<%@ include file="../main/header.jsp"%>
	<div class="content">
		<div class="container">
			<div class="slider">
				<div class="img">
					<img src="../image/banner1.png" alt="이미지 1" />
				</div>
				<div class="img">
					<img src="../image/banner2.png" alt="이미지 2" />
				</div>
				<div class="img">
					<img src="../image/banner3.png" alt="이미지 3" />
				</div>
			</div>
		</div>
		<div class="dots-container">
			<span class="dot active"
				onclick="currentSlide = 0; showSlide(currentSlide);"></span>
			<span class="dot"
				onclick="currentSlide = 1; showSlide(currentSlide);"></span>
			<span class="dot"
				onclick="currentSlide = 2; showSlide(currentSlide);"></span>
		</div>

		<div class="menu_container">
			<<<<<<< HEAD
			<div class="menu"
				onclick="location.href='${path}/walking/walkBoard';"
				style="cursor: pointer;">산책로 추천</div>
			<div class="menu"
				onclick="location.href='${path}/hospital/hospitalBoard';"
				style="cursor: pointer;">24시 동물병원</div>
			<div class="menu"
				onclick="location.href='${path}/freeBoard/freeboard';"
				style="cursor: pointer;">자유게시판</div>
			<div class="menu"
				onclick="location.href='${path}/lost/lostBoard';"
				style="cursor: pointer;">미멍보호소</div>
			<div class="menu"
				onclick="location.href='${path}/temp/tempBoard';"
				style="cursor: pointer;">임시보호</div>
		</div>

		<div class="place">
			<div class="text_h">이번주말 함께하개?</div>
			<div class="text_h"
				style="margin-top: 10px; font-size: 18px; font-family: 'Pretendard-Regular'; font-weight: bold; color: #7b7b7b; line-height: 1.13;">
				따뜻한 봄이왔어요~🌸</div>
			<span class="more"> <a href="#"
				style="font-size: 12px; margin-right: 60px;">더보기</a></span>
		</div>
		<div class="loc">
			<div class="plac">
				<img src="../image/loc_1.jpg" alt="Image 1" />
				<div class="text">
					경북 의성 펫월드<br />
					<div style="font-size: 14px; font-family: 'Pretendard-Regular'">
						경북 의성 단북면 안계길</div>
				</div>
			</div>
			<div class="plac">
				<img src="../image/loc_2.jpg" alt="Image 2" />
				<div class="text" style="font-size: 18px">
					인천 반려동물 놀이터
					<div style="font-size: 14px; font-family: 'Pretendard-Regular'">
						인천 남동구 무네미로</div>
				</div>
			</div>
			<div class="plac">
				<img src="../image/loc_3.jpg" alt="Image 3" />
				<div class="text" style="font-size: 18px">
					반려동물 테마파크
					<div style="font-size: 14px; font-family: 'Pretendard-Regular'">
						경기 오산시 오산로</div>
				</div>
			</div>
			<div class="plac">
				<img src="../image/loc_4.jpg" alt="Image 4" />
				<div class="text" style="font-size: 18px">
					임실 오수의경관광지
					<div style="font-size: 14px; font-family: 'Pretendard-Regular'">
						전북 임실군 오수면 금암리</div>
				</div>
			</div>
		</div>
		<div class="free">
			<div class="free_b">
				<div class="headline-container">
					<span class="headline"> 자유게시판 </span> <span class="more"> <a
						href="../freeBoard/freeBoard" style="font-size: 12px">더보기</a></span>
				</div>
				<div class="free_box"></div>
			</div>
		</div>

		<div class="headline-container">
			<span class="headline"> 임시보호해요 </span> <span class="more">
			<a href="'${path}/temp/tempBoard.jsp';"
				style="font-size: 12px">더보기</a>
			</span>
          <a href="../temp/tempBoard" style="font-size: 12px">더보기</a>
		</div>
		<div class="header-line"></div>
		<div class="archive">
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp1.jpg" />
					<div class="inner_title">영희</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp2.jpg" />
					<div class="inner_title">철수</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp3.jpg" />
					<div class="inner_title">뽀삐</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp4.jpg" />
					<div class="inner_title">쪼롱</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp5.jpg" />
					<div class="inner_title">초코</div>
					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
		</div>

		<div class="headline-container">
			<span class="headline"> 미멍보호소 </span> <span class="more"> <a
				href="'${path}/lost/lostBoard.jsp'" style="font-size: 12px">더보기</a></span>
		</div>
		<div class="header-line"></div>
		<div class="archive">
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp1.jpg" />
					<div class="inner_title">영희</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp2.jpg" />
					<div class="inner_title">철수</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp3.jpg" />
					<div class="inner_title">뽀삐</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp4.jpg" />
					<div class="inner_title">쪼롱</div>

					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
			<div class="photo">
				<div class="inner_photo">
					<img src="../image/temp5.jpg" />
					<div class="inner_title">초코</div>
					<div class="inner_text">가산디지털단지</div>
				</div>
			</div>
		</div>
		<div class="footer"></div>
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
