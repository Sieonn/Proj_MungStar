<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="icon" href="./images/logo.png" />
  </head>
  <style>
    /* Google web font CDN*/
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap");
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
      height: auto;
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
    a:link {
      color: black;
      text-decoration: none;
    }
    a:hover {
      color: black;
      font-weight: 700;
    }

    /*member sign in*/
    .member {
      width: calc(
        100% - (20% * 2)
      ); /* 콘텐츠 영역의 너비에서 양쪽 여백을 뺀 크기로 설정 */
      margin: 0 20%; /* 양쪽 여백을 16.6%로 설정 */
      margin-bottom: 20px;
      margin-top: 20px;
    }

    .member .logo {
      /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
      display: block;
      margin: 50px auto;
    }

    /* 중복되는 스타일은 .field 내부에서만 사용 */
    .member .field {
      margin: 5px 0; /*상하로 좀 띄워주기*/
      display: flex;
    }

    .member b {
      /* border: 1px solid #000; */
      display: block; /*수직 정렬하기 */
      margin-bottom: 5px;
    }

    .member input:not(input[type="radio"]),
    .member select {
      border: 1px solid #dadada;
      padding: 10px;
      width: 100%;
      margin-bottom: 5px;
    }

    .member input[type="button"],
    .member input[type="submit"] {
      background-color: #0155b7;
      color: #fff;
      margin-right: 10px;
    }

    .member input:focus,
    .member select:focus {
      border: 1px solid #0155b7 !important;
    }

    .field.birth div {
      /*field 이면서 birth*/
      display: flex;
      gap: 10px; /*간격 벌려줄때 공식처럼 사용핟나 */
    }

    .field.tel-number div {
      display: flex;
    }

    .field.tel-number div input:nth-child(1) {
      flex: 2;
    }
    input:focus {
      outline: none;
    }

    .field.tel-number div input:nth-child(2) {
      flex: 1;
    }

    .field.gender div {
      border: 1px solid #dadada;
      padding: 15px 5px;
      background-color: #fff;
    }

    .field {
      display: flex;
      align-items: baseline; /* 입력 상자와 텍스트를 같은 기준선에 정렬 */
    }

    .field input[type="text"],
    .field input[type="password"],
    .field input[type="number"],
    .field select,
    .field input[type="email"],
    .field input[type="tel"] {
      flex: 1; /* 자동으로 너비를 할당 */
      margin-left: 10px; /* 오른쪽 여백 */
    }

    .field button {
      background-color: #0155b7;
      color: white;
      /* 상하 10px, 좌우 20px */
      border: none;
      margin-left: 10px;
    }
    .member .field input[type="button"] {
      margin-left: 10px;
      width: auto; /* 버튼 너비를 내용에 맞게 자동 조정 */
      /* 버튼 내용에 따라 적절한 패딩 적용 */
    }

    .placehold-text {
      display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
      position: relative;
      /* border: 1px solid #000; */
    }

    .placehold-text:before {
      position: absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
      right: 20px;
      top: 13px;
      pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
    }

    .userpw {
      background: url(./images/images2/icon-01.png) no-repeat center right 15px;
      background-size: 20px;
      background-color: #fff;
    }

    .userpw-confirm {
      background: url(./images/images2/icon-02.png) no-repeat center right 15px;
      background-size: 20px;
      background-color: #fff;
    }

    .member-footer {
      text-align: center;
      font-size: 12px;
      margin-top: 20px;
    }

    .member-footer div a:hover {
      text-decoration: underline;
      color: #0155b7;
    }

    .member-footer div a:after {
      content: "|";
      font-size: 10px;
      color: #bbb;
      margin-right: 5px;
      margin-left: 7px;
      /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
      display: inline-block;
      transform: translateY(-1px);
    }

    .member-footer div a:last-child:after {
      display: none;
    }

    @media (max-width: 768px) {
      .member {
        width: 100%;
      }
    }
    .title {
      text-align: center;
      font-family: "JalnanGothic";
      font-size: 34px;
    }
    .member > h2 {
      font-family: "JalnanGothic";
      font-size: 24px;
      color: #0155b7;
      margin-bottom: 40px;
      font-size: 48px;
      font-weight: 900;
      text-align: center;
    }
    .signup {
      margin: 7% 13%;
      height: auto;
    }
    .little_title {
      font-size: 14px;
      font-weight: 700;
      width: 120px;
    }
    .row-field {
      display: flex;
    }
    .userInput {
      font-size: 14px;
      text-align: center;
      margin: 20px 0;
    }
    a:visited {
      color: black;
    }
    .agree {
      display: flex;
      justify-content: center;
    }
    .email-a {
      margin-left: 10px;
    }
    .inputw {
      width: 500px;
    }
    .email-com {
      display: flex;
    }
    .select {
      padding: 5px;
      outline: none;
    }
  </style>
  <script>
    function formCheck(form) {
      //유효성 검사
      if (form.name.value == "") {
        alert("이름을 입력하세요.");
        form.name.focus();
        return;
      }
      if (form.id.value == "") {
        alert("아이디를 입력하세요.");
        form.id.focus();
        return;
      }
      if (form.pwd.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pwd.focus();
        return;
      }
      if (form.pwd.value.length < 10 || form.pwd.value.length > 16) {
        alert("비밀번호는 10 ~ 16자 사이로 입력하세요.");
        form.pwd.focus();
        return;
      }
      if (form.pwdCheck.value == "") {
        alert("비밀번호 확인을 입력하세요.");
        form.pwdCheck.focus();
        return;
      }
      if (form.mailid.value == "") {
        alert("e-mail을 입력하세요.");
        form.mailid.focus();
        return;
      }
      if (form.mailid.value == "") {
        alert("e-mail을 입력하세요.");
        form.mailid.focus();
        return;
      }
      if (form.email.value == "" && form.mailslc.selectedIndex == 0) {
        alert("e-mail을 입력하세요.");
        form.mailslc.focus();
        return;
      }
      alert("회원가입이 완료되었습니다.");

      form.reset();
    }
  </script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== "") {
              extraAddr = " (" + extraAddr + ")";
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("sample6_extraAddress").value = extraAddr;
          } else {
            document.getElementById("sample6_extraAddress").value = "";
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("sample6_postcode").value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
        },
      }).open();
    }
  </script>
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
    <form method="post" action="">
      <div class="member">
        <!-- 1. 로고 -->
        <h2>SIGN UP</h2>

        <!-- 2. 필드 -->
        <div class="signup">
          <span class="field">
            <span class="little_title">아이디</span>
            <div class="row-field">
              <input type="text" name="id" placeholder="아이디 입력(6~20자)" />
              <input type="button" onclick="" value="중복 검사" />
            </div>
          </span>
          <div class="field">
            <span class="little_title">비밀번호</span>
            <div>
              <input class="inputw" type="password" placeholder="" name="pwd" />
            </div>
          </div>
          <div class="field">
            <span class="little_title">비밀번호 재확인</span>
            <div>
              <input class="inputw" name="pwdCheck" type="password" />
            </div>
          </div>
          <div class="field">
            <span class="little_title">이름</span>
            <div><input type="text" name="name" /></div>
          </div>

          <!-- 5. 이메일_전화번호 -->
          <div class="email-field">
            <div class="field">
              <span class="little_title">이메일</span>
              <input type="text" name="mailid" style="width: 50px" />
              <span class="email-a"> @</span>
              <input
                type="text"
                name="email"
                style="width: 50px"
                id="domain-txt"
              />

              <select name="mailslc" class="select" id="domain-list">
                <option value="self" selected>직접입력</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="daum.com">daum.com</option>
              </select>

              <input type="button" onclick="" value="인증번호 받기" />
            </div>

            <div class="field" style="margin-left: 120px">
              <div class="row-field">
                <input
                  class="inputw"
                  type="email"
                  placeholder="인증번호를 입력하세요"
                />
                <input type="button" onclick="" value="인증하기" />
              </div>
            </div>
          </div>
          <div class="field tel-number">
            <span class="little_title">휴대전화</span>

            <input type="tel" />
            <input type="tel" />
            <input type="tel" />
          </div>
          <div class="address">
            <div class="field">
              <span class="little_title">주소</span>
              <div class="row-field">
                <input
                  type="text"
                  id="sample6_postcode"
                  placeholder="우편번호"
                />
                <input
                  type="button"
                  onclick="sample6_execDaumPostcode()"
                  value="우편번호 찾기"
                />
              </div>
            </div>
            <div class="field">
              <span class="little_title"></span>
              <input
                type="text"
                id="sample6_address"
                placeholder="주소"
              /><br />
              <input
                type="text"
                id="sample6_detailAddress"
                placeholder="상세주소"
              />
            </div>
          </div>
          <!-- 개인정보 수집 동의 -->
          <div class="userInput">
            <span class="list">
              <a href="#">개인정보 수집/이용동의</a>
            </span>
            &nbsp;
            <span id="informationConsent">
              <a href="#"> 개인정보 처리방침</a>

              <!-- 세부내용 중략 -->
            </span>
            <br />
            <div class="agree">
              <span class="agree-check" style="display: flex">
                이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 모두
                동의합니다.
                <input type="checkbox" style="width: 30px" />
              </span>
            </div>
          </div>
          <!-- 6. 가입하기 버튼 -->
          <input type="submit" value="가입하기" />
        </div>

        <!-- 7. 푸터 -->
        <div class="member-footer"></div>
      </div>
    </form>
    <script>
      // 도메인 직접 입력 or domain option 선택
      const domainListEl = document.querySelector("#domain-list");
      const domainInputEl = document.querySelector("#domain-txt");
      // select 옵션 변경 시
      domainListEl.addEventListener("change", (event) => {
        // option에 있는 도메인 선택 시
        if (event.target.value !== "self") {
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
  </body>
</html>

