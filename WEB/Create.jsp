
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <title>CREATE</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: yellowgreen;
                color: #fff;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            form {
                background-color: #1e2229;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
                width: 400px;
                margin-bottom: 20px;
                text-align: center;
            }

            label {
                font-weight: bold;
                font-size: 16px;
                display: block;
                margin-bottom: 10px;
                color: #3498db;
            }

            input[type="text"] {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                box-sizing: border-box;
                border: 1px solid #3498db;
                border-radius: 8px;
                background-color: #2c3e50;
                color: #ecf0f1;
            }

            input[type="submit"] {
                background-color: #27ae60;
                color: #fff;
                padding: 15px 30px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s ease-in-out;
            }

            input[type="submit"]:hover {
                background-color: #219653;
            }

            #add, #View, #pay {
                background-color: #e74c3c;
                color: #fff;
                padding: 15px 30px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 18px;
                margin-top: 20px;
                transition: background-color 0.3s ease-in-out;
            }

            #add:hover, #View:hover, #pay:hover {
                background-color: #c0392b;
            }
        </style>

    </head>
    <body>

        <%
            HttpSession ses = request.getSession();
            if (ses.getAttribute("uname") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <form action="create" method="post">
            
                <label for="firstname">ENTER FIRST NAME :</label>
                <input type="text" name="FIRSTNAME" id="firstname">
            
                <label for="lastname">ENTER LAST NAME :</label>
                <input type="text" name="LASTNAME" id="lastname">

                <label for="rollno">ENTER ROLL NO :</label>
                <input type="text" name="ROLLNO" id="rollno">

                <label for="class">ENTER CLASS :</label>
                <input type="text" name="CLASS" id="class">
           
                <label for="fees">DUE FEES :</label>
                <input type="text" name="FEES" id="fees">
         
                <input type="submit" value="CREATE">

        </form>
        <input type="submit" id="add" Value = "AddAuthor">
        <input type="submit" id="View" Value = "VIEW RECORDS">

        <input type="submit" id="pay" Value="PAY FESS">
        <script>


            $("#add").on("click", function () {
                window.location.href = 'authordetails.jsp';
            });

            $("#View").on("click", function () {
                window.location.href = 'display.jsp';
            });

            $("#pay").on("click", function () {
                window.location.href = 'feepay.jsp';
            });

        </script>
    </body>
</html>

