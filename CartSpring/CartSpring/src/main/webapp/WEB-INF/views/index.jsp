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
		<h2>상품 목록 화면</h2>
		<table border="1">
			<tr calss="header">
				<th align="center" width="80">상품ID</th>
				<th align="center" width="320">상품명</th>
				<th align="center" width="100">가격</th>
			</tr>
			<c:forEach items="${itemList }" var="item">
				<tr class="record">
					<td align="center">${item.item_ID }</td>
					<td align="left"><a href="detail?item_ID=${item.item_ID }">${item.item_Name }</a></td>
					<td align="right">${item.price }원</td>					
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>