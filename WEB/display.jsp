
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <title>DISPLAY</title>
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: yellowgreen;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h1 {
            color: #4CAF50; /* Green */
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: white;
        }
        .update {
            background-color: lightblue;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049; /* Slightly darker shade of green on hover */
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        #msg {
            background-color: #e74c3c; /* Red */
            color: white;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
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
        <h1>STUDENT DETAILS</h1>
        
        <table border="1" id="studenttable">
        <thead>
            <tr>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>ROLL NO</th>
                <th>CLASS</th>
                <th>DUE FEES</th>
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
        
        <h3>Student details for Updation</h3>
        <div class="update">
            FIRST NAME : <input type="text" id="fname" name="FIRSTNAME">
            LAST NAME : <input type="text" id="lname" name="LASTNAME">
            ROLL NO :<input type="text" id="rollno" name="ROLLNO">
            CLASS:<input type="text" id="cl" name="CLASS">
            DUE FESS :<input type="text" id="due" name="DUE">
            
            <input type="submit" value="update" id="update">
        </div>
        <script>
            
            function read()
            {
                $.ajax({
                    url: "Read",
                    type: 'GET',
                    success: function (data, textStatus, jqXHR) {
                        data = JSON.parse(data);
                        console.log(data);
                        if (data)
                        {
                            $.each(data,function(index,student){
                                addStudentinTable(student);
                            });                                
                        } else
                        {
                            alert("Something went wrong on server! Relod and Try Again");
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("success........");
                        $('#msg').html("Something went wrong on server! relod and Try Again");
                        $('#msg').css("color", "red");
                    }
                });
            }
            
            function addStudentinTable(student){
                console.log(student.FIRSTNAME);
                var table = $("#studenttable").find("tbody");

               var newRow = $("<tr>")
                            .append($("<td>").text(student.fname))
                            .append($("<td>").text(student.lname))
                            .append($("<td>").text(student.rollno))
                            .append($("<td>").text(student.cl))
                            .append($("<td>").text(student.due))
                            .append($("<td>").append($("<button>").text("Update").click(function() {
                                    updateStudent(student);
                           })))
                                   .append($("<td>").append($("<button>").text("Delete").click(function() {
                                    deleteStudent(student);
                           })));
                                   

                          table.append(newRow);
            }
            
            function updateStudent(student){
                
                $("#fname").val(student.fname);
                $("#lname").val(student.lname);
                $("#rollno").val(student.rollno);
                $("#cl").val(student.cl);
                $("#due").val(student.due);
            }
            
           window.onload = function() {
            read();
           };
           
           function deleteStudent(student){
               
               var d = "ROLLNO="+student.rollno;
               
               $.ajax({
                   url : "Delete",
                   data : d,
                   type : 'POST',
                   success : function(data, textStatus, jqXHR){
                       if (data.trim() === 'done')
                        {
                            $('#msg').html("Successfully Deleted!");
                            $('#msg').css("color", "green");
                            $('#msg').hide(3000);
                            $('#msg').show();
                            $("#studenttable tbody").empty();
                            read();
                        } else
                        {
                            $('#msg').html("Something went wrong on server! Relod and Try Again");
                            $('#msg').css("color", "red");
                        }
                   },
                   
                   error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                        console.log("success........");
                        $('#msg').html("Something went wrong on server! relod and Try Again");
                        $('#msg').css("color", "red");
                    } 
               });
           }
           
           $("#update").on("click",function(){
               Update();
           });
           
           function Update(){
               var f = "FIRSTNAME="+$("#fname").val()+
                       "&LASTNAME="+$("#lname").val()+
                       "&ROLLNO="+$("#rollno").val()+
                       "&CLASS="+$("#cl").val()+
                       "&DUE="+$("#due").val();
               
               
               $.ajax({
                   url : 'update',
                   type : 'POST',
                   data : f,
                   success: function (data, textStatus, jqXHR) {
                        if (data.trim() === 'done')
                        {
                            $('#msg').html("Successfully Updated!");
                            $('#msg').css("color", "green");
                            $('#msg').hide(3000);
                            $('#msg').show();
                            $("#studenttable tbody").empty();
                            read();
                        } else
                        {
                            $('#msg').html("Something went wrong on server! Relod and Try Again");
                            $('#msg').css("color", "red");
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                        console.log("success........");
                        $('#msg').html("Something went wrong on server! relod and Try Again");
                        $('#msg').css("color", "red");
                    }
               });
           }
        </script>
    </body>
</html>
