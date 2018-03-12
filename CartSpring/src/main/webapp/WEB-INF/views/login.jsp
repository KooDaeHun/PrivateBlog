<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="jsp_header.jsp"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Home</title>
</head>
<body>
	<%@ include file="cart_header.jsp" %>
	<div align="center" class="body">
		<h2>로그인 화면</h2>
		<form action="loginProcess" method="get">
			<table>
				<tr height="40px">
					<td>유저ID</td>
					<td><font color="red"><input type="text" name="user_id"></font></td>
				</tr>
				<tr height="40px">
					<td>패스워드</td>
					<td><font color="red"><input type="password" name="password"></font></td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center"><input type="submit" value="로그인"/></td>
					<td align="center"><input type="reset" value="리셋"/></td>
				</tr>
			</table>
		</form>
	</div>	
	<a href="userEntry">■신규 유저 등록</a>
</body>
</html>