<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>
        <link rel="stylesheet" href="assets/css/user-profile.css">  
    </head>
    <body>

        
        <div class="container">
            <a href="homes" class="atag">Go back</a>
            <h2>Edit Profile</h2>
            <div class="profile-picture" onclick="openPopup()">
            <img src="${sessionScope.acc.avatar}" alt="Profile Picture" id="previewImage">
        </div>
            
            <div class="popup" id="imagePopup">
            <h2 style="margin-bottom: 20px;">Choose your new avatar:</h2>

            <form id="avatarForm" action="processAvatarSelection" method="post">

                <%
                // Đường dẫn đến thư mục chứa ảnh
                String imgDirectoryPath = getServletContext().getRealPath("/assets/avatar");

                // Danh sách các tên file trong thư mục ảnh
                String[] imageFileNames = new File(imgDirectoryPath).list();

                // In ra đường dẫn tương đối của mỗi ảnh và hiển thị ảnh
                for (String imageName : imageFileNames) {
                    String relativePath = "assets/avatar/" + imageName;
                %>

                

                <input type="radio" id="<%= relativePath %>" name="selectedAvatar" value="<%= relativePath %>">
                <label  for="<%= relativePath %>" style="cursor: pointer;"><img src="<%= relativePath %>" alt="<%= relativePath %>"></label>

                <%
                    }
                %>
                <input type="hidden" id="hiddenId" name="userId" value="${sessionScope.acc.userId}">
                <br>
                <button type="submit">Submit</button>
            </form>
        </div>

        
            <form action="updateuser" method="post">



                <div class="profile-form"  >




                    <div style="margin-bottom: 8px;font-weight: bold;">
                        Full Name:
                    </div>
                    <input type="text" id="fullname" name="fullName" value="${sessionScope.acc.fullName}">

                    <div style="margin-bottom: 8px;font-weight: bold;">
                        User Name:
                    </div>
                    <input type="text" id="username" name="userName" value="${sessionScope.acc.userName}">

                    <div style="margin-bottom: 8px;font-weight: bold;">
                        Phone Number:
                    </div>
                    <input type="number" id="phone" name="phoneNumber" value="${sessionScope.acc.phoneNumber}">

                    <div style="margin-bottom: 8px;font-weight: bold;">
                        Date of Birth:
                    </div>
                    <input type="date" id="dob" name="dob" value="${sessionScope.acc.dob}">
                    <input type="hidden" id="hiddenId" name="userId" value="${sessionScope.acc.userId}">
                    <div><h3 style="color: red">${requestScope.mess}</h3></div>


                    <div>
                        <input type="submit" value="Save Changes" class="custom-button"/>
                    </div>
                </div>
            </form>


        </div>

        <script>
            function openPopup() {
                var popup = document.getElementById('imagePopup');
                popup.style.display = 'block';
            }

            document.getElementById('avatarForm').addEventListener('submit', function (event) {
                var selectedAvatar = document.querySelector('input[name="selectedAvatar"]:checked');

                
            });


        </script>

    </body>
</html>
