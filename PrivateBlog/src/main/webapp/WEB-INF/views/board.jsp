<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board</title>
<style>
.titleA{
	text-decoration: none;
	color: black;
}

.titleA:hover{
	text-decoration: none;
	color: lightcoral;
}

.tableCla {
	border: 1px solid #444444;
	border-collapse: collapse;
}
.tr1{
	background-color: lightgray;
}
th, td {
	border: 1px solid #444444;
}

.no{
	width: 29px;
	text-align: center;
}
.title{
	width: 723px;
	padding-left: 10px;
}
.name{
	width: 56px;
	text-align: center;
}
.creation{
	width: 89px;
	text-align: center;
}
.recommend{
	width: 48px;
	text-align: center;
}
.readcount{
	width: 48px;
	text-align: center;
}
</style>
</head>
<body>
	<div>
	<table class="tableCla">
		<tr>
			<th class="no">no</th>
			<th class="title">제목</th>
			<th class="name">작성자</th>
			<th class="creation">날짜</th>
			<th class="recommend">추천수</th>
			<th class="readcount">조회수</th>
		</tr>
		<c:forEach items="${boardList}" var="board">
			<tr class="tr1">
				<td class="no" align="center">${board.num}</td>
				<td class="title" align="left"><a class="titleA" href="clickTitle?num=${board.num}">${board.title}</a></td>
				<td class="name" align="right">${board.name}</td>
				<td class="creation" align="right">${board.creation}</td>
				<td class="recommend" align="right">${board.recommend}</td>
				<td class="readcount" align="right">${board.readcount}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>