<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 미아보호소 게시판</title>
<style>
	@font-face {
        font-family: "JalnanGothic";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    body,
    html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
	.text {
        font-size: 34px;
        font-family: "JalnanGothic";
        margin: 10px 0;
        float: left;
      }
    .temp_container{
    	margin: 40px auto;
        width: 976.98px;
    	height: 100px;
    	padding-left: 20px; padding-right: 20px;
    }
    .category{
    	float: right; margin-top: 50px;
    	margin-bottom: 5px;
     	height: 30px;
		padding-left: 10px; padding-right: 10px;
		padding-top: 6px; padding-bottom: 6px;   
    	background-color: #F6F6F6;
    	border-radius: 5px;
  		box-shadow: inset 1px 1px 0px rgba(0, 0, 0, 0.2);
  		border: none;
  		text-align: center;
        font-family: "JalnanGothic";
    	line-height: 30px;    	
    }
    .category option{
    	line-height: 15px;
    }
    .searchInput{
		padding-bottom: 8px; padding-top: 8px;
    	background-color: #F6F6F6;
    	border-radius: 5px;
  		box-shadow: inset 1px 1px 0px rgba(0, 0, 0, 0.2);
  		border: none;
        font-family: "JalnanGothic";
    }
    .searchBtn{
		padding-bottom: 8px; padding-top: 8px;    
    	background-color: #0155B7;
    	border-radius: 5px;
    	color: white;
    	border: none;
        font-family: "JalnanGothic";
    }
    .writeBtn{
		padding-bottom: 8px; padding-top: 8px;
		padding-left: 10px; padding-right: 10px;	    
    	background-color: #F6F6F6;
    	border-radius: 5px;
    	border: none;
        font-family: "JalnanGothic";

    }
    .album_container{
    	margin: 50px auto;
        width: 1040px;
    	padding: 0px; 
      	border-color: black;
      	overflow: hidden;
    }
    table{
    	width: 100%;	
    }
    /* .row{
    	width: 100%;
      	margin-bottom: calc(1000px/11);
      	display: flex;
   	 	justify-content: center;
      	align-items: center; 
    } */
    .album{
		margin: 17.5px 17.5px;
      	width: 280px; 
      	padding: 10px; 
      	display: inline-block;
      	border: 2px solid black;
      	border-color: darkgrey;
      	border-radius: 10px;
    }
    .column2{
    	margin-left: 9.090%; margin-right: 9.090%;
      	width: 300px;
      	padding: 10px;
      	display: inline-block;
       	border: 2px solid black;
       	border-color: darkgrey;
       	border-radius: 10px;
    }
    .column3{
      	padding: 10px;
      	width: 300px;
      	float: right;
       	display: inline-block;
      	border: 2px solid black;
      	border-color: darkgrey;
      	border-radius: 10px; 	
    }
    .tempImg{
    	width: 100%; height: 250px;
    	border-radius: 10px;
    }
    .boardContainer{
    	padding-left: 5px;
    	margin-bottom: 10px;
    }
    .dogName{
    	font-size: 22px;
    }
    .address{
    }
    .state{
    	font-size: 28px;
    	float : right;
    	margin-top: 13px;
    }
    .pageContainer{
    	display: flex;
   	 	justify-content: center;
      	align-items: center;
    }
    .pageDiv{
    	margin-top: 0px;
    	margin-bottom: 100px;
        font-family: "JalnanGothic";
    }
    .pageSelect{
    	margin: 10px;
    	text-decoration: none;
    	font-weight: bold;
    	color: gold;
    }
    .pageSelect:hover{
    	color: gold;
    }
    .morePage{
    	margin: 10px;
    	text-decoration: none;
    	color: black;
    }
</style>
</head>
<body>
<%@ include file="../main/header.jsp" %>
<div class="temp_container">
	<div class="text">미아보호소</div>
	<div class="right_container" style="float: right;">
		<select class="category" id="category" name="category" size="1" style="">
			<option value="">데리고있어요 / 데리고갔어요</option>
			<option value="찾습니다">데리고있어요</option>
			<option value="발견했습니다">데리고갔어요</option>
		</select>
    	<form action="">
    		<input type="text" class="searchInput" id="comment" name="text" placeholder="검색"/>
			<button class="searchBtn" type="submit" class="Btn">검색</button>
			<button class="writeBtn" type="submit" class="Btn">글쓰기</button>
		</form>
	</div>
</div>

<div class="album_container" >
	<c:forEach items="${losts}" var="lost" varStatus="loop">
    <div id="${lost.lostNum}" class="album">
    <a href="lostDetail?lostNum=${lost.lostNum}">
    <img class="tempImg" src="/image/lostdog01.png">
    </a>
    <div class="boardContainer">
    	<a href="lostDetail?lostNum=${lost.lostNum}">
        <span class="dogName">${lost.lostName}</span>
        <span class="state">${lost.lostCgory}</span>
        <br/><span class="address">${lost.lostAddress}</span>
        </a>
    </div>
    </div>
	</c:forEach>
</div>
<div class="pageContainer">
	<div class="pageDiv" id="">
    	<c:choose>
			<c:when test="${pageInfo.curPage!=1}">
				<a href="lostBoard?page=${pageInfo.curPage-1 }">&lt;</a>	
			</c:when>
		</c:choose>			
		
		<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i">
			<c:choose>
				<c:when test="${i==pageInfo.curPage}">	
					<a href="lostBoard?page=${i}" class="pageSelect">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="lostBoard?page=${i}" class="morePage">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
		<c:choose>
			<c:when test="${pageInfo.curPage==pageInfo.allPage}">
				<a>&gt;</a>	
			</c:when>
			<c:otherwise>
				<a href="lostBoard?page=${pageInfo.curPage+1}">&gt;</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>

</body>
</html>