<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.Member"%>
<%@ page import="dto.Dog"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
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

.container {
	width: 1280px;
	margin: 0 auto;
}

.mypage-container {
	display: flex;
	margin: 5% 0;
	height: 100%;
	justify-content: center;
	align-items: center;
	flex: 1;
}

.mypage-container2 {
	display: flex;
	margin: 2% 0;
	flex: 1;
}

.myactive {
	height: 100%;
}

.inner_profile {
	width: 100%;
	height: 100%;
	padding: 30px;
	border-radius: 50%;
	box-sizing: border-box;
	background-color: #f0f0f0;
	box-shadow: 0 5px 5px rgb(179, 179, 179);
}

.inner_profile img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	box-shadow: 0 -3px 10px rgb(94, 94, 94);
}

.gender {
	display: flex;
	align-items: center;
}

.gender input[type="radio"] {
	display: none;
}

.gender input[type="radio"]+label {
	display: inline-block;
	cursor: pointer;
	height: 27px;
	width: 90px;
	border: 1px solid #dadada;
	line-height: 27px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
	border-radius: 3px;
}

.gender input[type="radio"]+label {
	background-color: #fff;
	color: #333;
}

.gender input[type="radio"]:checked+label {
	background-color: #0155b7;
	color: #fff;
}

.wel-txt {
	font-family: "JalnanGothic";
	font-size: 38px;
	font-weight: 700;
	margin-left: 60px;
	position: relative;
}

.hello {
	display: grid;
}

.actGrid {
	display: grid;
	margin: 0 3%;
	height: 100%;
}

.actTitle {
	font-size: 25px;
	font-weight: 700;
	margin: 5% 0;
}

.inner-txt {
	text-align: left;
	width: 150px;
	font-size: 16px;
	font-weight: 700;
}

.myinfo {
	font-size: 14px;
}

.field1 {
	display: flex;
	padding: 5px;
	flex: 1;
	margin: 0 10%;
}

.petInfo {
	border-style: solid;
	border-width: 3px 0 1px 0;
	border-color: #c9c9c9;
	padding: 3% 0;
}

.petInfo2 {
	border-style: solid;
	border-width: 3px 0 1px 0;
	border-color: #c9c9c9;
	padding: 3% 0;
}

.field {
	display: flex;
	flex: 1;
	padding: 1% 0;
}

.signup-container {
	margin: 0 10%;
}
/*
      .actBtn {
        flex: 1;
        padding: 25px 15px;
        margin: 5px;
        font-weight: 700;
        display: flex;
        text-align: center;
        align-items: center;
        justify-content: center;
        border: none;
        border-radius: 10px;
        background-color: #275efe;
        color: #fff;
        box-shadow: 0px 3px 3px rgb(179, 179, 179);
      }*/
.actBtn {
	flex: 1;
	padding: 20px 15px;
	border: 2px solid #c9c9c9;
	border-radius: 5px;
	font-family: "Lato", sans-serif;
	font-weight: 700;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	margin: 5px;
	transition: all 0.3s ease;
	text-align: center;
	align-items: center;
	justify-content: center;
}

.actBtn:hover {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px rgba(128, 128, 128, 0.133), 4px 4px 5px 0px #0001;
}

.btnSet {
	margin-top: 15px;
	text-align: center;
}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 5px 15px;
	border-radius: 3px;
	border: 1px solid #404650;
	text-decoration: none;
	/* box-shadow: 0 1px 1px #404650;*/
	text-decoration: none;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill {
	background-color: #fff;
	color: #404650;
}

a.btn-empty {
	background-color: #fff;
	color: #404650;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover {
	cursor: pointer;
}

button:hover {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px rgba(128, 128, 128, 0.133), 4px 4px 5px 0px #0001;
}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
        function previewFile() {
          var preview = document.querySelector("img");
          var file = document.querySelector("input[type=file]").files[0];
          var reader = new FileReader();

          reader.addEventListener(
            "load",
            function () {
              preview.src = reader.result;
            },
            false
          );

          if (file) {
            reader.readAsDataURL(file);
          }
        }
        $(function () {
          $("#profile-image1").on("click", function () {
            $("#profile-image-upload").click();
          });
        });
      }
    </script>
<script>
      document.addEventListener("DOMContentLoaded", function () {
        const previewImage = document.getElementById("preview-image");
        const fileInput = document.getElementById("file-input");
        const uploadButton = document.getElementById("upload-btn");
        const deleteButton = document.getElementById("delete-btn");

        // 파일 선택 시 미리보기 업데이트
        fileInput.addEventListener("change", function (event) {
          const file = event.target.files[0];
          if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
              previewImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
          }
        });

        // 이미지 업로드 버튼 클릭 시 input 클릭 이벤트 발생
        uploadButton.addEventListener("click", function () {
          fileInput.click();
        });

        // 이미지 삭제 버튼 클릭 시 미리보기 초기화
        deleteButton.addEventListener("click", function () {
          previewImage.src =
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
          fileInput.value = null;
        });
      });
    </script>
</head>
<body>
	<%@ include file="../main/header.jsp"%>
	<div class="container">
		<!-- 인삿말 -->
		<div class="mypage-container">
			<div class="wel-Img">
				<div class="inner_profile">
					<img src="${path}/image/프로필01.jpg" />
				</div>
			</div>
			<div class="wel-txt">
				<div class="hello">
					<span
						style="display: flex; text-decoration: underline; text-underline-offset: 10px; text-decoration-thickness: 5%; font-family: 'JalnanGothic';">
						${user.memNick}<span
						style="text-decoration: none; font-weight: 900">&nbsp;님</span>
					</span>
					<div style="margin-top: 10px; font-weight: 900">다녀오셨어요?</div>
				</div>
			</div>
		</div>

		<hr />
		<!-- 내 활동 -->

		<div class="mypage-container2">
			<div class="myactive"
				style="width: 100%; padding: 0 5%; border-right: 2px solid rgb(199, 199, 199);">
				<div class="actGrid">
					<div class="actTitle">개인 정보</div>
					<div class="petInfo" style="text-align: center">
						<!-- <hr /> -->
						<input type="hidden" name="memid" value="${dog.memId}" />
						<div class="field1">
							<div class="inner-txt">아이디</div>
							<div class="myinfo">${user.memId}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">닉네임</div>
							<div class="myinfo">${user.memNick}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">이메일</div>
							<div class="myinfo">
								<span id="tel1">${user.memEmail}</span>
							</div>
						</div>
						<div class="field1">
							<div class="inner-txt">전화번호</div>
							<div class="myinfo">${user.memPhone}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">주소</div>
							<div class="myinfo">${user.memAddress1}${user.memAddress2}
							</div>
						</div>
					</div>

					<!-- 펫 정보(추가/ 삭제) -->
					<!-- <div class="actTitle">반려동물 정보</div> -->
					<div class="actTitle"
						style="display: flex; justify-content: space-between; align-items: center;">
						<span>추가 프로필</span>
						<div class="header-line"></div>
					</div>
					<c:forEach items="${dogs}" var="dog">
					<div class="petInfo"
						style="text-align: center; border-width: 3px 0 0 0">
						<div class="signup-container">
							<!-- 아이디 -->
							<div class="field">
								<div class="inner-txt">반려동물 이름</div>
								<div class="inner-input">${dog.dogName}</div>
							</div>

							<!-- 닉네임 -->
							<div class="field">
								<div class="inner-txt">반려견 나이</div>
								<div class="inner-input">${dog.dogAge}</div>
							</div>

							<div class="field">
								<div class="inner-txt">성별</div>
								<div class="inner-input">${dog.dogGender}</div>
							</div>

							<div class="field">
								<div class="inner-txt">프로필 사진</div>
								<div class="inner-input">
									<img src="../image/프로필01.jpg"
										style="width: 100px; height: 100px" />
								</div>
							</div>
						</div>
						<div class="btnSet">
							<a class="btn-fill" href="${path}/doginsert?id=${user.memId }">추가</a>
							<a class="btn-fill" href="${path}/dogmodify?id=${user.memId }">수정</a>
							<a class="btn-fill"
								onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='${path}/dogdelete?dogNum=${dog.dogNum }' }">삭제</a>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>

			<!--왜 안먹어 이시키야
        -->
			<div class="myactive"
				style="width: 100%; height: 100%; padding: 0 5%">
				<div class="actGrid">
					<div class="actTitle">내 활동</div>
					<div class="petInfo">
						<div style="margin: 5% 7%">
							<div class="act-btn" style="display: flex">
								<button class="actBtn">
									<a href="${path}/walkBoard?id=${user.memId }">산책로
										추천</a>
								</button>
								<button class="actBtn" id="">자유게시판</button>
							</div>
							<div class="act-btn" style="display: flex">
								<button id="" class="actBtn">임시 보호소</button>
								<button id="" class="actBtn">미멍 보호소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
