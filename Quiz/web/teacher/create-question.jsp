<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f8f8f8;
        }
        
        #addQuestionForm {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        label {
            font-weight: bold;
        }
        
        textarea, input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .option-container {
            margin-bottom: 10px;
        }
        
        input[type="checkbox"] {
            margin-right: 10px;
        }
        
        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    
        
    </style>
</head>
<body>
    <%
            if((String)request.getAttribute("mess")!=null){
        %>
        <script>
            // Ki?m tra xem có thông ?i?p t? servlet hay không
            var mess = "<%= (String)request.getAttribute("mess") %>";
            if (mess && mess.trim() !== "") {
                // Hi?n th? thông ?i?p trong c?a s? alert
                alert(mess);
            }
            </script>
            <%}%>
    <div id="addQuestionForm">
        <form id="questionForm" action="createquestion" method="post">
            <label for="question">Question:</label><br>
            <textarea id="question" name="question" rows="4" cols="50" required></textarea><br><br>

            <div class="option-container">
                <input type="checkbox" id="option1_correct" name="correct_option[]" value="option1">
                <label for="option1">Option A:</label>
                <input type="text" id="option1" name="option1" required><br>
            </div>
            <div class="option-container">
                <input type="checkbox" id="option2_correct" name="correct_option[]" value="option2">
                <label for="option2">Option B:</label>
                <input type="text" id="option2" name="option2" required><br>
            </div>
            <div class="option-container">
                <input type="checkbox" id="option3_correct" name="correct_option[]" value="option3">
                <label for="option3">Option C:</label>
                <input type="text" id="option3" name="option3" required><br>
            </div>
            <div class="option-container">
                <input type="checkbox" id="option4_correct" name="correct_option[]" value="option4">
                <label for="option4">Option D:</label>
                <input type="text" id="option4" name="option4" required><br>
            </div>

            <input type="number" hidden name="questionSetId" value="${requestScope.qsid}">

            
            <input type="submit" value="Submit">
        </form>
    </div>
    <script>
    document.getElementById("questionForm").onsubmit = function() {
        // Ki?m tra xem câu h?i ?ã ???c nh?p hay ch?a
        var question = document.getElementById("question").value.trim();
        if (question === "") {
            alert("Please enter the question.");
            return false; // Ng?n ch?n vi?c submit form
        }

        // Ki?m tra xem ít nh?t m?t ô checkbox ?ã ???c ch?n hay không
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var checkedCount = 0;
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkedCount++;
            }
        }
        if (checkedCount === 4) {
            alert("Please select at least one correct option that is not all four options.");
            return false; // Ng?n ch?n vi?c submit form
        }
        if(checkedCount === 0) {
            alert("Please select at least one correct option");
            return false;
        }
        // Ki?m tra tính duy nh?t c?a các l?a ch?n
        var optionValues = [];
        var optionInputs = document.querySelectorAll('input[type="text"]');
        for (var i = 0; i < optionInputs.length; i++) {
            var optionValue = optionInputs[i].value.trim();
            if (optionValue === "") {
                alert("Please enter option " + (i + 1) + ".");
                return false; // Ng?n ch?n vi?c submit form
            }
            if (optionValues.includes(optionValue)) {
                alert("Options must be unique.");
                return false; // Ng?n ch?n vi?c submit form
            }
            optionValues.push(optionValue);
        }
    };
</script>
</body>
</html>