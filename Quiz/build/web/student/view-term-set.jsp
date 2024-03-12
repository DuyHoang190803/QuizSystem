<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create a New Set</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <link rel="stylesheet" href="./assets/css/view-term-set.css">
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <div class="bg-secondary">
            <div class="container pt-5">
                <div class="bg-white set-control d-flex rounded-3 p-4">
                    <div class="set-info pe-3">
                        <h1 class="text-break">${termSet.termSetName}</h1>
                        <c:if test="${termSet.isPublic}">
                            <p>This set is public</p>
                        </c:if>
                        <c:if test="${!termSet.isPublic}">
                            <p>This set is private</p>
                        </c:if>
                        <a href="view-student-set-list?userId=${user.userId}" class="set-info-link">Created by: <span class="text-primary fs-5">${user.userName}</span></a>
                    </div>
                    <div class="set-control-group">
                        <a href="flashcard?termSetId=${termSet.termSetId}" class="set-control-item">
                            <div>
                                <h5>Flashcards</h5>
                                <p>The original active recall technique, in the digital format.</p>
                            </div>
                            <img src="./assets/img/flashcardIcon.png">
                        </a>
                        <a href="#" class="set-control-item">
                            <div>
                                <h5>Test</h5>
                                <p>Take a test based on the sets terms.</p>
                            </div>
                            <img src="./assets/img/testIcon.png">
                        </a>
                        <a href="MatchingServlet?termSetId=${termSet.termSetId}" class="set-control-item">
                            <div>
                                <h5>Match</h5>
                                <p>Get prompted by the definition and match the corresponding term.</p>
                            </div>
                            <img src="./assets/img/writing.png">
                        </a>
                        <a href="#" class="set-control-item">
                            <div>
                                <h5>Learn</h5>
                                <p>Spaced repetition, without the effort.</p>
                            </div>
                            <img src="./assets/img/learn.png">
                        </a>
                    </div>
                </div>
            </div>
            <div class="container pt-5">
                <div class="d-flex">
                    <h4>Terms in this set (${termSet.terms.size()})</h4>
                    <c:if test="${thisUser.userId == user.userId}">
                        <div class="d-flex align-items-center ms-auto">
                            <form id="deleteForm" action="delete-term-set" method="POST">
                                <input type="hidden" name="termSetId" value="${termSet.termSetId}">
                                <button class="btn btn-danger me-2" type="submit">Delete</button>
                            </form>
                                <form action="edit-term-set" method="get">
                                <input type="hidden" name="termSetId" value="${termSet.termSetId}">
                                <button class="btn btn-primary" type="submit">Edit</button>
                            </form>
                        </div>
                    </c:if>

                </div>
                <c:forEach var="term" items="${termSet.terms}" varStatus="loop">
                    <div class="set-group bg-white mt-4 p-3 rounded-2">
                        <div class="text-primary">
                            <span>${loop.index + 1}</span>
                        </div>
                        <div class="d-flex align-items-start">
                            <div class="set-item p-3">${term.term}</div>
                            <div class="divider"></div>
                            <div class="set-item p-3">${term.definition}</div>
                        </div>
                    </div>
                </c:forEach>
                <br></br>
            </div>
        </div>
        <%@include file="../components/footer.jsp" %>
        <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.querySelector('.btn-danger').addEventListener('click', function (e) {
                e.preventDefault();
                if (confirm('Are you sure you want to delete?')) {
                    document.getElementById('deleteForm').submit();
                }
            });
        </script>
    </body>

</html>
