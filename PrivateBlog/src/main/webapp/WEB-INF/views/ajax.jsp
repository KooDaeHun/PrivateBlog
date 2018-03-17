
<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html> 
<html> 
<head> 
<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
<script> 
$(function(){ 
  $('#id01').on('click',function(){
         alert("데이터 요청!> <");   //서버로부터 데이터 요청 
    $.ajax({    //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
         url:'test02',  //가져오고자하는 서버페이지 주소를 넣는다. 
         type:'get',  //데이터를 가져온다는 뜻의 get 
         success : function(t){  
                   //alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅  
                   //alert($(t).text());  // 경고 창에 JSP파일의 내용이 떠야 한다.
                  $("<h1></h1>").text($(t).text()).appendTo("body");   //<h1>태그 적용해서 출력!  
           }, 
          error : function(){ 
          alert('연결실패 ㅠㅠ'); 
          } 
    });   
   }); 
   $('#id02').on('click',function(){  
   alert("데이터 전송~ ^^*"); 
   }); 
}); 

</script> 
<meta charset="UTF-8"> 
<title>클라이언트파일 </title> 
</head> 
<body> 
<button id="id01"> 데이터 요청</button><br/>
<button id="id02"> DB로 전송</button><br/>
</body> 
</html>