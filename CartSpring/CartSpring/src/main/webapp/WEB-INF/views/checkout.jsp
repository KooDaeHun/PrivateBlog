<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="jsp_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<%@ include file="cart_header.jsp" %>
	<div align="center" class="body">
		<h2>계산 화면</h2>
		<font color="red"><b>받을 곳</b></font>
		<table>
			<tr>
				<td>유저 ID : </td>
				<td>${loginUser.user_id }</td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td>${loginUser.user_name }님</td>
			</tr>
			<tr>
				<td>우편번호 : </td>
				<td>${loginUser.postcode }</td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td>${loginUser.address }</td>
			</tr>
			<tr>
				<td>E-Mail : </td>
				<td>${loginUser.email }</td>
			</tr>
		</table>
		<br>
		<br>
		<font color="red"><b>쇼핑 목록</b></font>
		<table border="1">
			<tr>
				<th width="200">상품명</th>
				<th width="150">가격</th>
				<th width="50">개수</th>
				<th width="150">소계</th>
			</tr>
			<c:forEach items="${itemList }" var="itemSet">
				<tr>
					<td align="left">${itemSet.item.item_Name }</td>
					<td align="right">${itemSet.item.price }원</td>
					<td align="right">${itemSet.quantity }개</td>
					<td align="right">${itemSet.quantity * itemSet.item.price }원</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<b>합계총액 : ${totalAmount }원</b>
		<br>
		<br>
		<form action="end">
			<input type="submit" name="btn1" value="확정"/>
		</form>
		<a href="index">■목록으로 돌아가기</a>
	</div>
</body>
</html>