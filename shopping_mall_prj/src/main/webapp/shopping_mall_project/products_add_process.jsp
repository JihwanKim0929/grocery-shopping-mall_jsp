<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <% request.setCharacterEncoding("euc-kr"); %>
    <%
    
    String product_name=request.getParameter("product_name");
    String seller=request.getParameter("seller");    
    int price=Integer.parseInt(request.getParameter("price"));
    String img_path=request.getParameter("img_path");
    String category=request.getParameter("category");
    if(category.equals("����")){
    	category="meat";
    }
    else if(category.equals("ä��")){
    	category="vegetable";
    }
    else if(category.equals("����")){
    	category="fruits";
    }
    else if(category.equals("����")){
    	category="seasoning";
    }
    else if(category.equals("����ǰ")){
    	category="milk";
    }
    else if(category.equals("��Ÿ��ǰ")){
    	category="etc";
    }
    
	String driverName="com.mysql.jdbc.Driver";
    String sql="INSERT INTO products(product_name, seller, price, img_path, category) VALUES";
    sql+="('"+product_name+"','"+seller+"','"+price+"','"+img_path+"','"+category+"')";
    String url="jdbc:mysql://localhost:3306/odbo";
    String username="root";
    String password="0929";
    Connection conn=null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url,username,password);
    Statement sm=conn.createStatement();

    int count=sm.executeUpdate(sql);
    if(count==1){
    	out.println("��ǰ ��� ����!<br>");
    }else{
    	out.println("��� ����!");
    }
	out.println("<a href='manager_page.jsp' style='background:yellow;'>������ �������� �̵�</a>");
    sm.close();
    conn.close();
    %>
    <br>