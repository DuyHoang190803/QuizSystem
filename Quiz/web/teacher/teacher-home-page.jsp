<%-- 
    Document   : home2
    Created on : Jan 14, 2024, 11:00:18 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recall</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #F6F6F6;
                height: 100vh;
            }

            .card {

                background-color: #fff;
                width: 65%;
                margin: 50px auto;
                padding: 30px;
                border-radius: 10px;
                text-align: center;
            }

            .cardButton{

            }

            .cardButton button {
                width: 20%;
                height: 100%;
                padding: 10px 20px;
                margin: 10px;
                border-radius: 10px;
                border: 1px solid #333;
                background-color: #A162FD;
                color: #fff;
                border-color: #A162FD;
                font-weight: 600;
                font-size: 18px;
                transition: background-color 0.3s, color 0.3s, border-color 0.3s;
                cursor: pointer;
            }

            .cardButton button:hover {
                background-color: #000;
                color: #fff;
                border-color: #000;

            }

            .card button.outlined {
                background-color: #000;
                color: #fff;
                border-color: #000;
                transition: background-color 0.3s, color 0.3s, border-color 0.3s;
            }

            .card button.outlined:hover {
                background-color: #9B68FF;
                color: #fff;
                border-color: #9B68FF;

            }


            section {
                width: 80%;
                margin: 20px auto;

            }
            .user {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                border: solid 3px transparent;
                transition: background-color 0.3s, color 0.3s, border-color 0.3s;
            }

            .user:hover {
                border-color: #9B68FF;

            }


            .user img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>

        <%@include file="../components/header.jsp" %>

        <div class="card">
            <div>
                <h1>Ready to start <span style="color: #A162FD">teaching</span> </h1>
                <h4 style="font-weight: 100; padding: 15px 20px;">Create a test to get started, or get into your class!</h4>
            </div>
            <div class="cardButton" style="padding-bottom: 30px;">
                <button class="outlined" onclick="window.location.href='/quiz/addnewclasscontroller'">New class</button>
                
                <button  onclick="window.location.href='/quiz/teachergetclass'">My class</button>
                
                <button class="outlined" onclick="window.location.href='/quiz/teacherviewquestionsets'">Question Sets</button>
            </div>
        </div>

        <section>
            <div>
                <h2>Top student with highest total mark: </h2>
            </div>          
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh2.jpg" alt="A">
                <p>Nguyen Van A</p>
            </div>
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh3.jpg" alt="B">
                <p>Nguyen Van B</p>
            </div>
            <div class="cardButton" style="padding-bottom: 30px; ">             
                <button class="outlined" onclick="window.location.href='http://localhost:9999/quiz/teacher/teacher-view-top-student.jsp'">View top student</button>
            </div>
        </section>

        <%@include file="../components/footer.jsp" %>

    </body>
</html>

