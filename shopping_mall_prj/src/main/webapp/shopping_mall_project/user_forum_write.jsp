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
            게시물 카테고리<select name="category">
                <option>Q&A</option>
                <option>자유게시판</option>
            </select><br>
            제목 입력 : <input type="text" name="title"><br>
            내용 입력 : <br><textarea cols="40" rows="20" name="content"></textarea><br><br>
            <button type="submit">작성하기</button>
        </form>
    </body>
</html>