<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
                box-sizing: border-box;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                color: #fff;
                background-color: #000;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s, border-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #9B68FF;
            }




        </style>


    </head>
    <body>

        <div>
            <form action="login" method="post">      
                <div>
                    <div style=" text-align:  left; ">
                        <input type="submit" value="Back" style="width: 20%; ">
                        
                    </div>
                    <div>
                        <h2>Change Password</h2>
                    </div>
                    <div>
                        <input placeholder="Current Password" type="password" id="password" name="New Password" required>
                        <input placeholder="New Password" type="password" id="password" name="New Password" required>
                        <input placeholder="Confirm New Password" type="password" id="password" name="password" required>
                    </div>

                    <hr>
                    <div>
                        <input type="submit" value="Change Password">

                    </div>
                    <div>
                        <c:if test="${error!=null}">
                            <div class="message">
                                <h4 style="color: red;">${error}</h4>
                            </div>
                        </c:if>
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>