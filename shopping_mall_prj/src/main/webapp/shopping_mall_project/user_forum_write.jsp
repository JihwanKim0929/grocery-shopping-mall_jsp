<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <% request.setCharacterEncoding("euc-kr"); %>
    </head>
    <body>
            <form action="user_post_up_process.jsp" method="post">
            �Խù� ī�װ�<select name="category">
                <option>Q&A</option>
                <option>�����Խ���</option>
            </select><br>
            ���� �Է� : <input type="text" name="title"><br>
            ���� �Է� : <br><textarea cols="40" rows="20" name="content"></textarea><br><br>
            <button type="submit">�ۼ��ϱ�</button>
        </form>
    </body>
</html>