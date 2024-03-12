<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Term Set</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <link rel="stylesheet" href="./assets/css/create-term-set.css">
    </head>
    <body>

        <c:set var="info" value="${requestScope.termSetInfo}" />
        <%@include file="../components/header.jsp" %>
        <form class="mt-5 set-creation" action="edit-term-set" method="post">
            <input name="userId" value="${sessionScope.account.userId}" type="hidden">
            <input name="termSetId" value="${info.termSetId}" type="hidden">
            <div class="container">
                <div class="d-flex">
                    <h2 class="mb-4">Edit Term Set</h2>
                    <button value="Update" name="button" class="btn btn-primary ms-auto align-self-center" type="submit">Update</button>
                </div>
                <div class="input-group input-group-lg display-6 mb-4">
                    <input name="termSetName" type="text" class="form-control" value="${info.getTermSetName()}" placeholder="Enter the title for the set" required>
                </div>
                <div class="input-group mb-4">
                    <div class="description me-5">
                        <textarea name="termSetDescription" class="form-control" rows="3" placeholder="Description (optional)" >${info.getTermSetDescription()}</textarea>
                    </div>
                    <div class="d-flex align-items-center ms-auto">
                        <label for="visibility" name="visibility" class="me-2 ms-auto">Visibility</label>
                        <select class="form-select" style="width: 140px" id="visibility" name="isPublic">
                            <option value="1">Public</option>
                            <option value="0">Private</option>
                        </select>

                    </div>
                </div>
                <div id="term-set">
                    <c:forEach items="${info.getTerms()}" var="term">
                        <div class="term rounded-2 bg-white mb-4 pb-1">
                            <div class="px-3 d-flex float-end align-items-center">    
                                <button value="Delete" name="button" type="submit" class="btn btn-sm btn-danger my-2" onclick="setDeleteId(${term.getTermId()})">Delete</button>
                            </div>
                            <div class="input-group mb-4 px-4">                              
                                <input name="termIdChange" value="${term.termId}" type="hidden">
                                <textarea name="termChange" class="auto-resize-input form-control py-3 me-4" rows="1"  oninput="resizeInput()" placeholder="Term..." required>${term.getTerm()}</textarea>
                                <textarea name="definitionChange" class="auto-resize-input form-control py-3 ms-4" rows="1"  oninput="resizeInput()" placeholder="Definition..." required>${term.getDefinition()}</textarea>
                            </div>
                        </div>
                    </c:forEach>
                    <input type="hidden" name="deleteTermId" id="deleteTermId" value="">
                </div>
                <div class="text-center mt-4">
                    <button type="button" class="btn btn-success" onclick="addTerm()">Create term</button>
                </div>
                <div class="mt-4">
                    <button value="Update" name="button" type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </form>
        <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/create-term-set.js"></script>
        <script>s

                        function setDeleteId(termId) {
                            document.getElementById("deleteTermId").value = termId;
                        }
        </script>
    </body>
</html>
