<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forum_list</title>
<style>
            #forum_menu table{
            	border: 3px solid black;
            	float:left;
            }
            #forum_menu table tr td{
            	border: 3px solid black;
            }
            #forum_menu table tr td button:hover{
                background:beige;
            }
            #forum_menu table tr td button{
            	width:222.188px;
            	height:50.333px;
            	cursor:pointer;
            	vertical-align:middle;
            	font-size:20px;	
            }
            #forum_menu table img{
            	float:right;
            }
            #forum_content{
            	display:block;
            }
            #forum_content table{
            	border: 3px solid black;
            }
            #forum_content table tr td{
            	border: 3px solid black;
            	text-align:center;
            }
            #forum_content table tr td button{
            	cursor:pointer;
            	background:yellow;	
            }
</style>   
<script>
function change(obj){
	let hid=document.getElementById("hid");
	hid.value=obj.value;
}
</script>
</head>
<body>
<a href="products_list.jsp;">��ǰ����Ʈ�� ���ư���</a>
<div>
		<nav id="forum_menu">
			<form>
            <table>
            	<tr>
                <th style="color:white; background:green;">ī�װ�</th>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="announcement" onClick="location.href='forum_list.jsp'">��������</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="event" onClick="location.href='forum_list.jsp'">�̺�Ʈ</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="Q&A" onClick="location.href='forum_list.jsp'">Q&A</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="free" onClick="location.href='forum_list.jsp'">�����Խ���</button></td>
                </tr>
			</table>
			</form>
        </nav>
        <section id="forum_content">
        <%String category=request.getParameter("category");
          if (category==null) category="free";
        %>
        <form action="post_info.jsp">
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
        		ResultSet rs=sm.executeQuery("SELECT * From forum_post where category='"+category+"'");
        		str+="<thead><tr><th>�Խù� ��ȣ</th><th>����</th><th>�ۼ���</th><th>�ۼ���</th></tr></thead>";
        		str+="<tbody>";
        		while(rs.next()){
        			str+="<tr><td>"+rs.getInt("post_num")+"</td><td><button type='submit' name='post' value='"
        		+rs.getInt("post_num")+"' onClick='change(this);'>"+rs.getString("title")+"</button></td><td>"+
        			rs.getString("writer")+"</td><td>"+rs.getString("write_time")+"</td></tr>";
        		}
        		str+="</tbody></table>";
        		out.print(str);
        		
        		if(category.equals("free")||category.equals("Q&A")){
            		out.print("<a href='user_forum_write.jsp'>�� ����</a> ");
            	}
        	}
        	else{
        		out.print("�޴����� ī�װ��� �����ϼ���");
        	}
        	
        	
        	%>
        </table>
        <input type="hidden" value="" id="hid" name="post_num">
        </form>
        </section>
</div> 
</body>
</html>