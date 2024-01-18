<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% request.setCharacterEncoding("euc-kr"); %>
<%

String u_id=(String)session.getAttribute("memberId");
if(u_id.equals("manager")){
	out.print("관리자 아이디는 삭제할 수 없습니다.<br>");
}{
String sql="DELETE FROM members WHERE id = ?";
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/odbo";
String username="root";
String password="0929";
Connection conn=null;
Class.forName(driverName);
conn=DriverManager.getConnection(url,username,password);

PreparedStatement sm=conn.prepareStatement(sql);
sm.setString(1,u_id);

int count=sm.executeUpdate();

if(count==1){
	out.print("회원 탈퇴 성공!");
}
else{
	out.print("회원 탈퇴 실패!");
}

sm.close();
conn.close();
}
%>
<br>
<a href='login.html' style="background:yellow;">로그인 화면으로 돌아가기</a><br>