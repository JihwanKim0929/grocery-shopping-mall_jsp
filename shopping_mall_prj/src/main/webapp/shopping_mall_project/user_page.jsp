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
<a href='products_list.jsp' style="background:yellow;">상품 리스트로 돌아가기</a><br>
<div>
		<nav id="user_menu">
			<form>
            <table>
            	<tr>
                <th style="color:white; background:blue; ">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</th>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_information" onClick="location.href='user_page.jsp'">내 정보</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_orders" onClick="location.href='user_page.jsp'">내 주문 목록</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="my_forum_posts" onClick="location.href='user_page.jsp'">내 게시물</button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="withdraw" onClick="location.href='user_page.jsp'">회원탈퇴</button></td>
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
	        		str+="<thead><tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>생년월일</th><th>가입시각</th><th>포인트</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("passwd")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("mail")+"</td><td>"+rs.getString("phone_num")+"</td><td>"+rs.getString("birth_date")+"</td><td>"+rs.getString("signuptime")+"</td><td>"+rs.getString("point")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("my_orders")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From orders natural join products where user_id='"+u_id+"'");
	        		str+="<thead><tr><th>주문번호</th><th>구매자 id</th><th>상품번호</th><th>상품명</th><th>판매자</th><th>목적지</th><th>개당 가격</th><th>수량</th><th>결제 금액</th><th>주문 시간</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("order_id")+"</td><td>"+rs.getString("user_id")+"</td><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("price")+"</td><td>"+rs.getInt("EA")+"</td><td>"+rs.getInt("total_price")+"</td><td>"+rs.getString("order_time")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("my_forum_posts")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From forum_post where writer='"+u_id+"'");
	        		str+="<thead><tr><th>게시물 번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>카테고리</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("post_num")+"</td><td>"+rs.getString("title")+"</td><td>"+rs.getString("writer")+"</td><td>"+rs.getString("write_time")+"</td><td>";
	        			if(rs.getString("category").equals("announcement")){
	        				str+="공지사항";
	        			}
	        			else if(rs.getString("category").equals("event")){
	        				str+="이벤트";
	        			}
	        			else if(rs.getString("category").equals("Q&A")){
	        				str+="Q&A";
	        			}
	        			else if(rs.getString("category").equals("free")){
	        				str+="자유 게시판";
	        			}
	        			str+="</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("withdraw")){	
	        		out.print("<tr><td>"+"정말로 탈퇴 하시겠습니까?"+"</td></tr><tr><td><a style='font-size:x-large;' href='withdraw_process.jsp'>yes</a></td></tr>");
	        	}
        	}
        	else{
        		out.print("메뉴에서 관리 항목을 선택하세요");
        	}
        	%>
        </table>
        </section>
</div> 
</body>
</html>