<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="pagefile" value="${param.page }"/>
<c:choose>
	<c:when test="${pagefile == null }">
		<c:set var="pagefile" value="info.jsp"/>
	</c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HomePage</title>
<style>
*{
	padding: 0px;
	margin: 0px;
}
.infoDiv {
	position: absolute;
	top: 64px;
	left: 294px;
	width: 1000px;
}
.leftLayout{
	position: fixed;
	left: 0;
	top: 0px;
}
</style>
</head>
<body>
	<div class="leftLayout">
		<jsp:include page="left.jsp"/>
	</div>
	<div class="infoDiv">
		<jsp:include page="${pagefile }"/>
	</div>
	
</body>
</html>