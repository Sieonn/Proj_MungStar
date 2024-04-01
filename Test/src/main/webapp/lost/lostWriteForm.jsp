<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 임시보호소 게시글 작성</title>
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
        font-size: 34px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 auto 50px auto;
      	background-color: #f5f5f5;
      	width: 1280px; height: 620px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
      }
      .content_box{
      	background-color: white;
      	margin: 0 4% 0 4%;
		height: 85%; width: 92%;
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
      	border: none;
     	outline: none;
      }
      ::placeholder{
      	color: #BDBDBD;
      }
      .address{
      	width: 90%;
      	border: none;
     	outline: none;
      }
      .char{
      
      }
      .item{
      	padding: 2px 0 2px 0;
      	outline: none;
      }
      .charInput{
      	width: 90%;
      	outline: none;
      	border: none;
      	border-bottom: 1px solid #BDBDBD;
      }
      .dateInput{
      	color: #BDBDBD;
      	outline: none;
      	border: none;
      	border-bottom: 1px solid #BDBDBD;
      }
      .etc{
      	overflow: hidden;
      	width: 98%; height: 100%;
      	resize: none;
      	outline: none;
      	border: 0;
      	font-size: 16px;
      }
      .hidden {
   		display: none;
		}
      .contents{
      	font-size: 20px; color: black;
      	border-bottom: 1px solid #7E7E7E;
      	margin-bottom:10px; margin-top: 10px;
      	padding-bottom: 3px;
      }
      .img_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 25%; height: 250px;
 		padding: 10px;
      	float: right;
      	border: 1px solid #7E7E7E;
      	border-radius: 10px;
      }
      .fileLable{
      	display: inline-block;
      	width: 100%; height: 75.6%;
  		padding: 8px 0px;
    	cursor: pointer;
    	background-color: #f9f9f9;
    	border: 1px solid #ccc;
    	border-radius: 4px;
    	font-size: 200px;
    	text-align: center;
    	color: #A3A3A3;
      }
      .fileInput{
      	position: absolute;
    	width: 1px;
    	height: 1px;
    	overflow: hidden;
    	clip: rect(0,0,0,0);
      }
      .fileLable:hover {
    	background-color: #e0e0e0;
    	}
      .dog_Img{
      	width: 100%; height: 200px;
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
		padding-left: 20px;
		padding-right: 20px;
		padding-bottom: 5px;
		padding-top: 5px;
		font-size: 15px;
		font-weight: bold;
      }
</style>
<script>
	$(function(){
		$('#btn').click(function(){
			console.log($('#dogName').val());
			let temp={temp:[{dogName:$('#dogName').value,age:40},{name:"손흥민",age:30},{name:"김민재",age:32}]}
			
			$.ajax({
				url:'temp/tempWrite',
				type:'post',
				async:true,
				data:{temp:JSON.stringify(temp)},
				success:(function(result){
					alert(result);
				})
			})
		})
	})
</script>
</head>
<body>
<%@ include file="../main/headerLogin.jsp" %>
<div class="text">임시보호소</div>

<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				
				<input type="text" placeholder="강아지 이름" class="dogname_box" id="dogName">
				
				<div><img src="<%=request.getContextPath()%>/image/place.png"><input type="text" placeholder="현재 보호중인 장소" class="address"></div>
				
				<div class="contents char">특징</div>
				
				<div class="char_box" id="char_box">
					<div class="item" contenteditable="true">
					▶ <input class="charInput" type="text" placeholder="강아지 특징을 써주세요">
					</div>
				</div>
				
				<div class="contents">임시보호기간</div>
    			<input class="dateInput" type="date" id="dateInput" name="dateInput">
    			
				<div class="contents">기타사항</div>
				<textarea class="etc" placeholder="기타사항 작성란입니다"></textarea>
				
			</div>
			<div class="img_box">
				<label for="fileInput" class="fileLable">+</label>
				<input type="file" id="fileInput" class="fileInput">
			</div>
		</div>
	</div>
</div>
	<div style="display: flex;
   	 	justify-content: center;
      	align-items: center;
      	margin-bottom: 150px;">
      	<a href="" class="boardBtn Btn" id="btn">등록</a>
    </div>
</body>
<script>
const charBox = document.getElementById('char_box');

function handleKeyPress(event) {
    if (event.key === 'Enter') {
        addNewItem();
    }
    if (event.key == 'Backspace'){
    	remove
    }
}

function addNewItem() {
    const newItem = document.createElement('div'); // 새로운 div 요소 생성
    
    // 삭제 버튼 추가
    const deleteButton = document.createElement('button'); // 새로운 button 요소 생성
    deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
    deleteButton.onclick = function() {
        removeItem(newItem);
    };
    newItem.appendChild(deleteButton); // 버튼 요소를 항목에 추가
    
    /* newItem.textContent = '▶ ';
    newItem.className = 'item'; */
    
    const itemText = document.createElement('input'); // 새로운 input 요소 생성
    itemText.type = 'text'; // input 타입을 text로 지정
    itemText.className = 'charInput';
    itemText.placeholder = '강아지 특징을 써주세요';
    newItem.appendChild(itemText); // input 요소를 항목에 추가

    charBox.appendChild(newItem); // 부모 요소에 새로운 항목 추가
}

function removeItem(item) {
    item.parentNode.removeChild(item); // 부모 요소에서 해당 항목 제거
}

// 입력 가능한 상자에 이벤트 리스너 추가하여 키보드 입력 이벤트 감지
charBox.addEventListener('keypress', handleKeyPress);

$('#')
</script>
</html>