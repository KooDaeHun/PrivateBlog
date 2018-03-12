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
	padding-bottom: 6px;
}

.creationInfoDiv {
	width: 970px;
	height: 23px;
	margin: auto;
	background-color: white;
	padding-left: 10px;
}

.titleInput {
	width: 957px;
	height: 10px;
	margin-top: 10px;
	margin-left: 10px;
	padding: 10px;
}

.conTextarea {
	width: 959px;
	height: 450px;
	padding: 10px;
	margin-left: 10px;
	margin-top: 10px;
	resize: none;
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

.listLink {
	width: 83px;
	height: 22px;
	line-height: 24px;
	text-shadow: 3.5px 1.5px 0px rgba(0, 0, 0, 0.15);
	border-radius: 15px;
	display: inline-block;
	border: 2px solid;
	transition: all 0.5s;
	cursor: pointer;
	font-size: 12pt;
	font-weight: bolder;
	text-align: center;
	margin-top: 10px;
	margin-left: 820px;
}

.listLink:hover {
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}

.writeCompletion {
	margin-left: 0px;
}
</style>
</head>
<body>

	<div class="wrapperDiv">
		<div class="creationInfoDiv">
			<div class="nickName">
				<!-- session에서 얻어오는 ID -->
			</div>
			<div class="recoImg">
				
			</div>
			<div class="creationInfo">
				<!-- 시스템상 오늘 날짜 -->
			</div>
		</div>

			<input class="titleInput" type="text" name="title" maxlength="40" placeholder="Title"/>


			<textarea class="conTextarea" name="content"></textarea>
	</div>
	<div class="listLink" id="resume">
			<a href="board">목록으로</a>
	</div>
	<div class="listLink writeCompletion" id="resume">
			<a href="#">글쓰기</a>
	</div>
</body>
</html>