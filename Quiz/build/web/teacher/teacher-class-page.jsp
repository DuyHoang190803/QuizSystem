<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.Classes"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Class Information</title>
        <style>

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                width: 80%;
                margin: auto;
                overflow: hidden;
                min-height: 600px;
            }

            .row::after {
                content: "";
                display: table;
                clear: both;
            }

            .col {
                float: left;
                width: 33.3%;
                padding: 10px;
                box-sizing: border-box;
            }

            .class-info {
                background-color: #ddd;
                color: #333;
                padding: 10px;
                margin-bottom: 10px;
                border: none;
                text-align: left;
                width: 100%;
                box-sizing: border-box;
            }
            .class-info input[type="submit"]:hover{
                background-color: #0dcaf0;
            }
            .class-info h3, .class-info h4 {
                margin: 10px 0;
            }

            .class-info div {
                display: flex;
                justify-content: space-between;
            }

            .class-info input[type="submit"] {
                background-color: #f4f4f4;
                color: #333;
                border: none;
                cursor: pointer;
                padding: 5px 10px;
            }

            .back-button {
                background-color: #0dcaf0;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-left: 30px;
            }

            .back-button:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="../components/header.jsp" %>
        </div>
        <div class="container">

            <c:set var="classList" value="${sessionScope.c}" />

            <c:if test="${not empty classList}">
                <c:forEach items="${classList}" varStatus="loopStatus">
                    <c:if test="${loopStatus.index % 3 == 0}">
                        <div class="row">
                        </c:if>

                        <div class="col">
                            <button class="class-info">
                                <h2>Class Name: ${classList.get(loopStatus.index).getClassName()}</h2>
                                <h3>Semester: ${classList.get(loopStatus.index).getSemester()}</h3>
                                <h3>Subject: ${classList.get(loopStatus.index).getSubject()}</h3>                                
                                <div>
                                    <form id="deleteForm" action="TeacherDeleteClass" method="post">
                                        <input type="submit" value="Delete" onclick="return confirmDelete();">
                                        <input type="hidden" value="${classList.get(loopStatus.index).getClassID()}" name="id">
                                    </form>
                                    <form action="TeacherViewClass" method="post">
                                        <input type="submit" value="View">
                                        <input type="hidden" value="${classList.get(loopStatus.index).getClassID()}" name="id">
                                    </form>   
                                </div>

                                <script>
                                    function confirmDelete() {
                                        return confirm("Are you sure you want to delete this class?");
                                    }
                                </script>


                            </button>
                        </div>

                        <c:if test="${loopStatus.index % 3 == 2 or loopStatus.last}">
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
            <div>

                <form action="teacherhome" method="get" >
                    <button type="submit" class="back-button">Back</button>
                </form>
                <style>
                    .back-button {
                        background-color: #0dcaf0;
                        color: #fff;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 5px;
                        cursor: pointer;
                        font-size: 16px;
                        margin-left: 30px;
                    }

                    .back-button:hover {
                        background-color: #0056b3;
                    }
                </style>                
            </div>
        </div>
        <div class="footer">
            <%@include file="../components/footer.jsp" %>
        </div>
    </body>
</html>
