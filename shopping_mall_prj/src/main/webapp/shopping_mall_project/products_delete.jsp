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
            <tr><td>���� �� ��ǰ ��ȣ�� �Է��ϼ���:</td><td><input type="text" name="product_num"></td></tr>
            </table>
            <button type="submit">���� �ϱ�</button>
        </form>
    </body>
</html>