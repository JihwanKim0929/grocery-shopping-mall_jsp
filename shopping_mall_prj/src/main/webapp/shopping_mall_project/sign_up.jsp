<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <% request.setCharacterEncoding("euc-kr"); %>
        <style>
            .warning{
                color:red;
            }
        </style>
    </head>
    <body>
            <form action="sign_up_process.jsp" method="post">
                <fieldset style="with:200px">
                회원가입<br><br>
        <center>
            아이디 입력 : <input type="text" name="userID"><br>
            비밀번호 입력 : <input type="text" name="userPW"><br><br>	
            이름 입력 : <input type="text" name="userNAME"><br><br>
            이메일 입력 : <input type="text" name="userMAIL"><br><br>
            출생 년<select name="birth_year">
                <script>
                    for(let i=1950;i<=2023;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            월<select name="birth_month">
                <script>
                    for(let i=1;i<=12;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            일<select name="birth_day">
                <script>
                    for(let i=1;i<=31;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            <br><br>
            휴대전화 번호 입력 : <input type="text" name="phone_number"><br><br>
            <button type="submit">가입하기</button>
        </fieldset>
        </form>
    </body>
</html>