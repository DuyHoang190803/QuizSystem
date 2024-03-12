<%@page import="java.util.List"%>
<%@page import="model.QuestionSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                padding: 20px;
            }

            .question-set {
                background-color: #f0f0f0;
                border-radius: 10px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                width: 200px;
            }

            .question-set h3 {
                font-size: 18px;
                margin-bottom: 10px;
            }

            .btn-view,
            .btn-delete {
                background-color: #3498db;
                border: none;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 5px;
            }

            .btn-view:hover,
            .btn-delete:hover {
                background-color: #2980b9;
            }
            
            .create-new-set {
            background-color: #f0f0f0;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .create-new-set h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .btn-create-new-set {
          background-color: #3498db;
                border: none;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 5px;
        }

        .btn-create-new-set:hover {
            background-color: #2980b9;
        }

        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="../components/header.jsp" %>
        </div>

        <div class="container">
            <%
                List<QuestionSet> qs = (List<QuestionSet>) request.getAttribute("qs");
                if(qs!=null){
                for(int i=0;i<qs.size();i++){
            %> 
            <div class="question-set">
                <h3><%=qs.get(i).getQuestionSetName()%></h3>
                <h3><%=qs.get(i).isIsPublic()==true?"Public":"Private"%></h3>
                <button class="btn-view" onclick="redirectToViewQuestions(<%=qs.get(i).getQuestionSetId()%>)">View</button>
                <button class="btn-delete" onclick="deleteQuestionSet(<%=qs.get(i).getQuestionSetId()%>)">Delete</button>
            </div>
            <%
                }}
            %>
            <div class="create-new-set">
            <button class="btn-create-new-set" onclick="showCreateNewForm()">Create New Set</button>
            <div id="createNewForm" style="display: none;">
                <form action="/quiz/createquestionset" method="post">
                    <label for="setName">Set Name:</label>
                    <input type="text" id="setName" name="setName" required><br>
                    <label for="isPublic"> Public:</label>
                    <input type="checkbox" name="isPublic" value="true"/>
                    <!-- Thêm các trường khác tại đây nếu cần -->
                    <button type="submit" class="btn-submit">Create</button>
                </form>
            </div>
        </div>
        </div>
        


        <div class="footer">
            <%@include file="../components/footer.jsp" %>
        </div>
        <script>
function redirectToViewQuestions(qsid) {
        // Tạo URL mới chỉ với phần đường dẫn '/quiz/viewquestions'
        var newUrl = '/quiz/viewquestions?qsid=' + qsid;
        // Thay đổi địa chỉ trang web
        window.location.href = newUrl;
    }
    
    function deleteQuestionSet(qsid) {
        // Tạo URL mới chỉ với phần đường dẫn '/quiz/viewquestions'
        var newUrl = '/quiz/deletequestionset?qsid=' + qsid;
        // Thay đổi địa chỉ trang web
        if(confirm("Delete set "+qsid+" ?"))
        window.location.href = newUrl;
    }
            function showCreateNewForm() {
                var createNewForm = document.getElementById("createNewForm");
                if (createNewForm.style.display === "none") {
                    createNewForm.style.display = "block";
                } else {
                    createNewForm.style.display = "none";
                }
            }
        </script>
    </body>
</html>