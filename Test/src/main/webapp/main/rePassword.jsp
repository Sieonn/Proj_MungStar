<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous"/>
    <title>비밀번호 재설정</title>
    <style>
        /* 스타일은 여기에 작성합니다. */
    </style>
</head>
<body style="width:100%; height:100%; align:center">
<jsp:include page="../main/header.jsp"></jsp:include>
<div class="card align-middle" style="width: 25rem">
    <div class="card-body">
        <form action="resetPw" class="form-signin" method="POST">
            <p class="text2" style="font-family: 'JalnanGothic'; font-size: 24px">
                비밀번호 재설정
            </p>
            <input type="hidden" name="member_pw" value="아이디" />
            <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호" required /><br />
            <input type="password" name="pw2" id="pw2" class="form-control" placeholder="비밀번호 재확인" required />
            <p class="check" id="check2"></p>
            <br />
            <button type="button" id="btn-Yes" onclick="regist()" class="btn btn-lg btn-primary btn-block">
                비밀번호 재설정
            </button>
        </form>
    </div>
    <div class="links">
        <a href="memberId">아이디 찾기</a> | <a href="memberLogin">로그인</a> |
        <a href="memberRegist">회원가입</a>
    </div>
</div>

<script>
    var check2 = "${findpw_checkt}";
    if (check2 !== "") {
        alert(check2);
    }

    // 비밀번호 정규식
    var pwJ = /^[a-z0-9]{6,20}$/;
    var pwc = false;
    var pwc2 = false;

    $("#pw").focusout(function() {
        if ($('#pw').val() === "") {
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
        <% session.invalidate(); %>;
    };
</script>
</body>
</html>
