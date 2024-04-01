<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
// 삭제 여부를 묻는 팝업 창을 띄우는 함수
function confirmDelete() {
    // confirm 함수를 사용하여 삭제 여부를 묻는 팝업 창을 띄움
    var result = confirm("정말로 삭제하시겠습니까?");
    // 사용자가 확인을 눌렀을 경우
    if (result) {
        // 삭제 동작을 수행하는 함수를 호출합니다.
        deletePost();
    } else {
        // 사용자가 취소를 눌렀을 경우 아무 동작도 수행하지 않습니다.
        console.log("삭제 취소");
    }
}

// 게시글을 삭제하는 함수
function deletePost() {
    // 게시글 삭제 로직을 추가할 수 있습니다.
    console.log("게시글이 삭제되었습니다.");
}

//수정 페이지로 이동하는 함수
function goToEditPage() {
    window.location.href = "http://localhost:8080/Test/freeBoard/freeModify.jsp"; // 수정 페이지 URL로 변경
}
//그냥 일단 어느 페이지로 가는지 대충 보여주려고 넣는 함수~ 삭제예정~
function moklock() {
    window.location.href = "http://localhost:8080/Test/freeBoard/freeBoard.jsp"; 
    // 이전 페이지로
    // onclick="window.history.back()" 변경예정
}

function toggleLike(button) {
	  button.classList.toggle('active');
	}
</script>
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
<jsp:include page="../main/otherHeader.jsp"/>
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
		<span class= "title" >&nbsp;&nbsp;&nbsp;제목이 들어가는 곳입니다.</span>
		<span class = "titleInfo">YYYY/MM/DD&nbsp;&nbsp;&nbsp;</span>
		<br>
		<span class = "titleInfo">좋아요 : n&nbsp;</span>
		<span class = "titleInfo">조회수 : nnnn&nbsp;</span>
		<div class = "writeNick">&nbsp;&nbsp;&nbsp;&nbsp;닉네임이들어가는곳</div>
	</div>
</div>
	<br>
<div class="wrap">
	<div class="ContentBackground scroll-box">
		<div class = "contextImg">
		<img src="<%=request.getContextPath()%>/image/dog1.jpg" alt="자유게시판 사진첨부 예시1">
		<br>
		<img src="<%=request.getContextPath()%>/image/dog2.jpg" alt="자유게시판 사진첨부 예시2">
		</div>
		<p class = "context"> when you were here before<br> couldn't look you in the eye<br><br>you're just like an angel <br>your skin makes me cry <br>you float like a feather<br> in a beautiful world <br><br>I wish I was special<br> you so fucking special<br><br>But I'm a creep <br> I'm a weirdo<br>what the hell am I doing here?<br>I don't belong here<br><br>I don't care if it hurts<br>I wanna have control<br>I want a perfect body<br>I want a perfect soul<br>I want you to notice<br>When I'm not around<br><br>I wish I was special<br>So fuckin' special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br><br>She's running out the door (run)<br>She's running out<br>She run, run, run, run<br><br>Run<br><br>Whatever makes you happy<br>Whatever you want<br><br>You're so fuckin' special<br><br>I wish I was special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br>I don't belong here </p>
		<br>
		<p class = "context"> 후... (담배)<br>니들은 이런거 하지 마라... </p>
		<div class = "context"> </div>
	</div>
</div>

<br>
<div class = "BtnArray">
	<button type = "submit" class = "yellowBtn" onclick="moklock()">목록</button>
	<button type = "submit" class = "yellowBtn" onclick="goToEditPage()">수정</button>
	<button type = "submit" class = "yellowBtn" onclick="confirmDelete()">삭제</button>
	<button class="likeButton" onclick="toggleLike(this)"></button>
	<span id="likeCount">0</span>
</div>
<br>
</div>
<jsp:include page="/freeBoard/boardComment.jsp"></jsp:include>
<div class="footer"></div>
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
  
  // 클릭 수 출력
  console.log('클릭 수:', clickCount);
});
</script>
</body>
</html>