<!DOCTYPE html>
<html>
<head>
    <title>Forget Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
       
        main {
            width: 40%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
        }
      
    </style>
</head>
<body>
    
    <main>
        <h1>Reset your password</h1>
        <p>Please enter your email address below. We'll search your account and send you a password reset email.</p>
        <form>
            <label for="email">EMAIL ADDRESS</label>
            <input type="email" id="email" name="email" value="HoangDHE176159@fpt.edu.vn">
            <button type="submit">Submit password reset</button>
        </form>
    </main>
    
</body>
</html>
