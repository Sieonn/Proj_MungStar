<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
 <style type="text/css">
 	.freeContainer {
		width : 1280px;
 	}
 	#freeCategory{
 		width :1000px;
 		margin : 0 auto;
  	 }
  	.wrap{
  		background-color: #f5f5f5;
  		width: 990px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
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
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
  	}
  	.BtnArray {
  		 text-align: center;
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
<script>
// 스크롤 상자의 스크롤 이벤트를 처리하는 함수
document.querySelector('.scroll-box').addEventListener('scroll', function(event) {
    // 스크롤 상자의 스크롤 위치를 가져옵니다.
    var scrollTop = event.target.scrollTop;
    console.log("스크롤 위치:", scrollTop);
    // 여기서 원하는 추가 동작을 수행할 수 있습니다.
});
</script>
<div class = "freeContainer">
<jsp:include page="/header.jsp"/>
<br>
<div id = "freeCategory">
<h2>&nbsp;자유게시판</h2>
</div>
<div class="wrap">
	<div>
		<span class= "title" >&nbsp;&nbsp;&nbsp;제목이 들어가는 곳입니다.</span>
		<span class = "titleInfo">YYYY/MM/DD&nbsp;&nbsp;&nbsp;</span>
		<br>
		<span class = "titleInfo">댓글수 : n&nbsp;</span>
		<span class = "titleInfo">조회수 : nnnn&nbsp;</span>
		<div class = "writeNick">&nbsp;&nbsp;&nbsp;&nbsp;닉네임이들어가는곳</div>
	</div>
</div>
	<br>
<div class="wrap">
	<div class="ContentBackground scroll-box">
		<div class = "contextImg">
		<img src="image/dog1.jpg" alt="자유게시판 사진첨부 예시">
		</div>
		<p class = "context"> when you were here before<br> couldn't look you in the eye<br><br>you're just like an angel <br>your skin makes me cry <br>you float like a feather<br> in a beautiful world <br><br>I wish I was special<br> you so fucking special<br><br>But I'm a creep <br> I'm a weirdo<br>what the hell am I doing here?<br>I don't belong here</p>
		<div class = "context"> I don't care if it hurts<br>I wanna have control<br>I want a perfect body<br>I want a perfect soul<br>I want you to notice<br>When I'm not around<br><br>I wish I was special<br>So fuckin' special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br><br>She's running out the door (run)<br>She's running out<br>She run, run, run, run<br><br>Run<br><br>Whatever makes you happy<br>Whatever you want<br><br>You're so fuckin' special<br><br>I wish I was special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br>I don't belong here</div>
	</div>
</div>


<div class = "BtnArray">
	<button type = "submit" class = "yellowBtn">목록</button>
	<button type = "submit" class = "yellowBtn">수정</button>
	<button type = "submit" class = "yellowBtn">삭제</button>
</div>

<jsp:include page="/boardComment.jsp"/>
</div>
</body>
</html>