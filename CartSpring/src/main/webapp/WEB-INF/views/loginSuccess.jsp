<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="jsp_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
	<%@ include file="cart_header.jsp" %>
	<div align="center" class="body">
		<h2>로그인화면</h2>
		환영해요, ${user.user_name }씨!
	</div>
	<br>
	<a href="index">■목록으로 돌아가기</a>
	<br>
	<a href="checkout">■계산하러 가기</a>
</body>
</html>