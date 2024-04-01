<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    // 검색 버튼 클릭 시 검색 기능 구현
    document.getElementById("searchBtn").addEventListener("click", function() {
        var searchTerm = document.getElementById("searchInput").value;
        // 여기서는 검색어를 콘솔에 출력하는 것으로 대체하겠습니다.
        console.log("검색어:", searchTerm);
        // 실제로는 검색 결과를 가져와서 화면에 표시해야 합니다.
        // 검색 결과를 받아오는 API 호출 등의 로직을 추가해야 합니다.
    });
</script>
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
 		margin : 0 16.6%;	
  	}
  	.listContainer{
 		width :1000px;
 		margin: 0 auto;
 		border-bottom: 2px solid #ddd;
  	}
  	
  	.searchContainer {
    	float: right;
    	display: inline-block;
		align-item: center;
		margin-bottom: 30px;
   }
     
    .searchBox input[type="text"] {
       background-color: #F5F5F5;
       width: 330px;
       height: 30px;
       padding: 3px;
       box-shadow: inset 1px 3px 2px rgba(0, 0, 0, 0.1);
       border: none;
       border-top-left-radius:12px;
       border-bottom-left-radius:12px;
       
   }
      #searchBtn{
         background-color: #2F65DD;
         float:right;
         color: #ffffff;
         width: 76px;
         height: 36px;
		 padding: 3px;
         border-width:0;
         border-top-right-radius:12px;
         border-bottom-right-radius:12px;
          box-shadow: inset 1px 3px 2px rgba(0, 0, 0, 0.1);
      }

	.board {
    	width: 1000px;
    	margin: 0 auto;
    	border-collapse: collapse;
    	margin-top: 30px;
  	}
	.board th, .board td {
   		padding: 10px;
    	text-align: center;
    	color: black;
  	}
  	.board th {
    	background-color: #ffffff;
    	border-bottom: 2px solid #ddd;
    	font-weight: bold;
  	} 
  	.footer {
  		height: 200px;
  	}
</style>
<style>
	.pagination {
    	margin-top: 20px;
    	text-align: center;
  	}
	.pagination a {
    	display: inline-block;
    	padding: 5px 10px;
    	border: 1px solid #ccc;
    	color: black;
    	text-decoration: none;    	
  	}
  	.pagination a:hover {
    	background-color: #f2f2f2;
  	}
  	a:link{
  	text-decoration: none;
    	color: #2F65DD;
  	}
	select{
		display: flex;
		width: 19px;
	}	
	.yellowBtn {
		font-weight: bold;
		margin-left: 8px;
		background-color: #FED74B;
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
	}
</style>
</head>
<body>
<jsp:include page='<c:url value="/main/header.jsp"/>'/>
<br><br><br>
<div class="pageContainer">
    

    <div id="freeCategory">
        <h2 style="margin-bottom: 5px;">자유게시판</h2>
		<h4 style = "font-weight : lighter; margin-top: 0;">검색결과</h4>
		<div class="searchContainer">
            <span class="searchBox">
                <input type="text" placeholder="  검색..." />
            	<button id="searchBtn">검색</button>
            </span>
        </div>
	</div>
     
       
<div class = "listContainer">
<table class="board">
  <thead>
    <tr>
  	  <th>태그
  	  <div style = "display:inline-block;">
  	  		<select onchange="getPostsByTag(this.value)">
				<option value="daily">#일상</option>
				<option value="dogCon">#전국갱얼쥐자랑</option>
				<option value="infoShare">#정보/공유</option>
				<option value="Question">#질문</option>
			</select>
		</div></th>
  	  	
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post1.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-25</td>
      <td>109</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a id="title" href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>486</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>1109</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>19</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>9</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>5</td>
    </tr>
     <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 갱얼쥐 보세요 짱 귀여움;</a></td>
      <td>초코맘</td>
      <td>2024-03-24</td>
      <td>10</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">말랑콩떡 인절미 최고</a></td>
      <td>해바라기씨도둑</td>
      <td>2024-03-24</td>
      <td>1094</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">말티푸 너무 귀여워</a></td>
      <td>마포구보안댕</td>
      <td>2024-03-24</td>
      <td>1011</td>
    </tr>
    <tr>
     <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">왕크니까 왕 귀엽다</a></td>
      <td>하울의음쥑이는성</td>
      <td>2024-03-24</td>
      <td>412</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">*★울프독★*짱크고 짱귀엽다</a></td>
      <td>은혜갚은까치</td>
      <td>2024-03-24</td>
      <td>369</td>
    </tr>
    <tr>
      <td><a href="#" onclick="getPostsByTag('dogCon')">#전국갱얼쥐자랑</a></td>
      <td><a href="post2.html">우리집 막내 사진 ^^~</a></td>
      <td>금천구물주먹</td>
      <td>2024-03-24</td>
      <td>374</td>
    </tr>
  </tbody>
</table>
</div>    
    <!-- 페이지네이션 -->
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">7</a>
  <a href="#">8</a>
  <a href="#">9</a>
  <a href="#">10</a>
  <a href="#">&raquo;</a>
  <button class="yellowBtn" id="writeButton">글쓰기</button>
</div>
 </div>
<script>
  // 글쓰기 버튼에 대한 클릭 이벤트 핸들러
  document.getElementById('writeButton').addEventListener('click', function() {
    // 글쓰기 페이지 URL로 이동
    window.location.href = 'http://localhost:8080/Test/freeBoard/freeWriteForm.jsp';
  });
</script>
<div class="footer"></div>
</body>
</html>