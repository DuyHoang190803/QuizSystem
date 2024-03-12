<%-- 
    Document   : user-detail
    Created on : Jan 28, 2024, 10:48:22 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.*" %>
<c:set var="role" value="${empty param.role ? -1 : param.role}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/css/common.css">
        <link rel="stylesheet" href="../assets/css/admin-user-detail.css">
    </head>
    <body>
        <%@include file="../components/adminsidebar.jsp"%>
        <div class="main-content">
            <main>
                <div class="page-header">
                    <h1>User Detail</h1>
                    <small>Home / User manager/ User detail</small>
                </div>
                <div class="page-content">
                    <form method="post">
                        <div class="list-content">
                            <label>User ID</label>
                            <input type="text" name="useridprofile" value="${userd.userId}" disabled/>
                            <label>Full name</label>
                            <input type="text" name="fullName" value="${userd.fullName}"/>
                            <label>User name</label>
                            <input type="text" name="username" value="${userd.fullName}"/>
                            <label>Email</label>
                            <input type="text" name="email" value="${userd.email}"/>
                            <label>Date of Birth</label>
                            <input type="date" name="dob" value="${userd.dob}"/>
                            <label>Phone number</label>
                            <input type="tel" name="phone" value="${userd.phoneNumber}"/>

                        </div>
                        <p style="color: red">${profileStatus}</p>
                        <div>
                            <input class="btn-save" type="submit" name="action" value="Save Profile"/>
                        </div>
                    </form>
                    <form method="post">
                        <p>Account <strong style="color: red">${userd.email}</strong> is currently <strong style="color: red">${UserUtils.getRoleName(userd.roleId)}</strong>:</p>
                        <div class="list-content">
                            <label>New Role</label>
                            <select name="roleId" class="small-input" value="${userd.roleId}">
                                <option value="1" ${userd.roleId == 1 ? 'selected' : ''}>User</option>
                                <option value="2" ${userd.roleId == 2  ? 'selected' : ''}>Admin</option>
                                <option value="3" ${userd.roleId == 3  ? 'selected' : ''}>Teacher</option>
                            </select>
                        </div>
                        <p style="color: red">${grantRoleStatus}</p>
                        <div>
                            <input class="btn-save" type="submit" name="action" value="Grant Role"/>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
</html>
