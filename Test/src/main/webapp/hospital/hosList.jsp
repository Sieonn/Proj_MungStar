<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script>

</script>
<style>
.container{
transform: scale(0.9,0.9);
position:relative;
width:400px;
right:280px;
float:right;

}
.backWalkDetail {
	width: 750px;
	height: 750px;
	background-color: #F5F5F5;
	border-radius: 40px;
}

.frontWalkDetail {
	position: relative;
	top: 40px;
	width: 700px;
	height: 660px;
	background-color: #F5F5F5;
	margin: 0 auto;
	border-radius: 40px;
	border-right: 3px solid #D9D9D9;
}

.walkDetail {
	position: relative;
	top: 15px;
	width: 650px;
	height: 630px;
	background-color: white;
	border-radius: 5%;
	margin: 0 auto;
}

#walkContent {
	width: 610px;
	height: 200px;
	margin: 0 auto;
}


#walkTopEmpty, #walkBottomEmpty  {
	height: 30px;
	margin: 0;
}

#walkMidEmpty {
	height: 80px;
	margin: 0;
}



#exitBtn {
	position: relative;
	float: right;
	right: 50px; margin-top : 10px;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: #C91C1C;
	box-shadow: 1px 1px 3px #ECECEC inset;
	margin-top: 10px;
}

a {
	margin-top: 5px;
	margin-left: 5px; text-align : center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

.walkLocalRec, .walkAllRec{
height: 300px;
margin-left: 10px;
}

h2{
color:white;
-webkit-text-stroke: 1px #2F65DD;
text-shadow: 1px 2px 2px lightgray;
font-weight: bold;
margin-left:5px;
font-family: "JalnanGothic";
}
#RecTable{
width: 580px;
margin: 0 auto;
text-align: center;
}

#trLine{
border-bottom: 2px solid #DFE1E6;
}
#trLike{
color: #2F54DD;
font-weight: bold;
height:40px;
width:40px;
}
#trPlace{
width:140px;
height:40px;
}

#trAddress{
width:400px;
height:40px;

}

</style>
</head>
<body>
<div class="container">
	<div class="backWalkDetail">
		<div id="exitBtn">
			<a href="#">X</a>
		</div>
		<div class="frontWalkDetail">
			<div class="walkDetail">
				<div id="walkTopEmpty"></div>
				<div id="walkContent">
					<div class="walkLocalRec">
						<h2>위치 기반 추천</h2>
						<table id="RecTable">
						<tr id="tr1">
						<th>LIKE</th>
						<th>PLACE</th>
						<th>ADDRESS</th>
						</tr>
						<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						<tr>
						<td id="trLike">121</td>
						<td id="trPlace">카카오오름</td>
						<td id="trAddress">서울시 어쩌고 그므천구 호서구 호구구</td>
						</tr>
												<tr>
						<td id="trLike">166</td>
						<td id="trPlace">에이바우트커</td>
						<td id="trAddress">카카오시 카카오동 카카오로 카카아파트</td>
						</tr>
												<tr>
						<td id="trLike">64</td>
						<td id="trPlace">제주첨단과학기술단지</td>
						<td id="trAddress">경기도 파주시 금천구 어쩌구 저쩌구</td>
						</tr>
												<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						</table>
					</div>
					<div class="walkAllRec">
							<h2>전체 지역 추천</h2>
													<table id="RecTable">
						<tr id="tr1">
						<th>LIKE</th>
						<th>PLACE</th>
						<th>ADDRESS</th>
						</tr>
						<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						<tr>
						<td id="trLike">121</td>
						<td id="trPlace">카카오오름</td>
						<td id="trAddress">서울시 어쩌고 그므천구 호서구 호구구</td>
						</tr>
												<tr>
						<td id="trLike">166</td>
						<td id="trPlace">에이바우트커</td>
						<td id="trAddress">카카오시 카카오동 카카오로 카카아파트</td>
						</tr>
												<tr>
						<td id="trLike">64</td>
						<td id="trPlace">제주첨단과학기술단지</td>
						<td id="trAddress">경기도 파주시 금천구 어쩌구 저쩌구</td>
						</tr>
												<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						</table>
					</div>
				</div>
				</div>

		</div>
	</div>
</div>
</body>
<script>
$('#exitBtn').on("click",function(){
$.ajax({
	url:'walkBoard.jsp',
	success:function(response){
		$('#leftDiv').empty();
		$('#leftDiv').append(`<img id="helpMessage" src="./image/help.png"/>`);
	}
	
})
})
</script>
</html>