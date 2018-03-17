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
.joinWrapper{
   width: 468px;
    height: 231px;
    position: absolute;
    top: 100px;
    left: 200px;
    padding: 10px 0px 10px 10px;
    background-color: lightgray;
    float: left;
}
.joinID{
	width: 342px;
    height: 32px;
    padding-left: 10px;
    font-size: 20px;
    ime-mode: disavled
}
.idCheck{
	width: 101px;
    height: 36px;
    position: absolute;
    margin-left: 1px;
}
.joinPW{
	width: 342px;
    height: 32px;
    display: block;
    font-size: 20px;
    padding-left: 10px;
    margin-top: 1px;
}
.joinEMAIL{
	width: 342px;
    height: 32px;
    font-size: 20px;
    padding-left: 10px;
    margin-top: 1px;
}
.joinBtn{
	width: 458px;
    height: 46px;
    margin-top: 1px;
}
.joinMailCheck{
	width: 101px;
    height: 36px;
    position: absolute;
    margin-top: 1px;
    margin-left: 1px;
}
.joinMailNumber{
	width: 454px;
    height: 32px;
    text-align: center;
    color: lightcoral;
    margin-top: 0.5px;
    display: block;
}
.titleH1{
	margin-left: 297px;
    margin-top: 54px;
}
</style>
</head>
<body>
	<h1 class="titleH1">메일 인증 안됨 id,pw,email만 입력 후 가입</h1>
	<div class="joinWrapper">
	
	<form method="post" action="joinProsessor">
		
		<input class="joinID" name="id" type="text" maxlength="10" placeholder="ID" required="required"/>
		<input class="idCheck" type="button" onclick="checkID(this.form)" value="IDcheck!"/>

		
		
		<input id="pw1" name="pw" oninput="checkPwd()" class="joinPW" type="password" minlength="8" maxlength="10" placeholder="Password" required="required"/>
		<input id="pw2" oninput="checkPwd()" class="joinPW" type="password" minlength="8" maxlength="10" placeholder="PasswordCheck" required="required"/>
		
		
		
		<input class="joinEMAIL" name="email" type="text" placeholder="E-Mail" required="required"/>		
		<input class="joinMailCheck" type="button" value="MailCheck!"/>
		<input class="joinMailNumber" type="text" value="인증번호 입력"/>
		<input class="joinBtn" type="submit" value="JOIN!"/>
	</form>
	</div>
	
<script type="text/javascript">
// idCheck -> 중복 체크하는 기능 home에서 코딩해야함.
	function checkID(myform) {
		url = "idCheck?id="+myform.id.value;
		window.open(url, "win01", "width=300, height=10, top=300px,left=580px");
	}
	function checkPwd() {
	    var pw1 = $('#pw1').val();
	    var pw2 = $('#pw2').val();
	    
	    if(pw2=="" && (pw1 != pw2 || pw1 == pw2)){
	        $("#pw2").css("background-color", "#FFCECE");
	    }
	    else if (pw1 == pw2) {
	        $("#pw2").css("background-color", "#B0F6AC");
	       
	    } else if (pw1 != pw2) {
	        pwdCheck = 0;
	        $("#pw2").css("background-color", "#FFCECE");
	    }
	}
	
</script>
</body>
</html>