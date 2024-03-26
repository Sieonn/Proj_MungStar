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
		margin: 50px 16.6% 50px 16.6%;
    	padding-left: 20px; padding-right: 20px;
        font-size: 34px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 16.6% 0 16.6%;
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
      	margin: 0 4% 0 4%;
		height: 480px;
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
      	border: none;
     	outline: none;
      }
      .char{
      
      }
      #myTextarea{
      	width: 300px; /* 너비 설정 */
		height: auto; /* 높이 설정 */
  		border: none; /* 테두리 설정 */
  		outline: none;
    	resize: vertical; /* 크기 조절 가능 여부 설정 (수직으로만 조절 가능) */
    	  }
      .hidden {
   		display: none;
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
 */      	width: 25%; height: 250px;
 		padding: 10px;
      	float: right;
      	border: 1px solid #7E7E7E;
      	border-radius: 10px;
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

</head>
<body>
<%@ include file="/header.jsp" %>
<div class="text">임시보호소</div>

<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				<input type="text" placeholder="강아지 이름" class="dogname_box">
				<div><img src="<%=request.getContextPath()%>/image/place.png"><input type="text" placeholder="현재 보호중인 장소" class="address"></div>
				<div class="contents char">특징</div>
				<div id="char_box">
				<div id="char">▶ <input type="text"></div>
				</div>
				<textarea type="text" id="myTextarea" placeholder="▶"></textarea>
				<div id="icon" class="hidden">▶</div>

				<div>▶ 회색빛이 살짝 도는 검정색 토이 푸들이에요.</div>
				<div>▶ 목에 목걸이를 차고 있어요.</div>
				<div>▶ 너무 기여워요</div>
				<div class="contents">임시보호기간</div>
				<div>2024.03.14 ~ 2024.03.20</div>
				<div class="contents">기타사항</div>
				<div>지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...! 지나가다 어미없이 혼자 떨고있길래 데리고왔는데요ㅜㅜ 
				집에 이미 키우는 강아지도 있고 둘을 키울 형편이 안돼서 잠깐 
				임시보호중인 아이입니다.. 너무귀엽고 사랑스러운 뽀삐의 보금자리가 
				돼주실분...!</div>
			</div>
			<div class="img_box">
				<img class="dog_Img" src="<%=request.getContextPath()%>/image/temp3.jpg">
				<div class="state">데리고있어요</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
const charBox = document.getElementById('char_box');
const charInput=documnet.getElementById('char');
charInput.handleKeyPress(event){
	if(event.key=='Enter'){
		addNewDiv();
	}
}

function addNewDiv(){
	const newDiv = document.createElement('div'); // 새로운 div 요소 생성
	const newInput = document.createElement('input'); // 새로운 div 요소 생성

    newDiv.className = 'char'; // 클래스 지정
    newDiv.setAttribute('contenteditable', 'true'); // 입력 가능하도록 설정
    charBox.appendChild(newDiv); // 부모 요소에 추가
}

</script>
</html>