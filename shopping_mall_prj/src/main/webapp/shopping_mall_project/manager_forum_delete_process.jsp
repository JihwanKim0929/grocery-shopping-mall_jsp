<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% request.setCharacterEncoding("euc-kr"); %>
<%
String post_num=request.getParameter("post_num");

String sql="DELETE FROM forum_post WHERE post_num = ?";
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/odbo";
String username="root";
String password="0929";
Connection conn=null;
Class.forName(driverName);
conn=DriverManager.getConnection(url,username,password);

PreparedStatement sm=conn.prepareStatement(sql);
sm.setString(1,post_num);

int count=sm.executeUpdate();

if(count==1){
	out.print(post_num+"�� �Խù� ���� �Ϸ�!");
}
else{
	out.print(post_num+"�� �Խù� ���� ����!");
}
sm.close();
conn.close();

%>
<br>
<a href='manager_page.jsp' style="background:yellow;">������ �������� ���ư���</a><br>