<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.Notification"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        h1 {
            margin: 0;
            text-align: center; /* Căn giữa tiêu đề */
            padding: 20px; /* Thêm khoảng cách giữa tiêu đề và các khối thông tin */
        }

        .note-list {
            display: flex;
            flex-direction: column; /* Hiển thị các khối theo chiều dọc */
            align-items: center; /* Căn giữa các khối */
        }

        .note {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 10px;
            max-width: 400px; /* Giới hạn chiều rộng của mỗi khối */
            width: 100%; /* Đảm bảo rằng khối không vượt quá chiều rộng tối đa */
        }

        .note.is-read {
            background-color: rgba(200, 255, 200, 0.8);
        }

        h2 {
            color: #333;
            margin: 0;
        }

        .created-at {
            color: #444;
            margin-top: 5px;
        }
    </style>
    <body>
        <%@include file="./components/header.jsp" %>
        <%
            List<Notification> list= (List<Notification>) session.getAttribute("noteList");
            %>
        <h1>Notifications</h1>
        <div class="note-list">
            
            <% 
            for(int i=list.size()-1;i>=0;i--){
            %>
            <a style="text-decoration: none"; href="redirect?id=<%=list.get(i).getId()%>">
            <div class="<%=list.get(i).isIs_read()==true?"note is-read":"note"%>">
                <h2><%=list.get(i).getMessage()%></h2>
                <p class="created-at">Created at: <%=list.get(i).getCreated_at()%></p>
            </div>
            </a>
            <%
                }
            %>
            
        </div>

        <%@include file="./components/footer.jsp" %>
    </body>
</html>
