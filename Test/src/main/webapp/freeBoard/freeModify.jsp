<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		margin: 0 auto; 
 	}
 	#freeCategory{
 		width :1000px;
 		margin : 0 auto;	
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
.imgBtn2 {
	cursor: pointer;
	margin-left: 8px;
	margin-right: 8px;
	width: 15px;
	height: 15px;
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

<%@ include file="../main/header.jsp" %>
<br>
<div class = "pageContainer">
	<form action="${path}/freeBoard/freemodify" method="post" enctype="multipart/form-data">
	<div class="freeContainer">
		<div id="freeCategory">
			<h2 style="margin-bottom: 5px;">자유게시판</h2>
			<br><br>
		</div>
	</div>
	<div class="writeContainer">

	
	<input type="hidden" value="${board.freeNum}" name="freeNum"/>
	<input class="writeTitle" type="text" id="title" placeholder="${board.freeSub}" value="${board.freeSub }" name="freeSub" />    
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
    		<img src="../image/b.png" class="imgBtn2 " onclick="document.execCommand('bold', false, null);">
    		<img src="../image/italic.png" class="imgBtn2 " onclick="document.execCommand('italic', false, null);">
    		<img src="../image/underline.png" class="imgBtn2 " onclick="document.execCommand('underline', false, '');">
    		<img src="../image/line.png" class="imgBtn2 " onclick="document.execCommand('strikeThrough', false, '');">
    		<img src="../image/quote.png" class = "imgBtn" onclick="quoteText()">
    		<div class="imgBtn"></div>
    		<img src="../image/image.png" class = "imgBtn" onclick="document.getElementById('fileInput').click()">
    		<input type="file" id="fileInput" style="display: none;" accept="image/*" onchange="handleFiles(event)">
   
    		<img src="../image/link-icon.png" class="imgBtn" style="width:auto;hight:50%;" onclick="addLink()">
    		<div class="imgBtn"></div>
    		<img src="../image/왼쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyLeft', false, '');">
    		<img src="../image/가운데정렬.png" class = "imgBtn" onclick="document.execCommand('justifyCenter', false, '');">
    		<img src="../image/오른쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyRight', false, '');">
  			<div class="imgBtn"></div>
  			<div class="colorPicker" style="display: flex; flex-direction: column;">
        		<div id="colorPicker" style="margin-bottom: -3px;">A</div>
        		<input type="color" id="colorPicker" onchange="changeTextColor(event)">
    			</div>
    		<div class = "colorPicker" style="display: flex; flex-direction: column; margin-top: 4px;">
    			<div class = "bgcolorPicker" style=" ">A</div>
    				<input type="color" id="bgColorPicker" onchange="changeBackgroundColor(event)">
    		</div>
        </div>        
        <div class="scroll-box">
        	<c:if test="${board.freePhoto ne null}">
				<img src="image?num=${board.freePhoto}" width="100px"/>
			</c:if>
			<div id="imagePreview"></div>
            	<div class = "context"></div>
            <input type="hidden" name="freeContent" id="freeContent"/>
			<div id="editor" class="text-area" contenteditable="true" style="overflow: hidden; width: 100%;">${board.freeContent}</div>
        </div>
			<input type="text" class="tag-input" placeholder="${board.freeTag}" value="${board.freeTag }" id="tag" name="freeTag">
    </div>

</div>
<br>
<div class = "BtnArray">
	<button class = "yellowBtn" id="listBtn">목록</button>
	<button type="submit" class = "yellowBtn">저장</button>
	<button class = "yellowBtn" id="deleteBtn">삭제</button>
</div>
	</form>
<%@ include file="boardComment.jsp" %>
<div class="footer"></div>
<script  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$('form').submit(function(e) {
		$('#freeContent').val($("#editor").html())
		
	})
	$("#listBtn").click(function(e) {
		e.preventDefault();
		
	})
	$("#deleteBtn").click(function(e) {
		e.preventDefault();
		confirmDelete();
	})	
</script>
</div>
<script>
// 스크롤 상자의 스크롤 이벤트를 처리하는 함수
/* document.querySelector('.scroll-box').addEventListener('scroll', function(event) {
    // 스크롤 상자의 스크롤 위치를 가져옵니다.
    var scrollTop = event.target.scrollTop;
    console.log("스크롤 위치:", scrollTop);
    // 여기서 원하는 추가 동작을 수행할 수 있습니다.
}); */
</script>
<script type="text/javascript">

//인용구 추가 함수
function quoteText() {
    var selection = window.getSelection();
    var range = selection.getRangeAt(0);
    var selectedText = range.toString();
    
    // 인용구로 감싸기
    var quoteElement = document.createElement('blockquote');
    quoteElement.textContent = selectedText;

    // 선택 영역 교체
    range.deleteContents();
    range.insertNode(quoteElement);
}
//이거는 하이퍼링크 스크립트에옹
function addLink() {
  var url = prompt("Enter the URL:");
  document.execCommand('createLink', false, url);
}
// 글자 색상 변경 함수
function changeTextColor(event) {
    var color = event.target.value;
    document.execCommand('foreColor', false, color);
}
function changeBackgroundColor(event) {
    var color = event.target.value;
    document.execCommand('hiliteColor', false, color);
}
// 파일 업로드 함수
function handleFiles(event) {
    var file = event.target.files[0];
    var content = document.getElementById('imagePreview'); // 이미지가 추가될 위치를 변경

    if (file) {
        var reader = new FileReader();
        reader.onload = function(event) {
            var imgElement = document.createElement('img');
            imgElement.src = event.target.result;
            imgElement.style.width = '100%';
            content.appendChild(imgElement); // 이미지 추가
        };
        reader.readAsDataURL(file);
    }
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


</script>
</body>
</html>
