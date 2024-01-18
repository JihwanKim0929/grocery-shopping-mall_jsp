<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% request.setCharacterEncoding("euc-kr"); %>
<%
String withdrawed_id=request.getParameter("withdrawed_user");
if(withdrawed_id.equals("manager")){
	out.print("관리자 아이디는 삭제할 수 없습니다.");
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
	out.print(withdrawed_id+"회원 강제 탈퇴 완료");
}
else{
	out.print("강제 회원 탈퇴 실패!");
}
sm.close();
conn.close();
}
%>
<br>
<a href='manager_page.jsp' style="background:yellow;">관리자 페이지로 돌아가기</a><br>