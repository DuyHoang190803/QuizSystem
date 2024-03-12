<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Matching Game</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #ffcccc;
        }

        #game-board {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            width: 80%;
            margin: 20px auto;
        }

        .nuatren, .nuaduoi {
            width: 100%;
        }



        .card {
            width: 70%;
            height: 100px;
            border: 2px solid #ddd;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-family: Arial, sans-serif;
            border-radius: 15px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
            margin: auto;
        }

        .card:hover {
            transform: scale(1.1);
        }

        .word, .meaning {
            font-size: 22px;
            color: #333;
        }

        .selected {
            background-color: #f0f0f0;
            border-color: #999;
        }

        .matched {
            visibility: hidden;
        }

        #timer {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 28px;
        }

        #seconds {
            font-weight: bold;
            color: #333;
        }
        .button-match {
            background-color: #0dcaf0;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 23px;
            max-width: 200px;
        }

        .button-match:hover {
            background-color: #0056b3;
        }

    </style>
    <body>
        <div class="container">

            <c:set var="mess" value="${requestScope.matchMess}" />

            <h1 style="text-align: center; justify-content: center; background-color: #fff; border-radius: 20px; width: 260px; height: 60px;">Matching Game</h1>
            <div style="display: flex; justify-content: space-around; width: 80%;">
                <form action="view-term-set" method="get">
                    <input type="hidden" name="termSetId" value="${termSet}">
                    <input class="button-match" type="submit" value="Back" formaction="view-term-set?termSetId=${termSet}">
                </form>

                <form action="view-term-set" method="get">
                    <input type="hidden" name="termSetId" value="${termSet}">
                    <input class="button-match" type="submit" value="Play again" formaction="MatchingServlet?termSetId=${termSet}">
                </form>
            </div>
            <c:if test="${not empty mess}">
                <h2 style="justify-content: center;">${mess}</h2>
            </c:if>


            <c:if test="${empty mess}">
                <div id="timer">Timer: <span id="seconds">0</span>s</div>
                <div id="game-board" style="margin: auto">


                    <div class="nuatren">
                        <h2 style="text-align: center;">Word</h2>
                        <c:forEach var="word" items="${cards.terms}" varStatus="loop">
                            <c:if test="${loop.index < 8}">
                                <div class="card" id="card-word-${word.termId}" onclick="selectCard('${word.termId}', 'word')">
                                    <div class="content">
                                        <div class="word">${word.term}</div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="nuaduoi">
                        <h2 style="text-align: center;">Definition</h2>
                        <c:forEach var="word1" items="${cards1}" varStatus="loop1">
                            <c:if test="${loop1.index < 8}">
                                <div class="card" id="card-definition-${word1.termId}" onclick="selectCard('${word1.termId}', 'definition')">
                                    <div class="content">
                                        <div class="meaning">${word1.definition}</div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </c:if>


            <script>
                var selectedTermId = null;
                var selectedDefinitionId = null;
                var matchedPairs = 0;
                var timerInterval;
                var seconds = 0;

                function selectCard(termId, type) {
                    if (type === 'word') {
                        if (selectedTermId !== null) {
                            return;
                        }
                        selectedTermId = termId;
                        document.getElementById('card-word-' + termId).classList.add('selected');
                    } else if (type === 'definition') {
                        if (selectedDefinitionId !== null) {
                            return;
                        }
                        selectedDefinitionId = termId;
                        document.getElementById('card-definition-' + termId).classList.add('selected');
                    }

                    if (selectedTermId !== null && selectedDefinitionId !== null) {
                        setTimeout(checkMatch, 500);
                    }
                }

                function checkMatch() {
                    var wordCard = document.getElementById('card-word-' + selectedTermId);
                    var definitionCard = document.getElementById('card-definition-' + selectedDefinitionId);

                    if (selectedTermId === selectedDefinitionId) {
                        wordCard.classList.add('matched'); // Thêm lớp matched để ẩn thẻ
                        definitionCard.classList.add('matched'); // Thêm lớp matched để ẩn thẻ
                        matchedPairs++;
                        if (matchedPairs === 8) {
                            clearInterval(timerInterval);
                            alert("Congratulations! You matched all pairs.");
                        }
                    } else {
                        wordCard.classList.remove('selected');
                        definitionCard.classList.remove('selected');
                    }

                    selectedTermId = null;
                    selectedDefinitionId = null;
                }

                function startTimer() {
                    timerInterval = setInterval(function () {
                        seconds++;
                        document.getElementById('seconds').innerText = seconds;
                    }, 1000);
                }

                startTimer();

            </script>
        </div>
    </body>
</html>

