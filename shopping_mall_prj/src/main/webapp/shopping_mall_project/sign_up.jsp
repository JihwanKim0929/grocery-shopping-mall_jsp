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
                ȸ������<br><br>
        <center>
            ���̵� �Է� : <input type="text" name="userID"><br>
            ��й�ȣ �Է� : <input type="text" name="userPW"><br><br>	
            �̸� �Է� : <input type="text" name="userNAME"><br><br>
            �̸��� �Է� : <input type="text" name="userMAIL"><br><br>
            ��� ��<select name="birth_year">
                <script>
                    for(let i=1950;i<=2023;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            ��<select name="birth_month">
                <script>
                    for(let i=1;i<=12;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            ��<select name="birth_day">
                <script>
                    for(let i=1;i<=31;i++){
                        document.write("<option>"+i+"</option>");
                    }
                </script>
            </select>
            <br><br>
            �޴���ȭ ��ȣ �Է� : <input type="text" name="phone_number"><br><br>
            <button type="submit">�����ϱ�</button>
        </fieldset>
        </form>
    </body>
</html>