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
      	height: 85%;
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
				<div class="dogname_box">뽀삐</div>
				<div><img src="<%=request.getContextPath()%>/image/place.png" style="">서울특별시 강북구 삼양로 21</div>
				<div class="contents">특징</div>
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

<div class="btn_container">
	<button type="submit" class="boardBtn Btn">목록</button>
	<button type="submit" class="modifyBtn Btn">수정</button>
</div>

<%@ include file="/boardComment.jsp" %>

</body>
</html>