<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <% request.setCharacterEncoding("euc-kr"); %>
    <%
    
    String u_id=request.getParameter("userID");
    String u_pw=request.getParameter("userPW");
    String u_name=request.getParameter("userNAME");
    String u_mail=request.getParameter("userMAIL");
    String u_phone_num=request.getParameter("phone_number");
    
    //������� yyyy-mm-dd ���·� ����
    String u_birth_year=request.getParameter("birth_year");
    String u_birth_month=request.getParameter("birth_month");
    String u_birth_day=request.getParameter("birth_day");
    String u_birth_date=u_birth_year+"-";
    if(u_birth_month.length()==1){
    	u_birth_date+="0";
    }
    u_birth_date+=u_birth_month+"-";
    if(u_birth_day.length()==1){
    	u_birth_date+="0";
    }
    u_birth_date+=u_birth_day;
    
    
	String driverName="com.mysql.jdbc.Driver";
    String sql="INSERT INTO members(id, passwd, name, mail, phone_num, birth_date) VALUES";
    sql+="('"+u_id+"','"+u_pw+"','"+u_name+"','"+u_mail+"','"+u_phone_num+"','"+u_birth_date+"')";
    String url="jdbc:mysql://localhost:3306/odbo";
    String username="root";
    String password="0929";
    Connection conn=null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url,username,password);
    Statement sm=conn.createStatement();
    try{
    int count=sm.executeUpdate(sql);
    if(count==1){
    	out.println("ȸ�� ���� ����!<br>");
    	out.println(u_name+"ȸ���� ������ ���ϵ帳�ϴ�!");
    }else{
    	out.println("ȸ�� ���� ����!");
    }}
    catch(SQLIntegrityConstraintViolationException e){
    	out.println("ȸ�� ���� ����! �ߺ� ���̵� ����!");
    }
	
    sm.close();
    conn.close();
    %>
    <br>
	<button type="button" onclick="location.href='login.html'">�α��� ȭ������</button>