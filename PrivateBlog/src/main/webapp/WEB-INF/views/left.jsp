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

a {
	text-decoration: none;
	color: black;
}

.leftDiv {
	width: 256px;
	height: 734px;
	box-shadow: 3px 0px 5px 0.5px rgba(153, 153, 153, 0.5);
	z-index: 2;
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

.memberDiv {
	width: 256px;
	height: 28px;
	float: left;
}
 
.loginDiv {
	width: 256px;
	height: 64px;
	float: left;
}

.loginInfoDiv {
	width: 156px;
	height: 64px;
	float: left;
}

.loginCompletionDiv {
	width: 100px;
	height: 64px;
	float: left;
} 

.boardMenuDiv {
	width: 256px;
    height: 431px;
    text-align: center;
    float: left;
    line-height: 36px;
    margin-top: 10px;
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

.memberA {
	width: 84px;
	height: 19px;
	float: left;
	line-height: 19px;
	text-shadow: 3.5px 1.5px 0px rgba(0, 0, 0, 0.15);
	border-radius: 15px;
	display: inline-block;
	border: 2px solid;
	transition: all 0.5s;
	cursor: pointer;
	font-size: 12pt;
	font-weight: bolder;
	text-align: center;
	margin-top: 2.5px;
}
.joinDiv {
	margin-left: 10px;
}
.memberA:hover {
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}
.idpwSearchDiv{
	margin-left:2px;
}
.loginInput{
	width: 131px;
	margin-left: 10px;
}
.idInput{
	margin-top: 10px;
}
.loginButton{
	width: 90px;
	height: 54px;
	margin-top: 5px;
	
}
.myPageDiv {
	width: 51px;
    height: 15px;
    line-height: 13px;
    border-radius: 5px;
    display: inline-block;
    border: 2px solid;
    transition: all 0.5s;
    cursor: pointer;
    font-size: 9pt;
    font-weight: bolder;
    text-align: center;
    position: absolute;
    margin-top: 3px;
    margin-left: -11px;
}

.myPageDiv:hover {
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}
.userDiv{
	margin-left: 15px;
    font-size: 17px;
    font-weight: bold;
    width: 129px;
    height: 28px;
    float: left;
}
.logoutDiv{
	margin-left: 45px;
}
</style>
</head>
<body>
	<div class="leftDiv">
	
		<div class="logoDiv">
			<a href="index"><img class="logoImg" src="resources/images/stone.jpg"/></a>
		</div>
		
		
		
		
		<c:choose>
			<c:when test="${empty user}">
				<div class="memberDiv">
					<div class="joinDiv memberA">
						<a href="join">회원가입</a>
					</div>
					<div class="idpwSearchDiv memberA">
						<a href="#">id/pw찾기</a>
					</div>
				</div>
				<div class="loginDiv">
					<form action="loginProsessor" method="post">
						<div class="loginInfoDiv">
							<input class="loginInput idInput" name="id" type="text" placeholder="ID" maxlength="10"/> 
							<input class="loginInput" name="pw" type="password" placeholder="Password" maxlength="10"/>
						</div>
						<div class="loginCompletionDiv">
							<input class="loginButton" type="submit" value="Login">
						</div>
					</form>
				</div>
			</c:when>
			<c:when test="${not empty user}">
				<div class="memberDiv">
					<div class="userDiv">
						${user.id}님
					</div>
					<div class="myPageDiv">
						<a href="board">MyPage</a>
					</div>
					<div class="myPageDiv logoutDiv">
						<a href="logout">Logout</a>
					</div>
				</div>
				<div class="loginDiv">
					
				</div>
			</c:when>
		</c:choose>
		
		
		
		
		
		
		
		
		
		
		
		
		
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