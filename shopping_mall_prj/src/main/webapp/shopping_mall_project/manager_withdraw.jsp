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
            <tr><td>삭제 할 사용자의 id를 입력하세요:</td><td><input type="text" name="withdrawed_user"></td></tr>
            </table>
            <button type="submit">강제 탈퇴 시키기</button>
        </form>
    </body>
</html>