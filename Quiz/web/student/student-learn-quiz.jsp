<!DOCTYPE html>
<html>
    <head>
        <title>Online Quiz</title>
        <style>
            body {
                background-color: #cccccc;
                color: #666666;
                font-family: Arial, sans-serif;
                height: 100vh;
                margin: 0;
            }
            .quizz{
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .quiz-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 60%;
                margin: auto;

            }
            .question {
                margin: 20px 0;
                font-size: 1.2em;
                color: #000000;
            }
            .options {
                list-style-type: none;
                padding: 0;
            }
            .options li {
                margin: 10px 0;
                background-color: #333333;
                padding: 10px;
                border-radius: 4px;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .options li:hover {
                background-color: #4CAF50;
            }

            button {              
                width: 100%;
                padding: 10px;
                margin-top: 20px;
                background-color: #000000;
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                transition-duration: 0.4s;
                cursor: pointer;
            }
            button:hover {
                background-color: #4CAF50;
                color: white;
            }

            .quizz-exit-button button{
                margin-left: 40px;
                width: 10%;
                border-radius: 10px;
            }




        </style>
    </head>
    <body>



        <div class="quizz">

            <div class="quizz-exit-button">
                <button onclick="exitQuiz()">Exit</button>
            </div>
            <div class="quiz-content">
                <div class="question">
                    <h2>What is an essay?</h2>
                </div>
                <div>
                    <ul class="options">
                        <li>A piece of writing with one paragraph around one topic</li>
                        <li>A piece of writing with one paragraph around multiple topics</li>
                        <li>A piece of writing with multiple paragraphs around several topics</li>
                        <li>A piece of writing with multiple paragraphs focused around one topic</li>
                    </ul>
                </div>                                            
                <div style="display: flex; justify-content: space-between; margin-top: 50px;">
                    <button onclick="continueQuiz()" style="width: 30%; margin: 0 2px;  border-radius: 10px;">OK</button>
                    <button onclick="continueQuiz()" style="width: 30%; margin: 0 2px;  border-radius: 10px;">Half OK</button>
                    <button onclick="continueQuiz()" style="width: 30%; margin: 0 2px;  border-radius: 10px;">Not OK</button>
                </div>              
            </div>
        </div>


        <script>
            function continueQuiz() {

            }
        </script>
    </body>
</html>
