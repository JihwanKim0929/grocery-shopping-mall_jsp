<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% request.setCharacterEncoding("euc-kr"); %>
<%
String withdrawed_id=request.getParameter("withdrawed_user");
if(withdrawed_id.equals("manager")){
	out.print("������ ���̵�� ������ �� �����ϴ�.");
}
else{
String sql="DELETE FROM members WHERE id = ?";
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/odbo";
String username="root";
String password="0929";
Connection conn=null;
Class.forName(driverName);
conn=DriverManager.getConnection(url,username,password);

PreparedStatement sm=conn.prepareStatement(sql);
sm.setString(1,withdrawed_id);

int count=sm.executeUpdate();

if(count==1){
	out.print(withdrawed_id+"ȸ�� ���� Ż�� �Ϸ�");
}
else{
	out.print("���� ȸ�� Ż�� ����!");
}
sm.close();
conn.close();
}
%>
<br>
<a href='manager_page.jsp' style="background:yellow;">������ �������� ���ư���</a><br>