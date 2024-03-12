<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.Classes"%>
<%@page import="model.User"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Set</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            thead {
                background-color: #f2f2f2;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tbody tr:hover {
                background-color: #e6f7ff;
            }

            th {
                background-color: #333333;
                color: white;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f8f8f8;
            }

            .box {
                display: flex;
                margin: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                overflow: hidden;
                min-height: 700px;
            }


            .left {
                width: 20%;
                background-color: #666666;
                color: #ffffff;
                padding: 20px;

            }

            .right {
                width: 80%;
                background-color: #ffffff;
                color: #666666;
                padding: 20px;

            }

            .title {
                margin-bottom: 20px;
            }

            .quiz-set-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .item-right {
                margin-bottom: 10px;
                cursor: pointer;
                padding: 8px;
                background-color: #ecf0f1;
                border-radius: 4px;
                transition: background-color 0.3s;
                color: #666666;
                width: 100%;
                border: none;
                font-size: 17px;
            }

            .item-right:hover {
                background-color: #bdc3c7;
            }
            .quiz-list-item {
                margin-bottom: 20px;
                display: flex;
                justify-content: space-between;
                border: 2px solid #ddd;
                padding: 10px;
            }

            .quiz-list-item h3 {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="../components/header.jsp" %>
        </div>
        <div class="box">
            <div class="left">
                <div class="title">    
                    <c:set var="cl" value="${sessionScope.cl}" />
                    <h2>${cl.getClassName()}</h2>
                    <h3>Semester: ${cl.getSemester()}</h3>
                    <h3>Subject: ${cl.getSubject()} </h3>
                    <h3>Code: ${cl.getClassCode()}</h3> 

                </div>

                <div class="quiz-set-list">
                    <form id="deleteForm" action="TeacherGetStudentByClass" method="get" >
                        <input type="submit" value="Student" class="item-right">
                        <input type="hidden" value="${cl.getClassID()}" name="id">
                    </form>
                    <form id="transcript" action="" method="post" >
                        <input type="submit" value="Transcript" class="item-right">
                        <input type="hidden" value="${cl.getClassID()}" name="id">
                    </form>
                    <form id="document" action="" method="post" >
                        <input type="submit" value="Document" class="item-right">
                        <input type="hidden" value="${cl.getClassID()}" name="id">
                    </form>
                    <form id="addQuestion" action="" method="post" >
                        <input type="submit" value="Add Question" class="item-right">
                        <input type="hidden" value="${cl.getClassID()}" name="id">
                    </form>
                    <form id="studentApproval" action="TeacherAcceptStudents" method="post" >
                        <input type="submit" value="Student Approval" class="item-right">
                        <input type="hidden" value="${cl.getClassID()}" name="id">
                    </form>
                </div>

            </div>
            <div class="right" id="detail-content">
                <c:set var="stdList" value="${requestScope.stdList}" />
                <c:if test="${not empty stdList}">
                    <h2>Students list:</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Student Code</th>                             
                                <th>Date of Birth</th>
                                <th>Phone Number</th>
                                <th>Place</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${stdList}" var="student">
                                <tr>
                                    <td>${student.getUserName()}</td>
                                    <td>${student.getUserCode()}</td>
                                    <td>${student.getDob()}</td>
                                    <td>${student.getPhoneNumber()}</td>
                                    <td>${student.getPlace()}</td>
                                    <td>
                                        <form id="deleteForm" action="TeacherRemoveStudent" method="post">
                                            <input type="submit" value="Remove" onclick="return confirmDelete();">
                                            <input type="hidden" value="${student.getUserId()}" name="uid">
                                            <input type="hidden" value="${cl.getClassID()}" name="cid">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                   
                </c:if>


                <c:set var="stdNotInClass" value="${requestScope.stdNotInClass}" />
                <c:if test="${not empty stdNotInClass}">
                    <h2>Students are waiting for approval:</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Student Code</th>                             
                                <th>Date of Birth</th>
                                <th>Phone Number</th>
                                <th>Place</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${stdNotInClass}" var="student">
                                <tr>
                                    <td>${student.getUserName()}</td>
                                    <td>${student.getUserCode()}</td>
                                    <td>${student.getDob()}</td>
                                    <td>${student.getPhoneNumber()}</td>
                                    <td>${student.getPlace()}</td>
                                    <td>
                                        <form id="deleteForm" action="TeacherRejectStudent" method="post">
                                            <input type="submit" value="Reject" onclick="return confirmDelete2();">
                                            <input type="hidden" value="${student.getUserId()}" name="uid">
                                            <input type="hidden" value="${cl.getClassID()}" name="cid">
                                        </form>
                                        <form id="deleteForm" action="TeacherAcceptStudents" method="get">
                                            <input type="submit" value="Approval" onclick="return confirmDelete3();">
                                            <input type="hidden" value="${student.getUserId()}" name="uid">
                                            <input type="hidden" value="${cl.getClassID()}" name="cid">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                   
                </c:if>

            </div>
        </div>

        <div class="footer">
            <%@include file="../components/footer.jsp" %>
        </div>
        <script>
            function confirmDelete() {
                return confirm("Are you sure you want to remove this student?");
            }
            function confirmDelete2() {
                return confirm("Are you sure you want to Reject this student?");
            }
            function confirmDelete3() {
                return confirm("Are you sure you want to Approval this student?");
            }
        </script>
    </body>
</html>
