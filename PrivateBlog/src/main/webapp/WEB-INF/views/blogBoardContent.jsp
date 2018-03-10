<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
<style>
.wrapperDiv {
	width: 1000px;
	background-color: lightgray;
	padding-top: 10px;
	padding-bottom: 10px;
}

.creationInfoDiv {
	width: 970px;
	height: 23px;
	margin: auto;
	background-color: white;
	padding-left: 10px;
}

.titleDiv {
	width: 970px;
	margin: auto;
	margin-top: 10px;
	height: 35px;
	line-height: 35px;
	padding-left: 10px;
	background-color: white;
}

.contentDiv {
	width: 956px;
	margin: auto;
	margin-top: 10px;
	padding: 12px;
	background-color: white;
}

.recommendDiv {
	width: 57px;
	height: 28px;
	float: left;
	text-align: center;
	line-height: 27px;
	background-color: white;
	margin-top: 10px;
}

.backListDiv {
	width: 118px;
	height: 28px;
	float: left;
	line-height: 29px;
	margin-left: 825px;
	margin-top: 10px;
	text-align: center;
	background-color: white;
}

.nickName {
	width: 87px;
	float: left;
}

.recoImg {
	width: 24px;
	position: absolute;
	left: 849px;
}

.creationInfo {
	width: 116px;
	float: right;
}
</style>
</head>
<body>
<c:set var="content" value="${content}"/>
	
	<div class="wrapperDiv">
		<div class="creationInfoDiv">
			<div class="nickName">
				${content.name} 
			</div>
			<div class="recoImg">
				0
			</div>
			<div class="creationInfo">
				${content.recommend} &ensp;${content.creation}
			</div>
		</div>
		<div class="titleDiv">
			${content.title}
		</div>
		<div class="contentDiv">
			${content.content}
		</div>
		<div class="recommendDiv">
			${content.recommend}
		</div>
		<div class="backListDiv">
			<a href="board">전체목록으로</a>
		</div>
	</div>
</body>
</html>