<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>manager_page</title>
<style>
            #user_menu table{
            	border: 3px solid black;
            	float:left;
            }
            #user_menu table tr td{
            	border: 3px solid black;
            }
            #user_menu table tr td button:hover{
                background:beige;
            }
            #user_menu table tr td button{
            	width:222.188px;
            	height:50.333px;
            	cursor:pointer;
            	vertical-align:middle;
            	font-size:20px;	
            }
            #user_menu table img{
            	float:right;
            }
            #mypage_content{
            	display:block;
            }
            #mypage_content table{
            	border: 3px solid black;
            	text-align:center;
            }
            #mypage_content table tr td{
            	border: 3px solid black;
            }
</style>   
</head>
<body>
<a href='products_list.jsp' style="background:yellow;">��ǰ ����Ʈ�� ���ư���</a><br>
<div>
		<nav id="user_menu">
			<form>
            <table>
            	<tr>
                <th style="color:white; background:blue; ">����������&nbsp;&nbsp;&nbsp;&nbsp;</th>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_information" onClick="location.href='user_page.jsp'">�� ����</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_orders" onClick="location.href='user_page.jsp'">�� �ֹ� ���</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_forum_posts" onClick="location.href='user_page.jsp'">�� �Խù�</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="withdraw" onClick="location.href='user_page.jsp'">ȸ��Ż��</button></td>
                </tr>
			</table>
			</form>
        </nav>
        <section id="mypage_content">
        <%String category=request.getParameter("category");
        	if(category==null)category="my_information";
        	%>
        <table>
        	<caption style="font-size:25px; text-align:left;"><%=category%></caption>
        	<%
        	String u_id=(String)session.getAttribute("memberId");
        	
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
	        	if(category.equals("my_information")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From members where id='"+u_id+"'");
	        		str+="<thead><tr><th>���̵�</th><th>��й�ȣ</th><th>�̸�</th><th>�̸���</th><th>��ȭ��ȣ</th><th>�������</th><th>���Խð�</th><th>����Ʈ</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("passwd")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("mail")+"</td><td>"+rs.getString("phone_num")+"</td><td>"+rs.getString("birth_date")+"</td><td>"+rs.getString("signuptime")+"</td><td>"+rs.getString("point")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("my_orders")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From orders natural join products where user_id='"+u_id+"'");
	        		str+="<thead><tr><th>�ֹ���ȣ</th><th>������ id</th><th>��ǰ��ȣ</th><th>��ǰ��</th><th>�Ǹ���</th><th>������</th><th>���� ����</th><th>����</th><th>���� �ݾ�</th><th>�ֹ� �ð�</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("order_id")+"</td><td>"+rs.getString("user_id")+"</td><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("price")+"</td><td>"+rs.getInt("EA")+"</td><td>"+rs.getInt("total_price")+"</td><td>"+rs.getString("order_time")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("my_forum_posts")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From forum_post where writer='"+u_id+"'");
	        		str+="<thead><tr><th>�Խù� ��ȣ</th><th>����</th><th>�ۼ���</th><th>�ۼ���</th><th>ī�װ�</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("post_num")+"</td><td>"+rs.getString("title")+"</td><td>"+rs.getString("writer")+"</td><td>"+rs.getString("write_time")+"</td><td>";
	        			if(rs.getString("category").equals("announcement")){
	        				str+="��������";
	        			}
	        			else if(rs.getString("category").equals("event")){
	        				str+="�̺�Ʈ";
	        			}
	        			else if(rs.getString("category").equals("Q&A")){
	        				str+="Q&A";
	        			}
	        			else if(rs.getString("category").equals("free")){
	        				str+="���� �Խ���";
	        			}
	        			str+="</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("withdraw")){	
	        		out.print("<tr><td>"+"������ Ż�� �Ͻðڽ��ϱ�?"+"</td></tr><tr><td><a style='font-size:x-large;' href='withdraw_process.jsp'>yes</a></td></tr>");
	        	}
        	}
        	else{
        		out.print("�޴����� ���� �׸��� �����ϼ���");
        	}
        	%>
        </table>
        </section>
</div> 
</body>
</html>