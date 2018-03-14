<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
<style>
	.page{
		width: 15px;
   	 	text-align: center;
   		border: none;
   		cursor: pointer;
   		background-color: white;
	}
	.page:hover{
		color: red;
		font-size: 20px;
	}
</style>
</head>
<body>
	<form action="board" method="get">
		<c:forEach items="${pageCount}" var="page">
			<input name="pageNumber" class="page" type="submit" value="${page.pageNumber}" readonly="readonly"/>
		</c:forEach>
	</form>
</body>
</html>