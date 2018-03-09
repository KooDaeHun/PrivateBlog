<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="jsp_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<%@ include file="cart_header.jsp" %>
	<div align="center" class="body">
		<h2>카트 확인하기 화면</h2>
		<div class="cart">
			<table style="font-size:10pt;">
				<tr>
					<td colspan="2">
						<font color="green">카트에는 다음 상품이 들어있습니다.</font>
					</td>
				</tr>
				<c:forEach items="${cart.itemList }" var="itemSet">
					<tr>
						<td>${itemSet.item.item_Name }</td>
						<td>${itemSet.quantity }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		${message }
		<br>
		<br>
		<a href="index">■목록으로 돌아가기</a><br>
		<a href="checkout">■계산하러 가기</a>
	</div>
</body>
</html>