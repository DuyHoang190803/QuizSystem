<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <style>
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
                position: relative;
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

            .card:hover {
                transform: scale(1.005);
                transition: 0.6s ;
            }

            .pagination{
                display: inline-block;
                position: relative;
                top: 20px;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
            }
            .pagination a{
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;

            }
            .pagination a.active{
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active){
                background-color: #bdc3c7;
            }

        </style>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <c:set var="s" value="${sessionScope.searchValue}" />
        <div class="box">
            <div class="left">
                <div class="title">
                    <h4>Search for: ${s}</h4>
                </div>
                <div class="quiz-set-list">
                    <form id="" action="search" method="post" class="mb-3">
                        <input type="submit" value="Term Set" class="item-right">
                        <input type="hidden" value="${s}" name="searchByTermSet">
                    </form>
<!--                    <form id="" action="search" method="post">
                        <input type="submit" value="Class" class="item-right">
                        <input type="hidden" value="${s}" name="searchByClass">
                    </form>-->
                </div>
            </div>
            <div class="right" id="detail-content">
                <c:set var="termSet" value="${requestScope.list}" />
                <c:if test="${termSet != null}">
                    <div class="row row-cols-1 row-cols-md-1 g-4">
                        <c:forEach items="${termSet}" var="termSet">
                            <a href="view-term-set?termSetId=${termSet.termSetId}" class="list-item d-flex align-items-center justify-content-between bg-white rounded-2" style="text-decoration: none;">
                                <div class="col" style="height: 140px;">
                                    <div class="card" style="height: 140px; background-color: #EEE9D6 ">
                                        <div class="card-body">
                                            <h2 class="card-title" style="font-weight: bolder">${termSet.getTermSetName()}</h2>
                                            <h5 class="card-description" style="font-weight: 300">${termSet.getTermSetDescription()}</h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </c:if>

                <c:set var="page" value="${requestScope.page}"/>
                <div class="pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a class="${i==page?"active":""}" href="search?searchValue=${s}&page=${i}">${i}</a>
                    </c:forEach>
                </div>

            </div>







        </div>

    </body>
</html>