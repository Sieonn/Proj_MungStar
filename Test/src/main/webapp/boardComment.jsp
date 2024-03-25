<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 JSP</title>
  <style type="text/css">
  	.wrap{
  		background-color: #f5f5f5;
  		width: 990px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
  	}
  	.writeComm{
  		width: 800px; margin: 10px auto; padding: 5px;
  		overflow: hidden;
  	}
  	
  	.commContent{
  		text-align: right;
		font-size: 15px;
  	}
  	
  	.commNickname{
		text-align: right;
		font-size: 12px;
		font-weight: bold;
		color: gray;
  	}
  	
  	.memComm{
		width: 800px; margin: 10px auto; padding: 5px;
  		overflow: hidden;  	
  	}
  	
  	.inputDiv{
  		margin: 20px auto 10px auto;
  		width: 800px; padding: 5px;
  		background-color: white;
  		border-style : solid;
  		border-color: gold;
  		border-width: 4px;
  		border-radius: 14px;
  		box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
  	}
  	.inputComment{
  		display: inline-block;
  		width: 80%;
  		height: 40px;
   		margin-left: 5px;
  		margin-right: 20px; 
  		border-style: none;
  		outline: none;
  		font-size: 15px;
  	}
  	.commwrap{
  		width: 1000px;
		padding: 10px;
  		margin: 0 auto;
  		overflow: hidden;
  	}
  	.cheader{
  		font-size: 20px;
  	}
  	.commBtn{
  		margin-left: 50px;
  		background-color: gold;
  		border: none;
		box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
  		border-radius: 10px;
		padding-left: 15px;
		padding-right: 15px;
		padding-bottom: 3px;
		padding-top: 3px;
		font-size: 13px;
		font-weight: bold;
  	}
  	
  	.mycomm{
  		float: right;
  	}
  	.comm{
  		float: left;
  	}
  </style>
</head>
<body>
<div class="commwrap">
<div class="cheader">&nbsp;COMMENT</div>
<div class="wrap">
	<div class="writeComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="mycomm">
		<span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent mycomm" >댓글내용이 들어가는 곳입니다.&nbsp;&nbsp;</span>
	</div>
	<div class="writeComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="mycomm">
		<span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent mycomm" >댓글내용이 들어가는 곳입니다.&nbsp;&nbsp;</span>
	</div>
	<div class="memComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="comm">
		<span class="commNickname comm">&nbsp;&nbsp;<img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent comm" >&nbsp;&nbsp;댓글내용이 들어가는 곳입니다.</span>
	</div>     
    <div class="inputDiv">
    <form action="">
    	<input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
		<button type="submit" class="commBtn">등록</button>
	</form>
	</div>
</div>
</div>
</html>
