<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
	<div align="center">
		<table class="header">
			<tr>
				<td width="160"><a href="index">■목록으로 돌아가기</a></td>
				<td width="160"><a href="checkout">■계산하러 가기</a></td>
				<td width="160"><a href="cartConfirm">■카트 확인하기</a></td>
				<td width="160"><a href="cartClear">■카트 비우기</a></td>
				<td width="160">
					<c:choose>
						<c:when test="${not empty loginUser }">
							<font color="red">
								환영해요,
								<c:out value="${loginUser.user_id }"/>씨	
							</font>
						</c:when>
						<c:when test="${empty loginUser }">
							<font color="red"><a href="login">■로그인하기</a></font>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
	<hr>
</body>
</html>