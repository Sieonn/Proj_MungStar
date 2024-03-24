<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

<style>
body{
width:1920px;

}
.walkMap{
position:relative;
margin: 0 auto;
}
#map{
width:600px;height:600px;
margin-left:320px;
margin-top:80px;
float:left;
border-left: 30px solid #3477c5;
border-radius:3%;
box-shadow: 0px 3px 4px lightgray;
}

#helpMessage{
margin-top:150px;
width:500px;
}
a {
	margin-top: 5px;
	margin-left: 5px; text-align : center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}
#leftDiv{
margin-right:320px;
float:right;
}
</style>
</head>
<body>
<jsp:include page="/header.jsp"/>
<div class="walkMap" id="walkMap">
<div id="map"></div>
<div id="leftDiv">
<img id="helpMessage" src="./image/help.png"/>
</div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147"></script>
<script>
window.onload=function(){
var mapContainer = document.getElementById('map'), 
mapOption = { 
    center: new kakao.maps.LatLng(37.54699, 127.09598), 
    level: 4
};


var map = new kakao.maps.Map(mapContainer, mapOption); 



var imageSrc = './image/mark.png',   
imageSize = new kakao.maps.Size(36, 40), 
imageOption = {offset: new kakao.maps.Point(27, 69)};

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); 


var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage
});



marker.setMap(map); 

kakao.maps.event.addListener(marker, "click", function() {
    $('#helpMessage').remove();
    // AJAX를 이용하여 페이지를 동적으로 include
    $.ajax({
        url: 'walkingDetail.jsp', // include 하고자 하는 페이지의 URL
        success: function(response) {
            $('#leftDiv').html(response); // include된 페이지의 내용을 leftDiv에 넣음
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText); // 에러 발생 시 콘솔에 출력
        }
    });
});

$("#exitBtn").on("click",function(){
$('#leftDiv').empty();
})

}
</script>
</html>