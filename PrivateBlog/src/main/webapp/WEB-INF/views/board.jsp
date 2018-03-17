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
	border-collapse: collapse;
	margin-top: 15px;
}
.tr1{
	border-bottom: 1px solid black;
}
.tableHeader{
	border-bottom: 1px solid black;
	height: 35px;
}
td {
	padding: 5px 0 5px 0;	
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
	width: 101px;
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
.searchDiv{
	width: 368px;
    height: 34px;
    margin-left: 632px;
}
.searchTitle{
	width: 302px;
    height: 28px;
    padding-left: 10px
}
.titleSubmit{
	width: 52px;
    height: 32px;
    position: absolute;
}
.writeDiv{
	width: 60px;
    height: 36px;
    margin-left: 940px;
}
.writeA{
	color: white;
    font-size: 20px;
    text-shadow: 1px 0 47px black, 0 1px 45px black, 1px 0 24px black, 0 -1px 1px black;
}
.writeA:hover{
	color: black;
    font-weight: bold;
    text-shadow: 0 0 0 white;
    transition: text-shadow 0.5s ease;
}
.pageDiv{
    height: 38px;
    padding-top: 18px;
    text-align: center;
}
</style>
</head>
<body>
	<div>
	<table class="tableCla">
		<tr class="tableHeader">
			<th class="no">no</th>
			<th class="title">제목</th>
			<th class="name">작성자</th>
			<th class="creation">날짜</th>
			<th class="recommend">추천</th>
			<th class="readcount">조회</th>
		</tr>
		<c:forEach items="${boardList}" var="board">
			<tr class="tr1">
				<td class="no" align="center">${board.num}</td>
				<td class="title" align="left"><a class="titleA" href="clickTitle?num=${board.num}&readcount=${board.readcount}">${board.title}</a></td>
				<td class="name" align="right">${board.name}</td>
				<td class="creation" align="right">${board.creation}</td>
				<td class="recommend" align="right">${board.recommend}</td>
				<td class="readcount" align="right">${board.readcount}</td>
			</tr>
		</c:forEach>
		
		<div class="writeDiv">
			<a class="writeA" href="write">글쓰기</a>
		</div>
		
		<div class="searchDiv">
			<form action="boardSearch" method="post">
				<input name="title" class="searchTitle" type="text" placeholder="Title Search"/>
				<input class="titleSubmit" type="submit" value="Search!"/>	
			</form>
		</div>
	</table>
	<div class="pageDiv">
			<jsp:include page="page.jsp"/>
	</div>
</body>
</html>