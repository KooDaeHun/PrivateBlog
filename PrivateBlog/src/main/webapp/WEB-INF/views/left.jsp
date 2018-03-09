<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>left</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}
a{
	text-decoration: none;
	color: black;
}
.leftDiv {
	width: 256px;
	height: 734px;
	box-shadow: 3px 0px 5px 0.5px rgba(153, 153, 153, 0.5);
}

.logoDiv {
	padding-top: 10px;
}

.logoImg {
	display: block;
	max-width: 167px;
	max-height: 113px;
	width: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.loginDiv {
	float: left;
	width: 256px;
	background-color: powderblue;
}

.loginInfoDiv {
	text-align: center;
	float: left;
	width: 180px;
	height: 36px;
	line-height: 36px;
}

.logoutDiv {
	float: left;
	width: 76px;
	height: 36px;
	line-height: 34px;
}

.boardMenuDiv {
	margin-top: 37px;
	width: 256px;
	height: 460px;
	text-align: center;
	background-color: lightgray;
	float: left;
	line-height: 36px;
	height: 460px;
	text-align: center;
	background-color: lightgray;
	float: left;
}

.resumeDiv {
	width: 256px;
	line-height: 79px;
	height: 78px;
	float: left;
	text-align: center;
	font-size: 31px;
}

.resumeLink {
	width: 70%;
	height: 50px;
	line-height: 48px;
	text-shadow: 3.5px 3.5px 0px rgba(0, 0, 0, 0.15);
	border-radius: 15px;
	display: inline-block;
	border: 2px solid;
	transition: all 0.5s;
	cursor: pointer;
	font-size: 23pt;
	font-weight: bolder;
	text-align: center;
	margin: 12px 0px 0px 37px;
}
.resumeLink:hover {
	box-shadow: inset 0px 0px 1px 8px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}
</style>
</head>
<body>
	<div class="leftDiv">
	
		<div class="logoDiv">
			<a href="index"><img class="logoImg" src="resources/images/stone.jpg"/></a>
		</div>
		
		<div class="loginDiv">
			<div class="loginInfoDiv">
				ID님
			</div>
			<div class="logoutDiv">
				<a>로그아웃</a>
			</div>
		</div>
		
		<div class="boardMenuDiv">
			<ol>
				<li><a href="board">게시판</a></li>
			</ol>
			
		</div>
		<div class="resumeLink" id="resume">
			<a href="resume">RESUME</a>
		</div>
	</div>
</body>
</html>