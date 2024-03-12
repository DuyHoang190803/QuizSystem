<%-- 
    Document   : teacher-view-top-student
    Created on : Jan 22, 2024, 1:15:10 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            button:hover {
                background-color: #000;
                color: #fff;
                border-color: #000;

            }

            button.outlined {
                background-color: #000;
                color: #fff;
                border-color: #000;
                transition: background-color 0.3s, color 0.3s, border-color 0.3s;
            }

            button.outlined:hover {
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
        <div class="header">
             <%@include file="../components/header.jsp" %>
        </div>
        <section>
            <div>
                <h2>Top student with highest total mark: </h2>
            </div>          
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh2.jpg" alt="A">
                <p>Nguyen Van A - Class A</p>
            </div>
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh1.jpg" alt="A">
                <p>Nguyen Van C - Class A</p>
            </div>
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh2.jpg" alt="A">
                <p>Nguyen Van D - Class B</p>
            </div>
            
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh3.jpg" alt="B">
                <p>Nguyen Van B - Class B</p>
            </div>
            
            <div class="user" style="background-color: #FFFFFF; border-radius: 10px;">
                <img src="../assets/img/Anh1.jpg" alt="B">
                <p>Nguyen Van E - Class B</p>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
