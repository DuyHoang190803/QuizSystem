<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <link rel="stylesheet" href="./assets/css/view-student-set-list.css">
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <div class="app bg-secondary">
            <div class="container">
                <div class="user-info d-flex align-items-center py-4 px-3">
                    <img class="user-avatar" src="./assets/img/Anh1.jpg" alt="Avatar"/>
                    <h3 class="username">${user.userName}</h3>
                </div>
                <div class="navigation d-flex py-1 px-2 ms-3 me-5">
                    <a href="#" class="navigation-item text-primary">Sets</a>
                    <div class="divider mx-3"></div>
                    <a href="#" class="navigation-item">Folders</a>
                </div>
                <div class="list d-flex p-2">
                    <c:forEach var="termSet" items="${termSets}">
                        <!--check if public or not-->
                        <c:if test="${user.userId == thisUser.userId || termSet.isPublic}">
                            <a href="view-term-set?termSetId=${termSet.termSetId}" class="list-item d-flex align-items-center justify-content-between bg-white rounded-2">
                                <div class="list-item-left">
                                    <h5 class="text-break pe-2">${termSet.termSetName}</h5>
                                    <c:if test="${termSet.isPublic}">
                                        <p>Public</p>
                                    </c:if>
                                    <c:if test="${!termSet.isPublic}">
                                        <p>Private</p>
                                    </c:if>
                                </div>
                                <p class="text-primary list-item-right">${termSet.terms.size()} Terms</p>
                            </a>
                        </c:if>       
                    </c:forEach>
                </div>    
            </div>
        </div>
        <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
