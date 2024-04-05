<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style type="text/css">
 	 body,html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
 	.pageContainer {
		width: 100%;
	}
 	.freeContainer {
		width : 1280px;
		margin : 0 auto;
 	}
 	#freeCategory {
 		width :1000px;
 		margin : 0 auto;	
  	}
  	.wrap{
  		background-color: #f5f5f5;
  		width: 990px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
  		box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);
  	 }
  	 
  	 .ContentBackground{
  		background-color: #ffffff;
  		width: 900px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
  	 }
  	 .title{
  	 	width: 800px; 
  	 	padding: 2px;
  		overflow: hidden; 
  		font-size : 15px;
  		font-weight: bold;
  	 }
  	 .titleInfo {
  	  	float : right;
  	  	font-size : 12px; 
  	  	position: relative;
    	bottom: 0;
    	color : gray;
  	 }
  	 .writeNick{
  		font-size : 12px;
  	}
  	.context{
  		font-size : 14px;
  	}
  	.contextImg{
  		float : right;
  		padding: 10px;
  	}
  	.yellowBtn {
  		background-color: #FED74B;
  		font-weight: bold;
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
  	}
  	.BtnArray {
  		display: flex;
    	justify-content: center;
    	align-items: center; /* 수직 정렬을 위해 추가 */
    	margin-left: 10px;
  	}
  	.BtnArray button {
    margin: 0 2px; /* 좌우 여백을 10px로 설정 */
}
  	
  	.likeButton {
  		width: 40px;
  		height: 40px;
  		background-image: url('../image/하트(회)수정.png');
  		background-size: cover;
  		background-color: transparent;
  		border: none; /* 기본적인 버튼 스타일 제거 */
  		cursor: pointer; /* 마우스를 올리면 커서 모양 변경 */
	}
	
	.likeButton.active {
  		background-image: url('../image/하트(핑).png'); /* 활성화된 상태의 이미지 */
	}
	
	#likeCount {
    display: inline-block; /* 인라인 요소로 변경하여 텍스트와 버튼이 한 줄에 정렬되도록 변경 */
    vertical-align: middle; /* 수직 정렬을 위해 추가 */
    margin-right: 10px; /* 좌우 여백 추가 */
}
	.tag-input {
    	align-item: center;
    	margin-left: 10px;
    	margin-bottom: 3px;
    	border: 0;
  		background-color: transparent;
  		border-radius: 5px;
  		transition: width 0.2s;
  		width: 200px; /* 초기 너비 설정 */
  		max-width: 880px;
	}
  	.footer {
  		height: 200px;
  	}
</style>
<style>
  /* 스크롤 가능한 상자 스타일 */
    .scroll-box{
        background-color: #ffffff;
        max-height : 500px;
        overflow: hidden; 
        overflow-y: overlay; /* 수직 스크롤만 표시 */
    }
    .scroll-box::-webkit-scrollbar {
        width: 10px;
        max-height: 400px;
    	
    }
    .scroll-box::-webkit-scrollbar-thumb {
    	background-color: #D9D9D9;
    	min-height: 10px; 
    	border-radius: 10px;
    	background-clip: padding-box;
    	
		
  }
  
  .scroll-box::-webkit-scrollbar-track{
		background-color: transparent;
    	border-radius: 10px;
}

</style>

</head>


<body>
<%@ include file="../main/header.jsp" %>
<br>
<div class = "pageContainer">
<div class="freeContainer">
	<div id="freeCategory">
		<h2 style="margin-bottom: 5px;">자유게시판</h2>
		<br><br>
	</div>
	</div>
<div class="wrap">
	<div>
		<span class= "title" >&nbsp;&nbsp;&nbsp;${board.freeSub }</span>
		<span class = "titleInfo">${board.freeWriteDate}&nbsp;&nbsp;&nbsp;</span>
		<br>
		<span class = "titleInfo">좋아요 : ${board.freeLike}&nbsp;</span>
		<span class = "titleInfo">조회수 : ${board.freeView}&nbsp;</span>
		<div class = "writeNick">&nbsp;&nbsp;&nbsp;&nbsp;${board.freeNick }</div>
	</div>
</div>
	<br>
<div class="wrap">
	<div class="ContentBackground scroll-box">
		<div class = "context">${board.freeContent}</div>
		<c:if test="${board.freePhoto ne null}">
			<img src="${path}/imageView?num=${board.freePhoto}" width="100%"/>
		</c:if>
	</div>
	<div class="tag-input" style="color: lightgray;">${board.freeTag}</div>
</div>

<br>
<div class = "BtnArray">
	<button class = "yellowBtn" id="listBtn">목록</button>
 	<button type = "submit" class = "yellowBtn" id="modifyBtn">수정</button>
 	<button class = "yellowBtn" type = "submit">삭제</button>
	<button class="likeButton" onclick="toggleLike(this)"></button>
	<span id="likeCount">0</span>
</div>
<br>
</div>
<jsp:include page="/freeBoard/boardComment.jsp"></jsp:include>
<div class="footer"></div>
<script  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$("#modifyBtn").click(function(e) {
		e.preventDefault();
		var freeNum = "${board.freeNum}"; // 게시물의 식별자
		window.location.href = "${path}/freeBoard/freemodify?freeNum=" + freeNum;
		
	})
	$("#listBtn").click(function(e) {
    	e.preventDefault();
    	window.location.href = "${path}/freeBoard/freeboard"; // 브라우저의 이전 페이지로 이동
	});
	$('form').submit(function(e) {
		 $('#freeHidden').val('true');
	})	
</script>
<script>
// 클릭 수를 저장할 변수
let clickCount = 0;

// 버튼 요소 가져오기
const likeButton = document.getElementById('likeButton');

// 클릭 이벤트 리스너 추가
likeButton.addEventListener('click', function() {
  // 버튼이 활성화되어 있는지 확인
  const isActive = likeButton.classList.contains('active');
  
  // 활성화되어 있으면 비활성화 상태로 변경하고 클릭 수 감소
  if (isActive) {
    likeButton.classList.remove('active');
    clickCount--;
  } else {
    // 비활성화 상태면 활성화 상태로 변경하고 클릭 수 증가
    likeButton.classList.add('active');
    clickCount++;
  }
  </script>
  <script type="text/javascript">
//수정 페이지로 이동하는 함수
function goToModifyPage(freeNum) {
        window.location.href = "freemodify?freeNum=" + freeNum;
    }


function toggleLike(button) {
	  button.classList.toggle('active');
	}
</script>
 <!-- 
  <script>
  // 클릭 수 출력
  console.log('클릭 수:', clickCount);
});

<script type="text/javascript">
$(function(){
	$('#likeCount').click(function(){
		$.ajax({
			url : 'boardlike',
			type : 'post',
			async : true,
			data :{like:JSON.stringify({memberID:"${board.freeNick}",boardNum:"${board.freeNum}"})},
			success : function(result) {
				if(result == 'true') {
					$('#likeCount').attr("src","../image/하트(회)수정.png")
				} else {
					$('#likeCount').attr("src","../image/하트(핑)수정.png")
				}
			}
		})
	})
})

</script>
 -->
</body>
</html>