<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
.wrapperDiv {
	width: 1000px;
	padding-top: 10px;
	padding-bottom: 10px;
	border: 2px solid gray;
    border-radius: 9px;
}

.creationInfoDiv {
	width: 970px;
	height: 23px;
	margin: auto;
	background-color: white;
	padding-left: 10px;
}

.titleDiv {
	width: 970px;
	margin: auto;
	margin-top: 10px;
	height: 35px;
	line-height: 35px;
	padding-left: 10px;
	border: 1px solid gray;
    border-radius: 4px;
}

.contentDiv {
	width: 956px;
	height: auto;
    min-height: 470px;
	margin: auto;
	margin-top: 10px;
	padding: 12px;
	border: 1px solid gray;
    border-radius: 4px;
}

.recommendDiv {
	width: 57px;
	height: 28px;
	float: left;
	text-align: center;
	line-height: 27px;
	background-color: white;
	margin-top: 15px;
}

.nickName {
	width: 87px;
	float: left;
}

.recoImg {
	width: 24px;
    float: left;
    margin-left: 5px;
}

.creationInfo {
	width: 170px;
    float: left;
    margin-left: 713px;
}
.creationDiv{
	width: 100px;
    float: left;
}
.readNumber{
	width: 24px;
    float: left;
    text-align: center;
}
.recommendBtn {
	width: 55px;
    height: 38px;
    line-height: 13px;
    display: inline-block;
    border: none;
    transition: all 0.5s;
    cursor: pointer;
    font-size: 17px;
    font-weight: bolder;
    margin-top: 3px;
    float: left;
    background-color: white;
    outline: none;
}

.backListDiv {
	width: 107px;
    height: 24px;
    float: left;
    line-height: 25px;
    margin-left: 839px;
    position: absolute;
	border-radius: 10px;
    display: inline-block;
    border: 2px solid gray;
    transition: all 0.5s;
    font-weight: bolder;
    text-align: center;
    margin-top: 3px;
}

.backListDiv:hover {
	box-shadow: inset 0px 0px 1px 3.5px rgba(153, 153, 153, 0.5);
	text-shadow: 0px 0px 0px rgba(255, 225, 255, 0);
	text-align: center;
}
.recommendImg{
	width: 53px;
    float: left;
    margin-top: -8px;
}
.recoDiv{
	width: 20px;
    position: absolute;
    top: 614px;
    margin-left: 13px;
    color: white;
}
</style>
</head>
<body>
	<div class="wrapperDiv">
		<div class="creationInfoDiv">
			<div class="nickName">
				${content.name} 
			</div>
			<div class="creationInfo">
				<div class="creationDiv">
					${content.creation}
				</div>
				<div class="readcountDiv">
					<img class="recoImg" src="resources/images/readcount.png"/>
					<div class="readNumber">${content.readcount}</div>
				</div>
			</div>
		</div>
		<div class="titleDiv">
			${content.title}
		</div>
		<div class="contentDiv">
			${content.content}
		</div>
	</div>
	<c:choose>
		<c:when test="${empty user}">
			<button name="recommend" onclick="loginPlease()" id="recoBtn" class="recommendBtn" type="button" value="${content.recommend}">
				<img class="recommendImg" src="resources/images/stoneReco.jpg"/> 
				<div class="recoDiv">${content.recommend}</div>
			</button>
		</c:when>
		<c:otherwise>
			<input name="num" value="${content.num}" id="num" type="hidden"/>
			<input name="user" value="${user.usernum}" id="user" type="hidden"/>
			<input name="stone" value="${user.stone}" id="stone" type="hidden"/>
			<button name="recommend" onclick="recoPlus()" id="recoBtn" class="recommendBtn" type="button" value="${content.recommend}">
				<img class="recommendImg" src="resources/images/stoneReco.jpg"/> 
				<div class="recoDiv">${content.recommend}</div>
			</button>
		</c:otherwise>
	</c:choose>
	
	
	<div class="backListDiv">
		<a href="board">목록으로</a>
	</div>
<script type="text/javascript">
	var recoBtn = document.getElementById('recoBtn');
	var recoVal = $('#recoBtn').val();
	function loginPlease(){
		alert("로그인 후 가능합니다!");
	}
	
	function recoPlus(){
		recoVal++;
		$('.recoDiv').text(recoVal);
		recoBtn.value = recoVal;
		
		recoBtn.onclick = recoMinus;
	}
	function recoMinus(){
		recoVal--;
		$('.recoDiv').text(recoVal);
		recoBtn.value = recoVal;
		
		recoBtn.onclick = recoPlus;
	}
	$(function(){
		$('#recoBtn').on('click', function(){
			$.ajax({
				url:'recoUpdate',
				type:'post',
				data:{
					num: $('#num').val(),
					recommend: $('#recoBtn').val(),
					user: $('#user').val()
				},
				success: function(){
				},
				error: function(){
					alert('ajax 실패!');
				}
			});
		});
	});
</script>
</body>
</html>