<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create a New Terms Set</title>
        <link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/common.css">
        <link rel="stylesheet" href="./assets/css/create-term-set.css">
    </head>

    <body>
        <%@include file="../components/header.jsp" %>
        <form class="mt-5 set-creation" action="create-term-set" method="post">
            <input name="userId" value="${thisUser.userId}" type="hidden">
            <div class="container">
                <div class="d-flex">
                    <h2 class="mb-4">Creating a new terms set</h2>
                    <button class="btn btn-primary ms-auto align-self-center" type="submit">Create</button>
                </div>
                <div class="input-group input-group-lg display-6 mb-4">
                    <input name="termSetName" type="text" class="form-control" placeholder="Enter the title for the set" required>
                </div>
                <div class="input-group mb-4">
                    <div class="description me-5">
                        <textarea name="termSetDescription" class="form-control" rows="3" placeholder="Description (optional)"></textarea>
                    </div>
                    <div class="d-flex align-items-center ms-auto">
                        <label for="visibility" name="visibility" class="me-2 ms-auto">Visibility</label>
                        <select class="form-select" style="width: 140px" id="visibility" name="isPublic">
                            <option value="1">Public</option>
                            <option value="0">Private</option>
                        </select>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#importModal">
                            Import
                        </button>
                    </div>
                </div>
                <div id="term-set">
                    <!-- Terms will be added here by JavaScript -->
                </div>
                <div class="text-center mt-4">
                    <button type="button" class="btn btn-success" onclick="addTerm()">Add term</button>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </div>
        </form>

        <div class="modal fade" id="importModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header align-items-start">
                        <h2 class="modal-title text-center flex-grow-1">Import a set from an external site!</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <label for="betweenTermAndDef" class="col-form-label">Between term and definition</label>
                                <input type="text" class="form-control" id="betweenTermAndDef" placeholder="Ex: ' -'"
                                       value=" - ">
                            </div>
                            <div class="mb-3">
                                <label for="betweenRows" class="col-form-label">Between rows</label>
                                <input class="form-control" id="betweenRows" placeholder="Ex: '\n\n'" value="\n\n"></input>
                            </div>
                            <div class="mb-3">
                                <label for="exportedSet" class="col-form-label">Exported set</label>
                                <textarea id="exportedSet" class="form-control"
                                          placeholder="Paste your exported set here..."></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-import ms-3">Import</button>
                    </div>

                </div>
            </div>
        </div>
        <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/create-term-set.js"></script>
        <script>
                        function validateTermSet() {
                            const terms = document.querySelectorAll('.term');
                            let isValid = false;

                            for (let i = 0; i < terms.length; i++) {
                                const termInput = terms[i].querySelector('textarea[name="term"]');
                                const definitionInput = terms[i].querySelector('textarea[name="definition"]');

                                // Check if either the term or definition has content
                                if (termInput.value.trim() !== '' || definitionInput.value.trim() !== '') {
                                    isValid = true;
                                } else {
                                    // Add error highlighting
                                    termInput.classList.add('is-invalid');
                                    definitionInput.classList.add('is-invalid');
                                }
                            }

                            if (!isValid) {
                                alert("Please enter at least one term and its definition.");
                            }

                            return isValid;
                        }

                        // Modify form's onsubmit
                        document.querySelector('.set-creation').addEventListener('submit', function (event) {
                            if (!validateTermSet()) {
                                event.preventDefault(); // Prevent form submission if invalid
                            }
                        });
        </script>
    </body>

</html>
