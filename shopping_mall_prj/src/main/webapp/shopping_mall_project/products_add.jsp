<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <% request.setCharacterEncoding("euc-kr"); %>
    </head>
    <body>
            <form action="products_add_process.jsp" method="post">
            <table>
            <tr><td>��ǰ ��:</td><td><input type="text" name="product_name"></td></tr>
            <tr><td>�Ǹ���:</td><td><input type="text" name="seller"></td></tr>
            <tr><td>����:</td><td><input type="text" name="price"></td></tr>
            <tr><td>�̹��� ���: (ex)images/fruits_3.jpg</td><td><input type="text" name="img_path"></td></tr>
            <tr><td>��ǰ ī�װ�<select name="category">
                <option>����</option>
                <option>ä��</option>
                <option>����</option>
                <option>����</option>
                <option>����ǰ</option>
				<option>��Ÿ��ǰ</option>
            </select></td></tr>
            </table>
            <button type="submit">����ϱ�</button>
        </form>
    </body>
</html>