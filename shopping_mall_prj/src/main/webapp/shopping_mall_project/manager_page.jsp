<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>manager_page</title>
<style>
            #manage_menu table{
            	border: 3px solid black;
            	float:left;
            }
            #manage_menu table tr td{
            	border: 3px solid black;
            }
            #manage_menu table tr td button:hover{
                background:beige;
            }
            #manage_menu table tr td button{
            	width:240px;
            	height:50.333px;
            	cursor:pointer;
            	vertical-align:middle;
            	font-size:20px;	
            }
            #manage_menu table img{
            	float:right;
            }
            #manage_content{
            	display:block;
            }
            #manage_content table{
            	border: 3px solid black;
             	text-align:center;
            }
            #manage_content table tr td{
            	border: 3px solid black;
            }
</style>   
</head>
<body>
<a href='products_list.jsp' style="background:yellow;">��ǰ ����Ʈ�� ���ư���</a><br>
<div>
		<nav id="manage_menu">
			<form>
            <table>
            	<tr>
                <th style="color:white; background:gray; ">���� ���&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/gear.png" height="40" width="40"></th>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="user_manage" onClick="location.href='manager_page.jsp'">ȸ�� ����&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/smile.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="forum_manage" onClick="location.href='manager_page.jsp'">�Խù� ����&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/talk.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="products_manage" onClick="location.href='manager_page.jsp'">��ǰ ������ ����&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/corn.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="order_manage" onClick="location.href='manager_page.jsp'">�ֹ� ����&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/box.png" height="40" width="40"></button></td>
                </tr>
			</table>
			</form>
        </nav>
        <section id="manage_content">
        <%String category=request.getParameter("category");
        	if(category==null)category="user_manage";
        	if(category.equals("user_manage")){
            out.print("<a href='manager_withdraw.jsp'>���� Ż�� ��Ű��</a>");
        	}
        	if(category.equals("forum_manage")){
            out.print("<a href='manager_forum_write.jsp'>�����ڿ� �Խù� �ۼ��ϱ�</a>&nbsp;&nbsp;&nbsp;");
            out.print("<a href='manager_forum_delete.jsp'>�Խù� �����ϱ�</a>");
        	}
            else if(category.equals("products_manage")){
                out.print("<a href='products_add.jsp'>��ǰ �߰��ϱ�</a>&nbsp;&nbsp;&nbsp;");
                out.print("<a href='products_delete.jsp'>��ǰ �����ϱ�</a>");
        	}
        	%>
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
	        	if(category.equals("user_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From members");
	        		str+="<thead><tr><th>���̵�</th><th>��й�ȣ</th><th>�̸�</th><th>�̸���</th><th>��ȭ��ȣ</th><th>�������</th><th>���Խð�</th><th>����Ʈ</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("passwd")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("mail")+"</td><td>"+rs.getString("phone_num")+"</td><td>"+rs.getString("birth_date")+"</td><td>"+rs.getString("signuptime")+"</td><td>"+rs.getString("point")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("forum_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From forum_post");
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
	        	else if(category.equals("products_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From products");
	        		str+="<thead><tr><th>��ǰ��ȣ</th><th>��ǰ�̸�</th><th>�Ǹ���</th><th>����</th><th>�̹��� ���</th><th>�з�</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getInt("price")+"</td><td>"+rs.getString("img_path")+"</td><td>"+rs.getString("category")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("order_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From orders natural join products");
	        		str+="<thead><tr><th>�ֹ���ȣ</th><th>������ id</th><th>��ǰ��ȣ</th><th>��ǰ��</th><th>�Ǹ���</th><th>������</th><th>���� ����</th><th>����</th><th>���� �ݾ�</th><th>�ֹ� �ð�</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("order_id")+"</td><td>"+rs.getString("user_id")+"</td><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("price")+"</td><td>"+rs.getInt("EA")+"</td><td>"+rs.getInt("total_price")+"</td><td>"+rs.getString("order_time")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
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