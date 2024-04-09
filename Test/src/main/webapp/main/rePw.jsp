<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>멍뭉별 | 비밀번호 재설정</title>
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
	/* position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box; */
	font-size: 16px;
}

.form-control {
	flex: 1;	
	height: 40px;
}

.lname {
	width: 70px;
	margin-top: 10px;
}

.card-body {
	width: 400px;
	padding: 30px;
}

button, input {
	overflow: visible;
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

.findP {
	display: flex;
}

.check {
	margin-bottom: 10px;
	font-size: 18px;
	font-family: "JalnanGothic";
	text-align: center;
}

placeholder {
	font-size: 10px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="card" style="width: 25rem">
		<div class="card-title">
				<h2 class="card-title" style="color: #0155b7"></h2>
			</div>
			<div class="card-body">
				<form action="resetPw" class="form-signin" method="POST">
					<p class="text2"
						style="font-family: 'JalnanGothic'; font-size: 24px">비밀번호 재설정 - <%= request.getAttribute("memId") %>님</p>
					
					<input type="hidden" name="memId" value="<%= request.getAttribute("memId") %>" /> 
					<input
						type="password" name="memPw" id="memPw" class="form-control"
						placeholder="비밀번호" required /><br /> <input type="password"
						name="pw2" id="pw2" class="form-control" placeholder="비밀번호 재확인"
						required />
					<p class="check" id="check2"></p>
					<br />
					<button type="button" id="btn-Yes" onclick="regist()"
						class="btn btn-lg btn-primary btn-block">비밀번호 재설정</button>
				</form>
			</div>
			<div class="links">
				<a href="${path}/findid">아이디 찾기</a> | <a href="${path}/login">로그인</a> | <a
					href="${path}/signup">회원가입</a>
			</div>
		</div>

		<script>
			var check2 = "${findpw_checkt}";
			if (check2 !== "") {
				alert(check2);
			}

			// 비밀번호 정규식
			var pwJ = /^[a-z0-9]{6,20}$/;
			var memPw = false;
			var pwc2 = false;

			$("#pw").focusout(function() {
				if ($('#memPw').val() === "") {
					$('#check').text('비밀번호를 입력해주세요.');
					$('#check').css('color', 'red');
				} else if (!pwJ.test($(this).val())) {
					$('#check').text('6~20자의 영문 소문자, 숫자만 사용가능합니다');
					$('#check').css('color', 'red');
				} else {
					pwc2 = true;
					$('#check').hide();
				}
			});

			$("#pw2").focusout(function() {
				if ($('#pw2').val() === "") {
					$('#check').text('필수 정보입니다.')
					$('#check').css('color', 'red')
				} else
					$('#check').hide()
			});

			$("#pw2").keyup(function() {

				if ($(this).val() !== $("#pw").val()) {
					$("#check2").html("비밀번호가 다릅니다");
					$("#check2").css("color", 'red');
					pwc = false;

				} else {
					$("#check2").html("비밀번호가 일치합니다");
					$("#check2").css("color", 'blue');
					pwc = true;
				}
			});

			$("#pw").keyup(function() {

				if ($(this).val() !== $("#pw2").val()) {
					$("#check2").html("비밀번호가 다릅니다");
					$("#check2").css("color", 'red');
					pwc = false;

				} else {
					$("#check2").html("비밀번호가 일치합니다");
					$("#check2").css("color", 'blue');
					pwc = true;
				}
			});

			function regist() {
				if (pwc2 === false) {
					alert('비밀번호는 6~20자의 영문 소문자, 숫자만 사용가능합니다');
				} else if (pwc === false) {
					alert('비밀번호를 다시 확인해주세요');
				} else {
					$('form').submit();
				}
		<%session.invalidate();%>
			
			};
		</script>
	</div>
</body>
</html>
