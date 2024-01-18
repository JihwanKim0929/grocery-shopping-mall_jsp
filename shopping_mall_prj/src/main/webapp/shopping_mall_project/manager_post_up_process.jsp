<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <% request.setCharacterEncoding("euc-kr"); %>
    <%
    
    String title=request.getParameter("title");
    String content=request.getParameter("content");
	String category=request.getParameter("category");
    if(category.equals("공지사항")){
    	category="announcement";
    }
    else if(category.equals("이벤트")){
    	category="event";
    }
    else if(category.equals("자유게시판")){
    	category="free";
    }
    
	String driverName="com.mysql.jdbc.Driver";
    String sql="INSERT INTO forum_post(title, writer, content, category) VALUES";
    sql+="('"+title+"','manager','"+content+"','"+category+"')";
    String url="jdbc:mysql://localhost:3306/odbo";
    String username="root";
    String password="0929";
    Connection conn=null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url,username,password);
    Statement sm=conn.createStatement();
    int count=sm.executeUpdate(sql);
    if(count==1){
    	out.println("작성완료!!<br>");
    }else{
    	out.println("작성 실패!<br>");
    }
	
    sm.close();
    conn.close();
    %>
    <br>
	<button type="button" onclick="location.href='manager_page.jsp'">관리 페이지로</button>