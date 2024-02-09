
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <title>FEE Details</title>
        
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: lightcyan;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h5 {
            background-color: #3498db; /* Blue */
            color: #ffffff;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="submit"] {
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
        }

        input[type="submit"] {
            background-color: #27ae60; /* Green */
            color: #ffffff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #219653; /* Slightly darker shade of green on hover */
        }

        #pay {
            background-color: #f39c12; /* Orange */
        }

        #pay:hover {
            background-color: #d35400; /* Slightly darker shade of orange on hover */
        }

        #balance, #amount {
            width: 200px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
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
        <h5 id="msg"class="row justify-content-center align-items-center"  ></h5>
        Student's RollNo : <input type="text" id="rollno" value="">
        <input type="submit" value="Go" id="go">
        
        Balance Fees : <input type="text" id="balance" value="">
        Amount you will pay now : <input type="text" id="amount" name="AMOUNT">
        <input type="submit" id="pay" value="PAY">
        
        <script>
            
            $("#go").on("click",function(){
                fetchbalance();
            });
            $("#pay").on("click",function(){
                newbalance();
            });
            
            function fetchbalance(){
                var f = "ROLLNO="+$("#rollno").val();
                
                $.ajax({
                    url : "fetch",
                    data : f,
                    type : 'GET',
                    dataType : 'text',
                    success:function(data, textStatus, jqXHR){
                        
                        data = data.trim();
                        if(data != "INVALID"){
                            $("#balance").val(data);
                        }else{
                            alert("INVALID ROLLNO....!!!")
                        }
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        alert("Some Error!!!");
                    }
                });
            }
            function newbalance(){
                var f = "BALANCE="+$("#balance").val()+
                        "&AMOUNT="+$("#amount").val()+
                        "&ROLLNO="+$("#rollno").val();
                
                $.ajax({
                    url : "calculate",
                    data : f,
                    type:'GET',
                    success:function(data, textStatus, jqXHR){
                        
                        data = data.trim();
                        if(data != "INVALID"){
                            $("#balance").val(data);
                            $("#amount").val("");
                            $('#msg').html("Successfully Paid!");
                            $('#msg').css("color", "green");
                            $('#msg').hide(3000);
                            $('#msg').show();
                        }else{
                            alert("INVALID AMOUNT....!!!")
                        }
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        alert("Some Error!!!");
                    }
                });
            }
            
        </script>
    </body>
    
</html>
