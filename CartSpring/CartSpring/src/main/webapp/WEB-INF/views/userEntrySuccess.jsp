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
	<div align="center" class="body">
		<h2>유저 등록 완료 화면</h2>
		<b><font color="red">유저 등록이 완료되었습니다.</font></b>
		<br>
		<table>
			<tr height="40px">
				<td>${user.user_id }</td>
			</tr>
			<tr height="40px">
				<td>패스워드</td>
				<td>${user.password }</td>
			</tr>
			<tr height="40px">
				<td>이름</td>
				<td>${user.user_name }</td>
			</tr>
			<tr height="40px">
				<td>우편번호</td>
				<td>${user.postcode }</td>				
			</tr>
			<tr height="40px">
				<td>주소</td>
				<td>${user.address }</td>				
			</tr>
			<tr height="40px">
				<td>E-Mail</td>
				<td>${user.email }</td>				
			</tr>
			<tr height="40px">
				<td>직업</td>
				<td>${user.job }</td>				
			</tr>
			<tr height="40px">
				<td>생년월일</td>
				<td>${user.birthday }</td>				
			</tr>
		</table>
	</div>
</body>
</html>