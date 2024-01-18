<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% request.setCharacterEncoding("euc-kr"); %>
<%
String product_num=request.getParameter("product_num");

String sql="DELETE FROM products WHERE product_num = ?";
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/odbo";
String username="root";
String password="0929";
Connection conn=null;
Class.forName(driverName);
conn=DriverManager.getConnection(url,username,password);

PreparedStatement sm=conn.prepareStatement(sql);
sm.setString(1,product_num);

int count=sm.executeUpdate();

if(count==1){
	out.print(product_num+"번 상품 삭제 완료!");
}
else{
	out.print(product_num+"번 상품 삭제 실패!");
}
sm.close();
conn.close();

%>
<br>
<a href='manager_page.jsp' style="background:yellow;">관리자 페이지로 돌아가기</a><br>