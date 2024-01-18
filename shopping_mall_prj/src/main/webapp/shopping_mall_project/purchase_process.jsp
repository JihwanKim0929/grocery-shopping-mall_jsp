<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

String u_id=(String)session.getAttribute("memberId");
int product_num=Integer.parseInt(request.getParameter("deliver_product_num"));
String destination=request.getParameter("delivery");
int num=Integer.parseInt(request.getParameter("num"));
int total_price=Integer.parseInt(request.getParameter("deliver_total_price"));
int use_point=Integer.parseInt(request.getParameter("point"));
int deliver_user_point=Integer.parseInt(request.getParameter("deliver_user_point"));
int deliver_get_point=Integer.parseInt(request.getParameter("deliver_get_point")); 


 if(deliver_user_point<use_point){
	out.println("보유 포인트가 사용하시려는 포인트보다 적습니다.<br>");
	out.println("보유 포인트:"+deliver_user_point+"<br>");
	out.println("사용요청 포인트:"+use_point+"<br>");
}
else{
total_price-=use_point;
String sql="insert into orders(user_id,product_num,destination,EA,total_price) values ";
sql+="('"+u_id+"','"+product_num+"','"+destination+"','"+num+"','"+total_price+"')";
int count=sm.executeUpdate(sql);
if(count==1){
	out.println("구매 완료!!<br>");
	out.println("상품번호:"+product_num+"<br>");
	out.println("배송지:"+destination+"<br>");
	out.println("구매수량:"+num+"<br>");
	out.println("총 결제금액:"+total_price+"<br>");
	out.println("적립 포인트:"+deliver_get_point+"<br>");
	
	int final_user_point=deliver_user_point-use_point+deliver_get_point;
	sql="UPDATE members SET point="+final_user_point;
	sql+=" WHERE id='"+u_id+"'";
	sm.executeUpdate(sql);
	
}else{
	out.println("구매 실패!<br>");
}
}
out.println("<a href='products_list.jsp'>상품 리스트로 돌아가기</a>");
sm.close();
conn.close(); 
%>
</body>
</html>