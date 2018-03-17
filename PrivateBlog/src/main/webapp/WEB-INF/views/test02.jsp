
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서버페이지</title>
</head>
<body>
	<%
		try {
			String driver = "oracle.jdbc.driver.OracleDriver"; //대소문자 기억! 
			Class.forName(driver); //클래스명을 집어넣어주면 자동으로 객체를 만들어주는 함수. 
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; //sql의 포트번호와 SID적기 
			String userName = "skazm12";
			String passWord = "dkdlxl";
			Connection con = DriverManager.getConnection(url, userName, passWord);
			Statement st = con.createStatement();
			
			//DB에 데이터 넣기
			String sql = "insert into general (gname,gage,gmoney) values ( '이순신' , 36 , 650 )";
			st.executeUpdate(sql);
			
			String sql2 = "select * from general"; //명령문 추가할 때 마다 변수명을 달리해줘야한다! 
			ResultSet rs = st.executeQuery(sql2);
			while (rs.next()) {
				String s = rs.getString("gname");
				long n1 = rs.getLong("gage");
				long n2 = rs.getLong("gmoney");
				out.write(s + " " + n1 + " " + n2 + "<br/>"); //데이터를 요청하는 클라이언트에게 보내준다. 
			}
			
			con.close();
			st.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>
