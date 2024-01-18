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
            <tr><td>제품 명:</td><td><input type="text" name="product_name"></td></tr>
            <tr><td>판매자:</td><td><input type="text" name="seller"></td></tr>
            <tr><td>가격:</td><td><input type="text" name="price"></td></tr>
            <tr><td>이미지 경로: (ex)images/fruits_3.jpg</td><td><input type="text" name="img_path"></td></tr>
            <tr><td>제품 카테고리<select name="category">
                <option>육류</option>
                <option>채소</option>
                <option>과일</option>
                <option>양념류</option>
                <option>유제품</option>
				<option>기타식품</option>
            </select></td></tr>
            </table>
            <button type="submit">등록하기</button>
        </form>
    </body>
</html>