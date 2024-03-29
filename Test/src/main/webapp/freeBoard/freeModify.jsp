<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
//이전에 작성한 내용을 가져와서 textarea에 설정하는 함수
function restorePreviousContent() {
    // 이전에 작성한 내용을 가져오는 로직 (예: 저장된 내용을 가져옴)
    var previousContent = "이전에 작성한 내용을 가져옵니다.";

    // textarea 요소를 가져옴
    var textarea = document.getElementById("myTextarea");

    // textarea의 value 속성에 이전에 작성한 내용을 설정
    textarea.value = previousContent;
}

// 저장할 태그들을 보관할 배열
var tags = [];

// 태그 입력란의 값이 변경될 때마다 호출되는 함수
function handleTagInput() {
    var tagInput = document.getElementById("tagInput");
    // 입력된 값을 쉼표로 분리하여 배열에 저장
    tags = tagInput.value.split(",").map(function(tag) {
        return tag.trim(); // 공백 제거
    });
    console.log("현재 태그:", tags);
}

// 페이지 로드 시 호출되는 함수
window.onload = function() {
    // 이전에 작성한 내용을 textarea에 설정
    restorePreviousContent();

    // 태그 입력란에 이벤트 리스너 추가
    document.getElementById("tagInput").addEventListener("input", handleTagInput);
};

// 게시글을 저장하고 확인하는 페이지로 이동하는 함수
function saveAndNavigate() {
    // 이전에 작성한 내용을 가져오는 함수 호출
    restorePreviousContent();

    // 게시글을 저장하는 함수 호출
    savePost();

    // 저장된 게시글을 확인하는 페이지로 이동
    window.location.href = "http://localhost:8080/Test/freeBoard/freeDetail.jsp"; // 저장된 게시글 확인 페이지의 URL로 교체하세요.
}

// 게시글을 저장하는 함수 (예: 서버에 전송)
function savePost() {
    // 게시글 내용과 태그를 전송하는 로직을 추가할 수 있습니다.
    var postContent = document.getElementById("myTextarea").value;
    console.log("게시글 내용:", postContent);
    console.log("태그:", tags);
}

</script>
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

//그냥 일단 어느 페이지로 가는지 대충 보여주려고 넣는 함수~ 삭제예정~
function moklock() {
    window.location.href = "http://localhost:8080/Test/freeBoard/freeBoard.jsp"; 
    // 이전 페이지로
    // onclick="window.history.back()" 변경예정
}
function savePost() {
    // 저장~ saveAndNavigate()로 변경예정
	window.location.href = "http://localhost:8080/Test/freeBoard/freeDetail.jsp";
}

</script>

<style type="text/css">
      body,
      html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }

	.pageContainer {
		width: 100%;
	}
 	.freeContainer {
		width : 1280px;
		margin: 0 auto; 
 	}
  	.writeContainer {
  		width :1000px;
 		margin: 0 auto; /* 중앙 정렬을 위해 수정 */
 		
  	}
  	
  	 .writeTitle{
  		background-color: #f5f5f5;
  		width: 985px;
  		padding: 10px;
  		margin-bottom: 10px;
  		border-radius: 15px;
  		box-shadow: inset 1px 3px 3px rgba(0, 0, 0, 0.1);
  		border: 0; /* input에 border 없애기 */
  	}
  	
  	  	 /* 활성화된 input의 border 없애기 */
    input:focus {
        outline: none;
    }
  	.content {
        background-color: #f5f5f5;
        width: 985px; 
        height: 520px; 
        padding: 10px;
        margin: 10px auto;
        border-radius: 20px;
        box-shadow: inset 1px 3px 3px rgba(0, 0, 0, 0.1);
    }
  	 .text-area {
        width: 100%; /* textarea 요소의 가로 너비를 100%로 설정 */
        height: 400px; /* textarea 요소의 세로 높이를 100%로 설정 */
        resize: none; /* textarea 요소의 크기 조정을 비활성화 */
        border: 0; /* textarea 요소의 테두리 제거 */
        outline: none; /* textarea 요소의 포커스 표시 제거 */
        background-color: transparent; /* textarea 요소의 배경색을 투명으로 설정 */
        font-size: 14px; /* textarea 요소의 글꼴 크기 설정 */
        line-height: 1.5; /* textarea 요소의 줄 간격 설정 */
        padding: 10px;
        margin: 10px auto;
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
  		 text-align: center;
  	}
  	.footer {
  		height: 200px;
  	}
</style>
<script>
// 입력 칸의 너비를 동적으로 조절하는 함수
function adjustInputWidth() {
  var input = document.getElementById('tagInput');
  var inputText = input.value || ''; // 입력된 텍스트 또는 빈 문자열
  var textWidth = inputText.length * 8; // 텍스트 길이에 따른 너비 계산
  input.style.width = Math.max(100, textWidth) + 'px'; // 최소 너비를 100px로 설정
}

// 입력 칸의 텍스트가 변경될 때마다 너비 조절 함수 호출
document.getElementById('tagInput').addEventListener('input', adjustInputWidth);
</script>
<style>
.toolbar {
    background-color: #ffffff;
    width: 800px; 
    height: 20px;
    border-radius: 18px;
    padding: 10px;
    margin: 10px auto;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.toolbar-button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    padding: 5px 10px;
    border-radius: 3px;
    margin-right: 5px;
}

.bold-button {
	font-size: 17px;
    font-weight: bold;
    display:
}

.italic-button {
	font-size: 17px;
    font-style: italic;
}

.underline-button {
	font-size: 17px;
    text-decoration: underline;
}
.strike-button {
	font-size: 17px; 
    text-decoration: line-through;
}

.font-size-select {
	margin-left: 10px;
 	border-radius: 3px;
	border:0;
    padding: 5px;
    outline: none;
}
.imgBtn {
	margin-left: 8px;
	margin-right: 8px;
	width: 20px;
	height: 20px;
}
.colorPicker{
	text-align: center;
	font-weight: bold;
	font-size: 13px;
	margin-top: 2px;
	margin-left: 4px;
	margin-right: 4px;
}
.bgcolorPicker{
	color: white;
	background-color: black;
	width: 21px;
	border-radius: 5px;
	margin-left: 6px;
	margin-bottom: -3px;
}
#colorPicker {
	background-color:transparent;
	width: 28px;
	height: 15px;
    border: 0;
    border-radius: 3px;
    padding: 0px;
    
  }
#bgColorPicker {
	background-color:transparent;
	width:33px;
	height: 17px;
    border:0;
    border-radius: 3px;
  }

</style>
<style>
  /* 스크롤 가능한 상자 스타일 */
    .scroll-box {
        background-color: #f5f5f5;
        width: 880px; 
        height: 400px;
        overflow: auto;
        padding: 10px;
        margin: 10px auto;
        outline: none;
        border: 0;
        border-radius: 20px;
        overflow-x: hidden; /* 수평 스크롤 제거 */
    }
    .scroll-box::-webkit-scrollbar {
        width: 10px;
    }
    .scroll-box::-webkit-scrollbar-thumb {
    	background-color: #D9D9D9;
    	min-height: 10px; 
    	border-radius: 10px;
    	background-clip: padding-box;
  	}
  
  .scroll-box::-webkit-scrollbar-track {
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
<jsp:include page="/header.jsp"/>
<br>
<div class = "pageContainer">
<div class = "freeContainer">
		<h2>자유게시판</h2>
		<br>
	</div>
	<div class="writeContainer">
	<input class="writeTitle" type="text" placeholder=" 수정 이전 작성한 제목  " />    
	<br>
	<div class="content">
        <div class="toolbar">
        	<select class="toolbar-select font-size-select" onchange="document.execCommand('fontSize', false, this.value);">
        		<option value="1">Small</option>
        		<option value="2">Normal</option>
        		<option value="3">Large</option>
        		<option value="4">Very Large</option>
    		</select>
    		<div class="imgBtn"></div>
    		<button class="toolbar-button bold-button" onclick="document.execCommand('bold', false, '');">B</button>
    		<button class="toolbar-button italic-button" onclick="document.execCommand('italic', false, '');">I</button>
    		<button class="toolbar-button underline-button" onclick="document.execCommand('underline', false, '');">U</button>
    		<button class="toolbar-button strike-button" onclick="document.execCommand('strikeThrough', false, '');">S</button>
    		<img src="<%=request.getContextPath()%>/image/quote.png" class = "imgBtn" onclick="quoteText()">
    		<div class="imgBtn"></div>
    		<input type="file" id="fileInput" style="display: none;" accept="image/*" onchange="handleFiles(this.files)">
    		<img src="<%=request.getContextPath()%>/image/link-icon.png" class="imgBtn" style="width:auto;hight:50%;" onclick="addLink()">
    		<img src="<%=request.getContextPath()%>/image/image.png" class = "imgBtn" onclick="document.getElementById('fileInput').click()">
    		<div class="imgBtn"></div>
    		<img src="<%=request.getContextPath()%>/image/왼쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyLeft', false, '');">
    		<img src="<%=request.getContextPath()%>/image/가운데정렬.png" class = "imgBtn" onclick="document.execCommand('justifyCenter', false, '');">
    		<img src="<%=request.getContextPath()%>/image/오른쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyRight', false, '');">
  			<div class="imgBtn"></div>
  			<div class="colorPicker" style="display: flex; flex-direction: column;">
        		<div id="colorPicker" style="margin-bottom: -3px;">A</div>
        		<input type="color" id="colorPicker" onchange="changeTextColor()">
    			</div>
    		<div class = "colorPicker" style="display: flex; flex-direction: column; margin-top: 4px;">
    			<div class = "bgcolorPicker" style=" ">A</div>
    				<input type="color" id="bgColorPicker" onchange="changeBackgroundColor(this.value)">
    		</div>
        </div>
        <div class="scroll-box">
        	<div class = "contextImg">
           		<img src="<%=request.getContextPath()%>/image/dog1.jpg" alt="자유게시판 사진첨부 예시1">
            	<br><img src="<%=request.getContextPath()%>/image/dog2.jpg" alt="자유게시판 사진첨부 예시2">
			</div>
            	<p> when you were here before<br> couldn't look you in the eye<br><br>you're just like an angel <br>your skin makes me cry <br>you float like a feather<br> in a beautiful world <br><br>I wish I was special<br> you so fucking special<br><br>But I'm a creep <br> I'm a weirdo<br>what the hell am I doing here?<br>I don't belong here<br><br>I don't care if it hurts<br>I wanna have control<br>I want a perfect body<br>I want a perfect soul<br>I want you to notice<br>When I'm not around<br><br>I wish I was special<br>So fuckin' special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br><br>She's running out the door (run)<br>She's running out<br>She run, run, run, run<br><br>Run<br><br>Whatever makes you happy<br>Whatever you want<br><br>You're so fuckin' special<br><br>I wish I was special<br><br>But I'm a creep<br>I'm a weirdo<br>What the hell am I doin' here?<br>I don't belong here<br>I don't belong here </p>
				<br>
				<p > 후... (담배)<br>니들은 이런거 하지 마라... </p>
        </div>
				<input type="text" class="tag-input" placeholder="#태그를 입력하세요 (쉼표로 구분)">
    </div>
</div>
<br>
<div class = "BtnArray">
	<button type = "submit" class = "yellowBtn" onclick="moklock()">목록</button>
	<button type = "submit" class = "yellowBtn" onclick="savePost()">저장</button>
	<button type = "submit" class = "yellowBtn" onclick="confirmDelete()">삭제</button>
</div>


</div>
<jsp:include page="/freeBoard/boardComment.jsp"/>
<div class="footer"></div>
</body>
</html>
