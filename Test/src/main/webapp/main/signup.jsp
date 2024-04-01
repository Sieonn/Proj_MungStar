<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function findAddr() {
        new daum.Postcode({
          oncomplete: function (data) {
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") {
              // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else {
              // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? "," + data.buildingName
                    : data.buildingName;
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
            } else {
              document.getElementById("mainAddress").value = "";
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;

            document.getElementById("mainAddress").value = addr;
            document.getElementById("mainAddress").value += extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
          },
        }).open();

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
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
      .container {
        width: calc(
          100% - (20% * 2)
        ); /* 콘텐츠 영역의 너비에서 양쪽 여백을 뺀 크기로 설정 */
        margin: 0 20%; /* 양쪽 여백을 16.6%로 설정 */
        margin-bottom: 20px;
        margin-top: 20px;
      }
      .container .field {
        margin: 5px 0;
      }
      .container b {
        display: block;
        margin-bottom: 5px;
      }

      .container input:not(input[type="radio"]),
      .container select {
        border: 1px solid #d1d1d1;
        padding: 7px;
        width: 100%;
        margin-bottom: 5px;
      }
      .container .innner-input input:focus,
      .container select:focus {
        border: 1px solid #9c9c9c;
        outline: none;
      }
      .field .tel-number div {
        display: flex;
        flex: 1;
      }

      .field.tel-number div input:nth-child(1) {
        flex: 1;
      }
      input:focus {
        outline: none;
      }
      .field.tel-number div input:nth-child(2) {
        flex: 1;
      }
      .field {
        display: flex;
        align-items: baseline;
        /* 입력 상자와 텍스트를 같은 기준선에 정렬 */
      }
      .field .pwd div {
        display: inline;
      }
      .field input[type="text"],
      .field input[type="password"],
      .container select,
      .field input[type="email"],
      .field input[type="tel"] {
        flex: 1; /* 자동으로 너비를 할당 */
        margin-left: 10px; /* 오른쪽 여백 */
        border-radius: 3px;
      }
      .container .field input[type="button"],
      .container input[type="submit"] {
        margin-left: 3px;
        width: auto;
        /* 버튼 너비를 내용에 맞게 자동 조정 */
        /* 버튼 내용에 따라 적절한 패딩 적용 */
        border-radius: 3px;
        padding: 6px 15px;
        font-weight: bold;
        font-size: 13px;
        letter-spacing: 2px;
        background-color: #0155b7;
        color: white;
        border: none;
        margin-left: 5px;
      }
      .inner-input2 .inner-input button {
        margin-left: 3px;
        width: auto;
        border-radius: 3px;
        background-color: #0155b7;
        color: white;
        border: none;
        font-size: 12px;
        padding: 5px 10px;
      }
      input::placeholder {
        font-size: 12px;
      }
      .container > h2 {
        font-family: "JalnanGothic";
        font-size: 24px;
        color: #0155b7;
        margin-bottom: 40px;
        font-size: 48px;
        font-weight: 900;
        text-align: center;
      }
      .signup-container,
      .petFormTemplate {
        margin: 3% 13%;
        height: auto;
      }
      .inner-title {
        font-size: 14px;
        font-weight: 700;
        width: 130px;
        display: flex;
      }
      .inner-input {
        display: flex;
      }
      .inner-input2 {
        display: grid;
      }

      .gender {
        padding: 5px 10px;
      }
      .gender input[type="radio"] {
        display: none;
      }
      .gender input[type="radio"] + label {
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
      .gender input[type="radio"] + label {
        background-color: #fff;
        color: #333;
      }
      .gender input[type="radio"]:checked + label {
        background-color: #0155b7;
        color: #fff;
      }
      #warn:hover {
        font-weight: 700;
      }
      .title {
        font-size: 24px;
        font-weight: 900;
        margin-top: 40px;
      }
      .centerForm {
        display: flex;
        justify-content: center;
        margin: 10px 0;
      }
      a:link {
        color: black;
        text-decoration: none;
      }
      a:hover {
        color: black;
        font-weight: 700;
      }
      a:visited {
        color: black;
      }
      hr {
        border-top: 2px solid rgb(221, 224, 224);
        margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
      }
    </style>
  </head>

  <body>
  <jsp:include page="../main/header.jsp"></jsp:include>
=======
  <jsp:include page='<c:url value="/main/header.jsp"/>'></jsp:include>
>>>>>>> branch 'master' of https://github.com/HONGHAJOON/moongstar.git
    <div class="container">
      <!-- 개인정보 입력 폼 -->
      <h2>SIGN UP</h2>
      <div class="title">
        개인정보 입력
        <span style="font-size: 14px; color: red">(필수)</span>
      </div>
      <hr />
      <div class="signup-container">
        <!-- 아이디 -->
        <div class="field">
          <div class="inner-title">아이디</div>
          <div class="inner-input">
            <input type="text" name="id" placeholder="아이디 입력(4~25자)" />
            <input type="button" onclick="" value="중복검사" />
          </div>
        </div>

        <!-- 비밀번호 -->
        <div class="field">
          <div class="inner-title">비밀번호</div>
          <div class="inner-input2">
            <div style="width: 230px">
              <input id="pwd" type="password" name="pwd" />
            </div>
            <div id="warn" style="font-size: 12px; margin-left: 10px">
              * 비밀번호 8~20자 영문 소문자, 특수기호만 사용
            </div>
          </div>
        </div>
        <!-- 비밀버호 확인 -->
        <div class="field">
          <div class="inner-title">비밀번호 확인</div>
          <div style="width: 230px">
            <input id="pwdcheck" type="password" type="text" name="pwdCheck" />
          </div>
        </div>

        <!-- 닉네임 -->
        <div class="field">
          <div class="inner-title">닉네임</div>
          <div class="inner-input">
            <input type="text" name="nickname"  placeholder="2~11자 입력"/>
            <input type="button" onclick="" value="중복 검사" />
          </div>
        </div>

        <!-- 이메일 -->
        <div class="field">
          <div class="inner-title">이메일</div>
          <div class="inner-input2" style="flex: 1">
            <div class="inner-input">
              <input type="text" name="emailID" />
              <span>&nbsp; @ </span>
              <input class="box" id="domain-txt" type="text" />
              <select class="box" id="domain-list">
                <option value="type">직접 입력</option>
                <option value="naver.com">naver.com</option>
                <option value="google.com">google.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="nate.com">nate.com</option>
                <option value="kakao.com">kakao.com</option>
              </select>

              <input type="button" onclick="" value="인증번호 받기" />
            </div>
            <div class="inner-input">
              <div style="display: flex">
                <input
                  class="diy-width"
                  type="email"
                  placeholder="인증번호를 입력하세요"
                />
                <input type="button" onclick="" value="확인" />
              </div>
            </div>
          </div>
        </div>
        <script>
          // 도메인 직접 입력 or domain option 선택
          const domainListEl = document.querySelector("#domain-list");
          const domainInputEl = document.querySelector("#domain-txt");
          // select 옵션 변경 시
          domainListEl.addEventListener("change", (event) => {
            // option에 있는 도메인 선택 시
            if (event.target.value !== "type") {
              // 선택한 도메인을 input에 입력하고 disabled
              domainInputEl.value = event.target.value;
              domainInputEl.disabled = true;
            } else {
              // 직접 입력 시
              // input 내용 초기화 & 입력 가능하도록 변경
              domainInputEl.value = "";
              domainInputEl.disabled = false;
            }
          });
        </script>

        <!-- 휴대전화 -->
        <div class="field tel-number">
          <div class="inner-title">휴대전화</div>
          <div class="inner-input" style="flex: 1">
            <input type="tel" />
            <input type="tel" />
            <input type="tel" />
          </div>
        </div>
        <!-- 주소 -->
        <div class="field">
          <div class="inner-title">주소</div>
          <div class="inner-input2">
            <div class="inner-input">
              <input
                type="text"
                id="postcode"
                placeholder="우편번호"
                readonly
              />
              <input
                type="button"
                onclick="findAddr()"
                value="주소 검색"
                id="addressSearch"
              />
            </div>
            <div class="inner-input">
              <input type="text" id="mainAddress" placeholder="주소" readonly />
              <input type="text" id="detailAddress" placeholder="상세주소" />
            </div>
          </div>
        </div>
      </div>
      <hr
        style="
          border-top: 1px solid rgb(214, 214, 214);
          margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
        "
      />

      <!-- 프로필 추가 -->

      <div class="title">
        추가 정보입력
        <span style="font-size: 14px">(선택)</span>
      </div>
      <hr />
      <div class="signup-container">
        <div class="field">
          <div class="inner-title">반려동물 이름</div>
          <div class="inner-input">
            <input type="text" name="petName" />
          </div>
        </div>

        <!-- 반려동물 성별 -->
        <div class="field">
          <div class="inner-title">반려동물 성별</div>
          <div class="gender">
            <input type="radio" id="male" name="petGender" value="남" />
            <label for="male">남</label>
            <input type="radio" id="female" name="petGender" value="여" />
            <label for="female">여</label>
          </div>
        </div>

        <!-- 프로필 사진 -->
        <div class="field">
          <div class="inner-title">프로필 사진</div>
          <div class="inner-input2">
            <img
              id="preview-image"
              src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
              alt="프로필 미리보기"
              style="width: 100px; height: 100px; margin-left: 10px"
            />
            <input
              type="file"
              id="file-input"
              style="display: none"
              accept="image/jpg,image/png,image/jpeg"
            />

            <div
              class="inner-input"
              style="margin-left: 5px; margin-top: 10px; gap: 10px"
            >
              <button id="upload-btn">이미지 업로드</button>
              <button id="delete-btn">이미지 삭제</button>
            </div>
          </div>
        </div>
      </div>
      <hr
        style="
          border-top: 1px solid rgb(214, 214, 214);
          margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
        "
      />
      <div class="centerForm">
        <span>
          <a href="#" style="font-size: 12px">개인정보 수집/이용동의</a>
        </span>
        &nbsp;
        <span id="informationConsent">
          <a href="#" style="font-size: 12px"> 개인정보 처리방침</a>

          <!-- 세부내용 중략 -->
        </span>
        <br />
      </div>
      <div class="centerForm">
        <span class="agree-check" style="display: flex; font-size: 12px">
          이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 모두 동의합니다.
          <input type="checkbox" style="width: 30px" />
        </span>
      </div>
      <!-- 6. 가입하기 버튼 -->
      <input
        type="submit"
        value="가입하기"
        style="
          border-radius: 3px;
          padding: 7px 15px;
          font-weight: bold;
          font-size: 20px;
          letter-spacing: 10px;
        "
      />
    </div>
  </body>
</html>
    