<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add new class</title>
        <style>
            body{
                background-color: #F6F6F6;
            }
            .container {
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 15px;
                margin: auto;
                width: 500px;
                font-family: Arial, sans-serif;
                background-color: #A162FD;
            }
            .mainText {
                display: flex;
                flex-direction: column;
            }

            .titleLabel {
                margin-bottom: 5px;
            }

            .inputText {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .createButton {
                background-color: #A162FD;
                color: white;
                cursor: pointer;
                width: 300px;
                border-radius: 15px;
                font-size: 25px;
                margin: auto;
            }

            .createButton:hover {
                background-color: #45a049;
            }
            .back-button {
                background-color: #0dcaf0;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .back-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <%@include file="../components/header.jsp" %>

        <div class="container" style="max-width: 500px; padding: 30px; background-color: cornsilk; margin-top: 30px; margin-bottom: 30px; border: 15px;">
            <form class="mainText" action="/quiz/addnewclasscontroller" method="post">
                <h1> Class of Teacher: ${sessionScope.acc.userName}</h1>
                <label class="titleLabel" for="class_name">Name Class:</label>
                <input class="inputText" type="text" id="class_name" name="class_name" placeholder="Enter your class name" required>
                <label class="titleLabel" for="semester">Semester:</label>
                <select name = "semester" class="inputText"> 
                    <option value="Summer">Summer</option>
                    <option value="Spring">Spring</option>
                    <option value="Fall">Fall</option>
                </select>
                <label class="titleLabel" for="subject">Subject:</label>
                <select name = "subject" class="inputText"> 
                    <option value="English">English-LUK1</option>
                    <option value="English">English-LUK2</option>
                    <option value="English">English-LUK3</option>
                    <option value="English">English-TRANS4</option>
                    <option value="English">English-TRANS5</option>
                    <option value="English">English-TRANS6</option>
                    <option value="Japan">Japan-1</option>
                    <option value="Japan">Japan-2</option>
                    <option value="Japan">Japan-3</option>
                </select>


                <div>
                    <label class="titleLabel" for="code">Code:</label>
                    <input class="inputText" type="text" id="code" name="code" readonly><br>
                </div>

                <script>
                    function generateRandomCode(length) {
                        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                        var randomCode = '';
                        for (var i = 0; i < length; i++) {
                            var randomIndex = Math.floor(Math.random() * characters.length);
                            randomCode += characters.charAt(randomIndex);
                        }
                        return randomCode;
                    }
                    var codeInput = document.getElementById('code');

                    codeInput.value = generateRandomCode(6); 
                </script>


                <input class="createButton" type="submit" value="Create">
            </form>

            <form action="teacherhome" method="get" >
                <button type="submit" class="back-button">Back</button>
            </form>              
        </div>



        <%@include file="../components/footer.jsp" %>
    </body>
</html>
