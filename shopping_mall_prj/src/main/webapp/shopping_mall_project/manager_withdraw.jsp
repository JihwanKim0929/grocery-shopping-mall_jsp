<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <% request.setCharacterEncoding("euc-kr"); %>
    </head>
    <body>
            <form action="manager_withdraw_process.jsp" method="post">
            <table>
            <tr><td>���� �� ������� id�� �Է��ϼ���:</td><td><input type="text" name="withdrawed_user"></td></tr>
            </table>
            <button type="submit">���� Ż�� ��Ű��</button>
        </form>
    </body>
</html>