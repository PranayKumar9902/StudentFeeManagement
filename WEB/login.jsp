<%-- 
    Document   : login
    Created on : 5 Feb, 2024, 5:27:29 PM
    Author     : TR080124021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Author</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: yellowgreen;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #333333;
                text-align: center;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #ffffff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <form action="login" method="post">
            <h1>AUTHOR AUTHENTICATION</h1>
            Enter UserName : <input type="text" name="uname">
            Enter PassWord : <input type="password" name="pass"> <!-- Use type="password" for passwords -->
            <input type="submit" value="ENTER">
            
            <%
                
            %>
        </form>
    </body>
</html>

