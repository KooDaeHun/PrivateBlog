<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>info</title>
</head>
<body>
	<h1>Hi! Welcome to Koo's DevelopNote!</h1><br>
	<h2>WEB - ADDRESS : http://116.46.126.218:80/pohang/index</h2>
	<h3>크롬 외의 브라우저 이용 시 레이아웃 다 틀어짐.</h3>
	Welcome! Mr.<c:out value="${user.id}"/>
</body>
</html>