<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 임시보호소 게시글</title>
<style>
	body,
    html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
        }
	.text {
		margin: 50px auto;
		width: 1280px;
    	padding-left: 20px; padding-right: 20px;
        font-size: 34px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 auto;
		width: 1280px;
      	background-color: #f5f5f5;
		height: 620px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
      }
      .content_box{
      	background-color: white;
      	margin: 0 auto;
      	width: 92%; height: 85%;
      	border-radius: 20px;
      	overflow: auto;
      }
      .content_box::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
      }
      .content_box::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
      }
      .content_box::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
      }
      .content_box2{
      	width: 90%; height: 400px;
      	margin: 40px auto 40px;
/*       	background-color: gray;
 */      }
      .write_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 70%; height: 400px;
      }
      .dogname_box{
      	color: black;
      	font-size: 30px;
      	font-weight: bold;
      }
      .contents{
      	font-size: 20px; color: #7E7E7E;
      	border-bottom: 1px solid #7E7E7E;
      	margin-bottom:10px; margin-top: 10px;
      	padding-bottom: 3px;
      }
      .img_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 25%; height: 315px;
 		padding: 10px;
      	float: right;
      	border: 1px solid #7E7E7E;
      	border-radius: 10px;
      }
      .dog_Img{
      	width: 100%; height: 265px;
      	border-radius: 10px;
      }
      .state{
      	color: green;
      	margin-top: 10px;
      	font-size: 30px;
		text-align: center;
      }
      .btn_container{
      	margin-top: 30px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      } 
      .Btn{
      	margin:10px;
		background-color: #FED74B;
  		border: none;
		box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
  		border-radius: 20px;
		padding: 7px 22px 7px 22px;
		font-size: 15px;
		font-weight: bold;
      }
</style>

</head>
<body>
<%@ include file="../main/header.jsp" %>
<div class="text">임시보호소</div>

<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				<div class="dogname_box">${temp.tempName}</div>
				<div><img src="<%=request.getContextPath()%>/image/place.png" style="">${temp.tempAddress}</div>
				<div id="char_box">
				<div class="contents">특징</div>
				</div>
				<div class="contents">임시보호기간</div>
				<div>${temp.tempWriteDate} ~ ${temp.protectDate}</div>
				<div class="contents">기타사항</div>
				<div>${temp.tempEtc}</div>
			</div>
			<div class="img_box">
				<img class="dog_Img" src="../imageView?num=${temp.tempPhoto}">
				
				<c:choose>
				<c:when test="${temp.tempCgory eq 'fingding'}">
				<div class="state">주인이 필요해요</div>
				</c:when>
				<c:otherwise>
				<div class="state">주인이 생겼어요</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<div class="btn_container">
	<a href="tempBoard" class="boardBtn Btn">목 록</a>
	<a href="tempModify?tempNum=${temp.tempNum}" class="boardBtn Btn">수 정</a>
	<a href="tempDelete?tempNum=${temp.tempNum}" class="boardBtn Btn" id="deleteBtn">삭 제</a>
</div>

<%@ include file="../temp/boardComment.jsp" %>

</body>

<script>
const charBox = document.getElementById('char_box');

var charString='${temp.tempChar}';
console.log(charString);
var chars=charString.split('@');
console.log(chars[0]);


for (var i = 0; i < chars.length-1; i++) {
	const newItem = document.createElement('div'); // 새로운 div 요소 생성
	newItem.textContent = '▶ '+ chars[i]; // 버튼 텍스트 설정
	charBox.appendChild(newItem); // 부모 요소에 새로운 항목 추가
}

/* chars.forEach(function(char){
	const newItem = document.createElement('div'); // 새로운 div 요소 생성
	newItem.textContent = '▶ '+ char; // 버튼 텍스트 설정
	charBox.appendChild(newItem); // 부모 요소에 새로운 항목 추가
}) */

</script>
</html>