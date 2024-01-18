<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ page import="java.sql.*" %>
<!DOCTYPE html>	<!--�α��ν� ������, ī�װ� ���ý� ī�װ� �� �Ѱ� �޾� db���� ��ǰ��Ϲޱ�, �α��ν� ȸ������ Ȯ�� �� �Ѱ��ִ� ������ �ۼ� -->
<html>
    <head>
        <title>product_list_page</title>
        <style>
            #menubar table{
            	background:lawngreen;
                margin:0;
                padding:0;
                width:100%;
                height:50px;
            }
            /* #menubar table tr td{
                width:300px;
            } */
            #menubar table tr td button{
            	width:200px;
            	text-align:center;
            	color:white;
                border: 2px solid black;
                cursor:pointer;
                font-size:25px;
                background:lawngreen;
            }
            #menubar table tr td button:hover{
                background:green;
            }
            #menubar img{
                float:left;
            }
            #product_list table{
            margin-left:auto;
            margin-right:auto;
            border-spacing:20px;
            }
            #product_list table tr td button{
            padding:38px;
			cursor:pointer;
			background:white;
            }
            #product_list table tr td button:hover{
			background:lightgray;
            }
            #product_list table tr td button img{
            height:200px;
            width:200px;
            }
            #product_list table tr td button div{
            text-align:center;
            }
        </style>
        <script>
        function change(obj){
        	let hi=document.getElementById("hi");
        	hi.value=obj.value;
        }
        </script>
    </head>
    <body>
    <a href="forum_list.jsp;" style="background:yellow;">�Խ������� �̵�</a>
    <%
	String u_id=(String)session.getAttribute("memberId");
	String u_pw=(String)session.getAttribute("memberPw");
	String u_name=(String)session.getAttribute("memberName");
	
	if(u_id.equals("manager")){
		out.println("&nbsp;&nbsp;&nbsp;<a href='manager_page.jsp;'>������ �������� �̵�</a>");
	}
	%>
	<div style="float:right;"><strong><%= u_name %></strong> ���� ȯ���մϴ�!&nbsp;&nbsp;<button type="button" onclick="location.href='user_page.jsp'">����������</button>&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='logout_process.jsp'">Logout</button></div>
        <nav id="menubar">
        <form>
            <table>
            	<tr>
                <td><button type="submit" name="category" value="meat" onClick="location.href='products_list.jsp'"><img src="images/meat.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;����</button></td>
        		<td><button type="submit" name="category" value="vegetable" onClick="location.href='products_list.jsp'"><img src="images/vegetable.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;ä��</button></td>
        		<td><button type="submit" name="category" value="fruits" onClick="location.href='products_list.jsp'"><img src="images/fruits.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;����</button></td>
				<td><button type="submit" name="category" value="seasoning" onClick="location.href='products_list.jsp'"><img src="images/seasoning.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;����</button></td>
        		<td><button type="submit" name="category" value="milk" onClick="location.href='products_list.jsp'"><img src="images/dairy-products.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;����ǰ</button></td>
        		<td><button type="submit" name="category" value="etc" onClick="location.href='products_list.jsp'"><img src="images/hot-pot.png" height="40" width="40">&nbsp;&nbsp;&nbsp;&nbsp;��Ÿ��ǰ</button></td>
                </tr>
			</table>
			</form>
        </nav>
        
        <br><br><br>

        <section id="product_list">
        <%String category=request.getParameter("category");
          if(category==null)category="meat";
        %>
        <form action="product_info.jsp">
        <table>
        	<caption style="font-size:25px; text-align:left;"><%=category%></caption>
        	<%
        	String driverName="com.mysql.jdbc.Driver";
        	String url="jdbc:mysql://localhost:3306/odbo";
        	String username="root";
        	String password="0929";
        	Connection conn=null;

        	Class.forName(driverName);
        	conn=DriverManager.getConnection(url,username,password);
        	Statement sm=conn.createStatement();
        	String str="";
        	if(category!=null){
	        		ResultSet rs=sm.executeQuery("SELECT * From products where category='"+category+"'");
	        		int i=0;
	        		while(rs.next()){
	        			if(i%4==0) str+="<tr>";
	        			str+="<td><button type='submit' name='product' value='"+rs.getInt("product_num")+"' onClick='change(this);'>"+"<img src='"+rs.getString("img_path")+"'>"+
	        					"<div>"+rs.getString("product_name")+"</div>"+"<div>"+rs.getInt("price")+"</div>"+"<div>"+rs.getString("seller")+"</div></button></td>";
	        			if(i%4==3) str+="</tr>";
	        			i++;
	        		}
	        		str+="</tr>";
	        		out.print(str);
        	}
        	else{
        		out.print("�޴����� ī�װ��� �����ϼ���");
        	}
        	sm.close();
        	conn.close();
        	%>
        </table>
        <input type="hidden" value="" name="inputValue" id="hi">
		</form>
        </section>       
    </body>
</html>