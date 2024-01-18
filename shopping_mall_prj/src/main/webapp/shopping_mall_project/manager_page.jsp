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
<a href='products_list.jsp' style="background:yellow;">상품 리스트로 돌아가기</a><br>
<div>
		<nav id="manage_menu">
			<form>
            <table>
            	<tr>
                <th style="color:white; background:gray; ">관리 기능&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/gear.png" height="40" width="40"></th>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="user_manage" onClick="location.href='manager_page.jsp'">회원 관리&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/smile.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="forum_manage" onClick="location.href='manager_page.jsp'">게시물 관리&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/talk.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="products_manage" onClick="location.href='manager_page.jsp'">상품 페이지 관리&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/corn.png" height="40" width="40"></button></td>
                </tr>
                <tr>
                <td><button type="submit" name="category" value="order_manage" onClick="location.href='manager_page.jsp'">주문 관리&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/box.png" height="40" width="40"></button></td>
                </tr>
			</table>
			</form>
        </nav>
        <section id="manage_content">
        <%String category=request.getParameter("category");
        	if(category==null)category="user_manage";
        	if(category.equals("user_manage")){
            out.print("<a href='manager_withdraw.jsp'>강제 탈퇴 시키기</a>");
        	}
        	if(category.equals("forum_manage")){
            out.print("<a href='manager_forum_write.jsp'>관리자용 게시물 작성하기</a>&nbsp;&nbsp;&nbsp;");
            out.print("<a href='manager_forum_delete.jsp'>게시물 삭제하기</a>");
        	}
            else if(category.equals("products_manage")){
                out.print("<a href='products_add.jsp'>상품 추가하기</a>&nbsp;&nbsp;&nbsp;");
                out.print("<a href='products_delete.jsp'>상품 삭제하기</a>");
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
	        		str+="<thead><tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>생년월일</th><th>가입시각</th><th>포인트</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("passwd")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("mail")+"</td><td>"+rs.getString("phone_num")+"</td><td>"+rs.getString("birth_date")+"</td><td>"+rs.getString("signuptime")+"</td><td>"+rs.getString("point")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("forum_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From forum_post");
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
	        	else if(category.equals("products_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From products");
	        		str+="<thead><tr><th>상품번호</th><th>상품이름</th><th>판매자</th><th>가격</th><th>이미지 경로</th><th>분류</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getInt("price")+"</td><td>"+rs.getString("img_path")+"</td><td>"+rs.getString("category")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
	        	}
	        	else if(category.equals("order_manage")){	
	        		ResultSet rs=sm.executeQuery("SELECT * From orders natural join products");
	        		str+="<thead><tr><th>주문번호</th><th>구매자 id</th><th>상품번호</th><th>상품명</th><th>판매자</th><th>목적지</th><th>개당 가격</th><th>수량</th><th>결제 금액</th><th>주문 시간</th></tr></thead>";
	        		str+="<tbody>";
	        		while(rs.next()){
	        			str+="<tr><td>"+rs.getInt("order_id")+"</td><td>"+rs.getString("user_id")+"</td><td>"+rs.getInt("product_num")+"</td><td>"+rs.getString("product_name")+"</td><td>"+rs.getString("seller")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("price")+"</td><td>"+rs.getInt("EA")+"</td><td>"+rs.getInt("total_price")+"</td><td>"+rs.getString("order_time")+"</td></tr>";
	        		}
	        		str+="</tbody>";
	        		out.print(str);
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