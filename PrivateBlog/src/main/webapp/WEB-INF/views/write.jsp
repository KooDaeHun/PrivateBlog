<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

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
	padding-top: 10px;
    padding-bottom: 6px;
	border: 2px solid gray;
    border-radius: 9px;
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
	border: 1px solid gray;
    border-radius: 4px;
}

.conTextarea {
	width: 959px;
	height: 450px;
	padding: 10px;
	margin-left: 10px;
	margin-top: 10px;
	resize: none;
	border: 1px solid gray;
    border-radius: 4px;
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
    margin-left: 830px;
}

.listLink:hover {
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}

.writeCompletion {
	margin-left: 0px;
}
.writeInput{
    width: 89px;
    border: 0px;
    position: absolute;
    margin-top: 4px;
}
.writeSubmit{
	width: 83px;
    height: 26px;
    line-height: 26px;
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
    background-color: white;
    position: absolute;
}
.writeSubmit:hover{
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}

</style>
</head>
<body>
<form action="writeCompletion" method="post">
	<div class="wrapperDiv">
		<div class="creationInfoDiv">
			<div class="nickName">
			<c:choose>
				<c:when test="${user.id == null }">
					<input name="name" class="writeInput" type="text" value="로그인 하세요!" readonly="readonly"/>
				</c:when>
				<c:otherwise>
					<input name="name" class="writeInput" type="text" value="${user.id}" readonly="readonly"/>
				</c:otherwise>
			</c:choose>
				
				
			</div>
			<div class="recoImg">
				
			</div>
			<div class="creationInfo">
			
				<input name="creation" class="writeInput" type="text" value="${today}" readonly="readonly"/>
				
			</div>
		</div>
		<c:choose>
			<c:when test="${user.id == null}">
				<input class="titleInput" type="text" placeholder="Title" readonly="readonly"/>
				<textarea class="conTextarea" readonly="readonly"></textarea>
			</c:when>
			<c:otherwise>
				<input name="title" class="titleInput" type="text" maxlength="40" placeholder="Title"/>
				<textarea name="content" class="conTextarea" placeholder="Content"></textarea>
			</c:otherwise>
		</c:choose>

	</div>
	<div class="listLink" id="resume">
			<a href="board">목록으로</a>
	</div>
	<input class="writeSubmit" type="submit" value="글쓰기"/>
</form>
</body>
</html>