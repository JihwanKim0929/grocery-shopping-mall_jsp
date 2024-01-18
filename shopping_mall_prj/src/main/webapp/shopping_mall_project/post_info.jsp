<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>product_info_page</title>
<style>
	#info tr td{
	border: 2px solid black;
	text-align:center;
	}
</style>
</head>
<body>
<a href="javascript:window.history.back();">뒤로가기</a>
<%			
			int post_num=Integer.parseInt(request.getParameter("post_num"));
			
        	String driverName="com.mysql.jdbc.Driver";
        	String url="jdbc:mysql://localhost:3306/odbo";
        	String username="root";
        	String password="0929";
        	Connection conn=null;
			
        	Class.forName(driverName);
        	conn=DriverManager.getConnection(url,username,password);
        	Statement sm=conn.createStatement();
          	ResultSet rs=sm.executeQuery("SELECT * From forum_post where post_num="+post_num);
        	rs.next();
        	String title=rs.getString("title");
        	String writer=rs.getString("writer");
        	String content=rs.getString("content");
        	String write_time=rs.getString("write_time");
        	String category=rs.getString("category");
        	if(category.equals("announcement")){
        		category="공지사항";
			}
			else if(category.equals("event")){
				category="이벤트";
			}
			else if(category.equals("Q&A")){
				category="Q&A";
			}
			else if(category.equals("free")){
				category="자유 게시판";
			}
        	%>
 <h2><%=title%></h2>
<hr>
<table id="info" style="display:inline-block; ">
<tr>
<td>작성자</td>
<td><%=writer%></td>
</tr>
<tr>
<td>작성 시간</td>
<td><%=write_time%></td>
</tr>
<tr>
<td>카테고리</td>
<td><%=category%></td>
</tr>
</table>
<div>
<strong style="color:blue;">내용</strong><br>
<%=content%>
</div>
</body>
</html>