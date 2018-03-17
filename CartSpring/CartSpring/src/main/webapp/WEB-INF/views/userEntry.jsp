<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="jsp_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
	<%@ include file="cart_header.jsp" %>
	<div align="center" class="body">
		<h2>유저 등록 화면</h2>
		<form method="get" action="userEntryProc">
			<table>
				<tr height="40px">
					<td>유저ID</td>
					<td>
						<input maxlength="20" class="userId" name="user_id"/>
						<font color="red"><form:errors path="userId"/></font>
					</td>
				</tr>
				<tr height="40px">
					<td>패스워드</td>
					<td>
						<input type="password" name="password" maxlength="20" class="password"/>
						<font color="red"><from:errors path="password"/></font>	
					</td>
				</tr>
				<tr height="40px">
					<td>이름</td>
					<td>
						<input name="user_name" maxlength="20" class="userName"/>
						<font color="red"><from:errors path="userName"/></font>	
					</td>
				</tr>
				<tr height="40px">
					<td>우편번호</td>
					<td>
						<input name="postcode" maxlength="8" class="postCode"/>
						<font color="red"/>	
					</td>
				</tr>
				<tr height="40px">
					<td>주소</td>
					<td>
						<input name="address" maxlength="50" class="address"/>
						<font color="red"/>	
					</td>
				</tr>
				<tr height="40px">
					<td>E-Mail</td>
					<td>
						<input name="email" maxlength="50" class="email"/>
						<font color="red"><from:errors path="email"/></font>	
					</td>
				</tr>
				<tr height="40px">
					<td>직업</td>
					<td>
						<select name="job" class="jobs">
								<option value="사회인">사회인</option>
								<option value="주부">주부</option>
								<option value="학생">학생</option>
								<option value="그외">그외</option>
						</select>
					</td>
				</tr>
				<tr height="40px">
					<td>생년월일</td>
					<td>
						<input type="date" name="birthday" maxlength="10" class="birthDay" />
						<font color="red"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td height="40px" align="center">
						<input type="submit" name="btnSubmit" value="등록"/>
					</td>
					<td height="40px" align="center">
						<input type="reset" name="btnReset" value="리셋"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>