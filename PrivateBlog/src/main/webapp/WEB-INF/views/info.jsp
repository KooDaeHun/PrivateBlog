<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>info</title>
<style>
	.infoPro{
		text-align: center;
	}
	.banana{
		margin-left: 370px;
   	 	height: 200px;
	}
	.ob1{
		text-align: center;
    	font-size: 1px;
    	color: lightgray;
	}
</style>
</head>
<body>
	<div class="infoPro">
		<h1>Hi! Welcome to Koo's DevelopNote! - BETA</h1><br>
		<h2>WEB - ADDRESS : http://116.46.126.218:80/pohang/index</h2>
		<h3>크롬 외의 브라우저 이용 시 레이아웃 다 틀어짐.</h3>
		Welcome! Mr.<c:out value="${user.id}"/>
		<p>게시판 - 공지사항 읽어보신 후 회원가입하세요.</p>
		개선사항 게시판으로 알려주시면 감사하겠습니다. 테스트에 도움주셔서 감사합니다.
		<p>가입 후 게시판에 개선사항과 카톡 id를 남겨주세요. 바나나우유 기프티콘 쏩니다!</p>
	</div>
	<img class="banana" src="resources/images/banana.png"/>
	<div class="ob1">*기프티콘 전송 시일은 1년이 걸릴 수도 있습니다. 이 점 참고바랍니다.*</div>
</body>
</html>