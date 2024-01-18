<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/odbo";
String username="root";
String password="0929";
Connection conn=null;

Class.forName(driverName);
conn=DriverManager.getConnection(url,username,password);
Statement sm=conn.createStatement();

String u_id=request.getParameter("id");
String u_pw=request.getParameter("password");
ResultSet rs=sm.executeQuery("SELECT id,passwd,name FROM members where id='"+u_id+"' AND passwd='"+u_pw+"';");
rs.next();
if(rs.getRow()==0){
	out.println("일치하는 회원 정보가 없습니다.<br>");
	out.println("<a href='login.html' style='background:yellow;'>로그인 화면으로 이동</a>");
}
else{
	String u_name=rs.getString("name");
session.setAttribute("memberId",u_id);
session.setAttribute("memberPw",u_pw);
session.setAttribute("memberName",u_name);
response.sendRedirect("products_list.jsp");
}

sm.close();
conn.close();
%>
</body>
</html>