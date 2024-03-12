<%@page import="java.util.List"%>
<%@page import="model.QuestionSet"%>
<%@page import="model.Question"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Set</title>
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
                overflow-y: auto;
            }

            .title {
                text-align: center;
                margin-bottom: 20px;
            }

            #stickyLeft {
                position: -webkit-sticky; /* Cho Safari */
                position: sticky;
                top: 0; /* V? trí mà ph?n left s? d?ng l?i khi cu?n trang */
            }

            .quiz-set-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: flex-start;
                padding: 0;
                margin: 0;
            }



            .quiz-set-list-item {
                width: auto; /* T? ??ng ?i?u ch?nh kích th??c theo n?i dung */
                height: auto; /* T? ??ng ?i?u ch?nh kích th??c theo n?i dung */
                margin-bottom: 10px;
                cursor: pointer;
                padding: 8px;
                background-color: #ecf0f1;
                border-radius: 4px;
                transition: background-color 0.3s;
                color: #666666;
            }

            .quiz-set-list-item:hover {
                background-color: #bdc3c7;
            }

            .quiz-list {
                list-style: none;
                padding: 0;
                margin: 0;
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

            .actions {
                text-align: center;
                margin-top: 20px;
            }

            .btn {
                background-color: #34495e;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #2c3e50;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="../components/header.jsp" %>
        </div>
        <div class="box">
            <div class="left"  id="stickyLeft">
                <div class="title">
                    <h2>Questions</h2>
                </div>



                <ul class="quiz-set-list">
                    <%
                        List<Question> q = (List<Question>) request.getAttribute("questions");
                        if(q != null) {
                            for(int i = 0; i < q.size(); i++) {
                    %>
                    <li style="list-style-type: none" class="quiz-set-list-item" onclick="scrollToQuestion(<%=i%>)"><%=i+1%></li>
                        <%
                                }
                            }
                        %>
                </ul>

                <button class="btn">Add to class</button>

            </div>
            <div class="right">
                <div class="title">
                    <h2>Questions</h2>
                    <button class="btn" id="addQuestionBtn" onclick="createQuestion(${requestScope.qsid})">Add</button>
                </div>
                <div>
                    <input type="text" id="searchInput" placeholder="Search..." oninput="searchQuestions()">
                </div>
                <div class="quiz-list">
                    <%
                        if(q != null) {
                            for(int i = 0; i < q.size(); i++) {
                    %>
                    <div id="question<%=i%>" class="quiz-list-item">
                        <div class="quiz-list-item-question">
                            <h3>Question: <%=q.get(i).getQuestion()%></h3>
                            <%
                                for(int x = 0; x < q.get(i).getOptions().size(); x++) {
                            %>
                            <p <%= (q.get(i).getOptions().get(x).isIsCorrect() ? "style=\"color:red\"" : "") %>><%= q.get(i).getOptions().get(x).getOption() %></p>
                            <%
                                }
                            %>
                        </div>
                        <div class="actions">
                            <button class="btn" onclick="editQuestion(<%=q.get(i).getQuestionID()%>)">Edit</button>
                            <button class="btn" onclick="deleteQuestion(<%=q.get(i).getQuestionID()%>,<%=q.get(0).getQuestionSetID()%>)">Delete</button>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="footer">
            <%@include file="../components/footer.jsp" %>
        </div>
        <script>
            function scrollToQuestion(index) {
                var element = document.getElementById('question' + index);
                if (element) {
                    element.scrollIntoView({behavior: 'smooth', block: 'start'});
                }
            }

            function createQuestion(qsid) {
                var newUrl = '/quiz/createquestion?qsid=' + qsid;
                window.location.href = newUrl;
            }


            function editQuestion(qid) {
                var newUrl = '/quiz/editquestion?qid=' + qid;
                window.location.href = newUrl;
            }

            function deleteQuestion(qid, qsid) {
                var newUrl = '/quiz/deletequestion?qid=' + qid + "&qsid=" + qsid;
                if (confirm("Delete question:" + qid))
                    window.location.href = newUrl;
            }

            function searchQuestions() {
                var input = document.getElementById('searchInput').value.toLowerCase();
                var items = document.querySelectorAll('.quiz-list-item');

                items.forEach(function (item) {
                    var text = item.innerText.toLowerCase();
                    if (text.includes(input)) {
                        item.style.display = 'flex'; // Hi?n th? câu h?i phù h?p
                    } else {
                        item.style.display = 'none'; // ?n câu h?i không phù h?p
                    }
                });
            }


            


        </script>
    </body>
</html>