<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 미아보호소 게시글</title>
<style>
	body,
    html {
        width: 1920px;
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
        }
	.text {
		margin-top: 40px;
		margin-left: 318.719px; margin-right: 318.719px;
    	padding-left: 20px; padding-right: 20px;
        font-size: 25px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 auto;
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
      	width: 1168.07px; height: 480px;
      	border-radius: 20px;
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
<div class="text">미아보호소</div>

<div class="content_container">
	<div class="content_box">
	
	</div>
</div>

<div class="btn_container">
	<button type="submit" class="boardBtn Btn">목록</button>
	<button type="submit" class="modifyBtn Btn">수정</button>
</div>

<%@ include file="/boardComment.jsp" %>

</body>
</html>