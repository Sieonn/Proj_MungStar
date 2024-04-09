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
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>멍뭉별 | 아이디 찾기</title>
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
	margin-left: 10px;
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
<script>
$(function() {
	$("form").submit(function(e) {
		e.preventDefault();
		var memId = $("#memId").val();
		var memEmail = $("#memEmail").val();

		// AJAX를 통해 서버로 닉네임과 전화번호 값을 전달하여 아이디를 찾음
		$.ajax({
			url : '${path}/findpw', // 아이디 찾기 처리를 하는 서블릿 주소
			type : 'post',
			async : true,
			data : {
				memId : memId,
				memEmail : memEmail
			},
			success : function(result) {
				if (result == "") {
					// DB에서 일치하는 아이디를 찾지 못한 경우
					$("#check").text("일치하는 항목이 없습니다.");
					$("#check").css("color", "red");
					$("#result").css("color", "black"); // result의 텍스트 색상을 기본 값으로 변경
				} else {
					// DB에서 일치하는 아이디를 찾은 경우
					$("#check").text("아이디는 " + result + "입니다.");
					$("#check").css("color", "green");
					// result의 텍스트 색상을 초록색으로 변경
				}
			},
			error : function() {
				alert("아이디를 찾는 중에 오류가 발생했습니다.");
			}
		});
	});
});

	$(function() {
		   $("#checkedemail").click(function(e) {
		      e.preventDefault();
			    var email = $('input[name=memEmail]').val();
		      $.ajax({
		         url:'joinauth',
		         type:'post',
		         async:true,
		         data:{memEmail:email},
		         success:function(result) {
		            alert(result);
		         }
		      }) 
		   });
		   //메일체크
		   $("#checkauth").click(function(e) {
		      e.preventDefault();
		      var authcode = $("#authcode").val();
		      $.ajax({
		         url:'checkauth',
		         type:'post',
		         data:{authcode:authcode},
		         success:function(result) {
		            if (result == 'true'){
		            	$('#authcode').val('인증번호가 일치합니다.');
		            	  $('#authcode').prop('readonly', true);
		            	  $('#authcode').css({
		            		    'color': 'green', // 폰트 색상 변경
		            		    'font-size': '12px', // 폰트 크기 변경
		            		    'background-color': 'light-dark'
		            		});
		            } else {
		            	$('#authcode').val('인증번호가 일치하지 않습니다.');
		            	 $('#authcode').css({
		            		    'color': 'red', // 폰트 색상 변경
		            		    'font-size': '12px', // 폰트 크기 변경
		            		});
		            }
		         }
		      })
		   })
		});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="card" style="width: 25rem;">
			<div class="card-title">
				<h2 class="card-title" style="color: #0155b7"></h2>
			</div>
			<div class="card-body">
				<form action="findpw" class="form-signin" method="POST">
					<p class="text2"
						style="font-family: 'JalnanGothic'; font-size: 24px">비밀번호 찾기</p>

					<div class="findP">
						<label class="lname">아이디</label> <input type="text" id="memId"
							name="memId" class="form-control" placeholder="아이디를 입력해주세요."
							required autofocus />
					</div>
					<br />
					<div class="findP">
						<label class="lname">이메일</label> 
						<input type="text" id="memEmail"
							name="memEmail" class="form-control" placeholder="이메일을 입력해주세요."
							required /> <input type="button" value="인증번호 받기"
							id="checkedemail" name="checkedemail" />
					</div>
					<div class="findP">
					<div style="display: flex; margin: 10px 0 10px 70px;" >
									<input class="form-control" id="authcode" type="email"
										placeholder="인증번호를 입력하세요"  style="width:157px;"/> <input type="button" value="확인"
										id="checkauth" name="checkauth" />
								</div>
					</div>
					<br />
					<div class="check" id="check"></div>
					<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
						type="submit" style="font-weight: 900">비 밀 번 호 재 설 정</button>

				</form>
			</div>
			<div class="links">
				<a href="${path}/findid">아이디 찾기</a> | <a href="${path}/login">로그인</a>
				| <a href="${path}/signup">회원가입</a>

			</div>
		</div>
	</div>
</body>
</html>

