<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <% request.setCharacterEncoding("euc-kr"); %>
    </head>
    <body>
            <form action="products_delete_process.jsp" method="post">
            <table>
            <tr><td>삭제 할 상품 번호를 입력하세요:</td><td><input type="text" name="product_num"></td></tr>
            </table>
            <button type="submit">삭제 하기</button>
        </form>
    </body>
</html>