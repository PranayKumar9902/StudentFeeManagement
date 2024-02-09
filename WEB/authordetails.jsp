
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NEW AUTHOR</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: lightgreen;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #333333;
                text-align: center;
                background-color: #ffb6c1; /* Light Pink */
                padding: 10px;
                border-radius: 8px;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #add8e6; /* Light Blue */
                color: #ffffff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #87bce8; /* Slightly darker shade of blue on hover */
            }
        </style>
    </head>
    <body>
        <%
            HttpSession ses = request.getSession();
            if(ses.getAttribute("uname") == null){
                response.sendRedirect("login.jsp");
            }
        %>
        <form action="add" method="post">
            <h1>ADD NEW AUTHOR</h1>
            Enter UserName : <input type="text" name="uname">
            Enter PassWord : <input type="password" name="pass"> <!-- Use type="password" for passwords -->
            <input type="submit" value="ADD">
        </form>
    </body>
</html>

