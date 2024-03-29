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
.hosMap{
position:relative;
margin: 0 auto;
}
#map{
width:570px;height:600px;
margin-left:320px;
margin-top:80px;
float:left;
border-top-right-radius:30px;
border-bottom-right-radius:30px;
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

#hosList{
width:70px;
height:30px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
color:white;
font-weight:bold;
font-size:15px;
text-align:center;
box-shadow: 0 3px 1px gray;
}
.hosBtn{
position: relative;
top: 5px;
left: 590px;
width:1200px;
height:40px;
overflow:hidden;
}
#hosMapBar{
position:relative;
float:left;
width:30px;
height:600px;
background-color:#3477c5;
border-top-left-radius:30px;
border-bottom-left-radius:30px;
margin-top:80px;
left:320px;
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="hosMap" id="hosMap">
<div id="hosMapBar"></div>
<div id="map"></div>
<div id="leftDiv">
<img id="helpMessage" src="./image/help.png"/>
</div>
</div>
<br><br>
<div class="hosBtn">
		<button id="hosList">LIST</button>
		</div>



</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147"></script>
<script>
window.onload=function(){
var mapContainer = document.getElementById('map'), 
mapOption = { 
    center: new kakao.maps.LatLng(37.4087119,127.1215282), 
    level: 4
};


var map = new kakao.maps.Map(mapContainer, mapOption); 



var imageSrc = './image/hospital.png',   
imageSize = new kakao.maps.Size(36, 40), 
imageOption = {offset: new kakao.maps.Point(27, 69)};

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.5196064, 127.0491924); 


var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage
});



let markers = [ new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4087119,127.1215282),image:markerImage, text:'zz'}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5080213,126.9639877),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5055165,127.0894048),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4799586,126.9568599),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5586363,127.0336885),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5025541,127.0358248),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5222993,126.8604122),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4141023,127.2608221),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4796716,126.9822208),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4560239,127.1629546),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.47973,126.9047274),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4606254,126.7235415),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4144194,127.252086),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5839502,127.0198223),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.710941,126.745787),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.6013963,126.9314129),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5205796,126.8453232),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.3399575,127.1084954),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4865966,126.7790745),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5038154,126.7218875),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.6033315,127.1472976),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4669249,127.1495165),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4847538,126.8089477),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.6165209,126.9231826),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.3604421,127.1077666),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.3005898,126.9838764),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5923197,127.0135432),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.3956287,126.9717399),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.6477914,127.0623239),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.3735107,126.7261129),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.4986448,126.9086027),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.360322,126.9225252),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5429507,126.8421237),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(37.5520084,127.2086132),image:markerImage}),
	new kakao.maps.Marker({position:new kakao.maps.LatLng(36.6352259,127.4758816),image:markerImage})
	]
	
	<!-- DB에 추가해서 안에 든 걸 마커로 표시해야함 .. ㅋㅋ -->
	
	for(var i=0;i<markers.length;i++){
		markers[i].setMap(map);
	}


//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


marker.setMap(map); 

kakao.maps.event.addListener(markers, "click", function() {
    $('#helpMessage').remove();
    // AJAX를 이용하여 페이지를 동적으로 include
    $.ajax({
        url: 'hosDetail.jsp', // include 하고자 하는 페이지의 URL
        success: function(response) {
            $('#leftDiv').html(response); // include된 페이지의 내용을 leftDiv에 넣음
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText); // 에러 발생 시 콘솔에 출력
        }
    });
});
$("#hosList").on("click",function(){
	$.ajax({
		url:'hosList.jsp',
		success:function(response){
			
			$('#leftDiv').html(response);
		}
		
	})	
})
$("#exitBtn").on("click",function(){
$('#leftDiv').empty();
})

}
</script>
</html>