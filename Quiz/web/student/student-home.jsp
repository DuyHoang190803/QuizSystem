<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quiz</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #FCFCFC;
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


            .custom-div {
                border-radius: 10px;
                margin-top: 40px;
                height: 130px;
                background-color: #EEE9D8;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                transition: background-color 0.3s;
            }

            .custom-div:hover {
                background-color: #ccc; 
            }
        </style>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const customDivs = document.querySelectorAll('.custom-div');

                customDivs.forEach(div => {
                    div.addEventListener('click', function () {
                        window.location.href = 'create-term-set';
                    });
                });
            });
        </script>
    </head>
    <body>

        <%@include file="../components/header.jsp" %>

        <!--        <div class="card">
                    <div>
                        <h1>Ready to start <span style="color: #DD4C00">learning?</span> </h1>
                        <h4 style="font-weight: 100;">Create a set to get started!!!</h4>
                    </div>
                    <form class="cardButton" style="padding-bottom: 30px;" action="create-term-set">
                        <button style="width: 90%; height: 70px; padding-right: 400px;font-size: 30px;  " type="submit">Create a set</button>
                       
                    </form>
                </div>-->




        <div class="row justify-content-center">
            <div class="col-10 ">
                <div class="custom-div" >
                    <h6>Ready to start <span style="color: #DD4C00">learning?</span> </h6>
                    <h4 style="font-weight: bolder;">Create a set to get started!!!</h4>
                </div>

                <div class="mt-5">
                    <div>
                        <h4 style="font-weight: bolder">Recently</h4>                     
                    </div>
                    <div class="row">
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px; margin-right: 10px ">
<!--                            One of three columns-->
                        </div>
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px;margin-right: 10px ">
<!--                            One of three columns-->
                        </div>
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px;margin-right: 10px ">
<!--                            One of three columns-->
                        </div>
                    </div>

                </div>


                <div class="mt-5 mb-5">
                    <div>
                        <h4 style="font-weight: bolder">Your class</h4>                     
                    </div>
                    <div>
                        <c:set var="id" value="${sessionScope.user_id}" />

                        <form action="StudentJoinClassByCode" method="post">
                            <input type="text" name="code">
                            <input type="submit" value="Join">
                            <input type="hidden" name="id" value="${id}" >
                        </form>
                        <% String mess =(String) request.getAttribute("mess");
                        if(mess != null){
                            %>
                            <h2><%=mess %></h2>
                            <%
                            }
                        %>
                    </div>
                    <div class="row">
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px; margin-right: 10px ">
                            <!--One of three columns-->
                        </div>
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px;margin-right: 10px ">
                            <!--One of three columns-->
                        </div>
                        <div class="col" style="height: 150px; background-color: #EEE9D7; border-radius: 10px;margin-right: 10px ">
                            <!--One of three columns-->
                        </div>
                    </div>

                </div>



            </div>







        </div>




        <!--        <section>
                    <div>
                        Recently
                    </div>    
        <c:forEach items="${requestScope.top5UserList}" var="i">
            <div class="user" style="background-color: #EEE9D8; border-radius: 10px;">
                <img src="./assets/img/Anh3.jpg" alt="A">
                <p>${i.userName}</p>
            </div>
        </c:forEach>


        <div class="cardButton" style="padding-bottom: 30px; ">             
            <button >Go to profile</button>
        </div>
    </section>-->

        <%@include file="../components/footer.jsp" %>

    </body>
</html>

