<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flashcard</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <style></style>
    </head>
    <body>
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <div class="dropdown navbar-brand">
                    <button class="btn dropdown-toggle fs-5" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="./assets/img/flashcardIcon.png" width="40" style="filter: invert(39%) sepia(70%) saturate(1008%) hue-rotate(236deg) brightness(98%) contrast(98%);">
                        Flashcard
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="homes">Home</a></li>
                        <li><a class="dropdown-item" href="view-student-set-list?userId=${thisUser.userId}">My library</a></li>
                    </ul>
                </div>

                <div class="text-center" style="margin-right: 140px">
                    <h6>
                        <span id="current-term">1</span>/${termSet.terms.size()}
                    </h6>
                    <h5>${termSet.termSetName}</h5>
                </div>
                <a href="view-term-set?termSetId=${termSet.termSetId}" class="btn btn-outline-danger" type="button"><i class="bi bi-x-circle"></i></a>
            </div>
        </nav>
        <div class="progress" role="progressbar" style="height: 2px">
            <div class="progress-bar bg-primary" id="current-progess" style="width: 0%"></div>
        </div>
        <div class="container mt-5" style="cursor: pointer">
            <div class="card shadow pe-auto" id="switch-btn" style="height: 420px">
                <div class="card-body p-5 d-flex" id="flashcard-term">
                    <p id="term-text" class="card-text m-auto text-center fs-3">${termSet.terms[0].term}</p>
                </div>

                <div class="card-body p-5 d-flex d-none" id="flashcard-def">
                    <p id="def-text" class="card-text m-auto text-center fs-3">${termSet.terms[0].definition}</p>
                </div>
            </div>

            <!-- Navigation buttons -->
            <div class="mt-3 d-flex justify-content-between">
                <button class="btn btn-outline-primary" id="reset-btn" type="button">Reset</button>
                <div>
                    <button id="prev-btn" class="btn btn-outline-primary mr-2" type="button"><i class="bi bi-arrow-left"></i></button>
                    <button id="next-btn" class="btn btn-outline-primary mr-2" type="button"><i class="bi bi-arrow-right"></i></button>
                </div>
                <button class="btn btn-outline-primary" id="shuffle-btn" type="button"><i class="bi bi-shuffle"></i></button>
            </div>
        </div>
        <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            var currentTermIndex = 0;
            var terms = [
            <c:forEach var="term" items="${termSet.terms}" varStatus="loop">
                {
                    term: "${fn:escapeXml(term.term).replaceAll('\\r\\n', '\\\\n')}",
                    definition: "${fn:escapeXml(term.definition).replaceAll('\\r\\n', '\\\\n')}"
                },
            </c:forEach>
            ];

            function switchCard() {
                var term = document.getElementById('flashcard-term');
                var def = document.getElementById('flashcard-def');
                term.classList.toggle("d-none");
                def.classList.toggle("d-none");
            }

            function nextTerm() {
                if (currentTermIndex < terms.length - 1) {
                    currentTermIndex++;
                    updateTerm();
                }
            }

            function prevTerm() {
                if (currentTermIndex > 0) {
                    currentTermIndex--;
                    updateTerm();
                }
            }

            function resetTerm() {
                currentTermIndex = 0;
                updateTerm();
            }

            function shuffleTerm() {
                currentTermIndex = Math.floor(Math.random() * terms.length);
                ;
                updateTerm();
            }

            function updateTerm() {
                document.getElementById('term-text').textContent = terms[currentTermIndex].term;
                document.getElementById('def-text').textContent = terms[currentTermIndex].definition;
                document.getElementById('current-term').textContent = currentTermIndex + 1;
                document.getElementById('current-progess').style.width = ((currentTermIndex + 1) / terms.length) * 100 + '%';
            }

            document.getElementById('reset-btn').addEventListener('click', resetTerm);
            document.getElementById('shuffle-btn').addEventListener('click', shuffleTerm);
            document.getElementById('switch-btn').addEventListener('click', switchCard);
            document.getElementById('next-btn').addEventListener('click', nextTerm);
            document.getElementById('prev-btn').addEventListener('click', prevTerm);
        </script>
    </body>
</html>
