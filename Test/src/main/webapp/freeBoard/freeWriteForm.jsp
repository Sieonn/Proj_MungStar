<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <script>
 //이거는 하이퍼링크 스크립트에옹
    function addLink() {
      var url = prompt("Enter the URL:");
      document.execCommand('createLink', false, url);
    }
 //이거는 글씨 색 바꾸는 스크립트
 	function changeTextColor() {
     var color = document.getElementById("colorPicker").value;
     document.execCommand('foreColor', false, color);
   }
 //이거는 배경 색 바꾸는 스크립트
 	function changeBackgroundColor(color) {
 	      document.execCommand('hiliteColor', false, color);
 	    }
  </script>
<head>
<meta charset="UTF-8">
<style type="text/css">	
	body,html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
	.pageContainer {
		width: 100%;
	}
 	#freeCategory{
 		width :1000px;
 		margin : 0 16.6%;	
  	}
  	.writeContainer {
  		width :1000px;
 		margin : 0 auto;
 		
  	}
  	.writeTitle{
  		background-color: #f5f5f5;
  		width: 1000px;
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
        width: 1000px; 
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
    	text-align: center;
		font-weight: bold;
		margin: 0 auto;
		background-color: #FED74B;
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
	}
    .footer {
  		height: 200px;
  	}
</style>
<style>
  /* 스크롤 가능한 상자 스타일 */
    .scroll-box {
        background-color: #f5f5f5;
        width: 900px; 
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
</head>
<body>
<jsp:include page="/header.jsp"/>
<br>

<div class = "freeContainer">
	<div id = "freeCategory">
		<h2 style="margin-bottom: 5px;">자유게시판</h2>
		<h4 style = "font-weight: lighter; margin-top: 0;">게시물작성</h4>
	</div>
<div class="writeContainer">
    <input class="writeTitle" type="text" placeholder="  제목  " />
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
            <img src="<%=request.getContextPath()%>/image/dog1.jpg" style="width: 100%; height: auto; margin-bottom: 10px;">
            <textarea class="text-area" style="overflow: hidden;"></textarea>
        </div>
        <input type="text" class="tag-input" placeholder="#태그를 입력하세요 (쉼표로 구분)">
    </div>
</div>
	<br>
	<div class="yellowBtn" id="saveButton">저 장</div>

</div>
<script>
  // 저장 버튼에 대한 클릭 이벤트 핸들러
  document.getElementById('saveButton').addEventListener('click', function() {
    // 작성된 글을 어딘가에 저장하는 코드를 여기에 추가합니다.
    
    // 저장이 완료되면 목록 페이지로 이동합니다.
    window.location.href = 'http://localhost:8080/Test/freeBoard/freeBoard.jsp';
  });
</script>
<div class="footer"></div>	
</body>
</html>