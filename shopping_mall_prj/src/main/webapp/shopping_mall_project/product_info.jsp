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
			String product_num=request.getParameter("inputValue");
			
        	String driverName="com.mysql.jdbc.Driver";
        	String url="jdbc:mysql://localhost:3306/odbo";
        	String username="root";
        	String password="0929";
        	Connection conn=null;
			
        	Class.forName(driverName);
        	conn=DriverManager.getConnection(url,username,password);
        	Statement sm=conn.createStatement();
          	ResultSet rs=sm.executeQuery("SELECT * From products where product_num="+product_num);
        	rs.next();
        	String product_name=rs.getString("product_name");
        	int price=rs.getInt("price");
        	String seller=rs.getString("seller"); 
        	%>
 <h2><%=product_name%></h2>
<hr>
<img id="main_img" src="<%=rs.getString("img_path") %>" style="float:left; width="300" height="400">
<table id="info" style="display:inline-block; ">
<tr>
<td>상품명</td>
<td><%=product_name%></td>
</tr>
<tr>
<td>가격</td>
<td><%=price%>원</td>
</tr>
<tr>
<td>판매자</td>
<td><%=seller%></td>
</tr>
<tr>
<td>배송비</td>
<td>2500원</td>
</tr>
<tr>
<td>상품번호</td>
<td><%=product_num%></td>
</tr>
</table>
<hr>
<%
rs=sm.executeQuery("SELECT * FROM members WHERE id='"+(String)session.getAttribute("memberId")+"'");
rs.next();
int point=rs.getInt("point");
%>
<script>
function change(obj){
	let products_cost=document.getElementById("products_cost");
	let total_cost=document.getElementById("total_cost");
	let get_point=document.getElementById("get_point");
	let num=obj.value;
	products_cost.innerHTML=<%=price%>*num;
	total_cost.innerHTML=<%=price%>*num+2500;
	get_point.innerHTML=Math.round((<%=price%>*num+2500)*0.07);
}

function changeHidden(){
	let deliver_total_price=document.getElementById("deliver_total_price");
	let deliver_product_num=document.getElementById("deliver_product_num");
	let deliver_user_point=document.getElementById("deliver_user_point");
	let deliver_get_point=document.getElementById("deliver_get_point");
	deliver_total_price.value=document.getElementById("total_cost").innerText;
	deliver_product_num.value=<%=product_num%>;
	deliver_user_point.value=<%=point%>;
	deliver_get_point.value=document.getElementById("get_point").innerText;
}

</script>
<form action="purchase_process.jsp" method="Post">
주문수량<input type="number" min="1" max="99" step="1" value="1" name="num" onclick="change(this)"><br>
배송지 입력 : <input type="text" name="delivery"><br>
현재 포인트 : <%=point %>원<br>
포인트 사용 : <input type="text" name="point" value="0"></input><br>
가격 : <div id="products_cost" style="display:inline-block;"><%=price%></div>원
<div>배송비 : 2500원</div>
총 결제 금액 : <div id="total_cost" style="display:inline-block;"><%=price+2500%></div>원<br>
적립 포인트 : <div id="get_point" style="display:inline-block;"><%=Math.round((price+2500)*0.07)%></div>원<br>
<input type="hidden" value="0" id="deliver_total_price" name="deliver_total_price">
<input type="hidden" value="0" id="deliver_product_num" name="deliver_product_num">
<input type="hidden" value="0" id="deliver_user_point" name="deliver_user_point">
<input type="hidden" value="0" id="deliver_get_point" name="deliver_get_point">
<input type="submit" value="구매하기" onclick="changeHidden()">
</form>
</body>
</html>