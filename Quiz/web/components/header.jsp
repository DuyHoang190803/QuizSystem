<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>


    .header_container {
        width: 100%;
        margin: 0 auto;
    }

    header {
        padding: 1.5rem 0;
        background-color: #FCFCFC;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 70px;

    }

    header .logo img {
        width: 120px;
        height: auto;
        padding-left: 40px;
    }


    .header_content{


        display: flex;
        justify-content: center;
        align-items: center;
    }

    .avatar {
        height: 100%;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
        border: solid 2px black;

    }





    .avatar-container {
        position: relative;
        display: inline-block;
        height: 100%;
    }


    .dropdown-content {
        margin-top: 15px;
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 120px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        right: 0;
        border-radius: 10px;
        text-align: center;
    }

    .dropdown-content a {
        display: block;
        padding: 10px 15px;
        text-decoration: none;
        color: black;
        white-space: nowrap;
    }

    .dropdown-content a:hover {
        background-color: #EEE9D7;
        border-radius: 10px;
    }



</style>

<script>
    function toggleDropdown() {
        var dropdownMenu = document.getElementById("dropdownMenu");
        if (dropdownMenu.style.display === "block") {
            dropdownMenu.style.display = "none";
        } else {
            dropdownMenu.style.display = "block";
        }
    }
</script>


<main>
    <div class="header_container">
        <header>

            <div class="logo">

                <c:set var="thisUser" value="${sessionScope.account}" scope="session"/>
                <c:choose>
                    <c:when test="${thisUser.roleId == 1}">
                        <a href="homes" class="text-dark text-decoration-none">
                            <img src="./assets/img/quiz-maker.svg" alt="Quizme Logo">
                        </a>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${thisUser.roleId == 3}">
                                <a href="teacherhome" class="text-dark text-decoration-none">
                                    <img src="./assets/img/quiz-maker.svg" alt="Quizme Logo">
                                </a>
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>

            </div>

            <div>
                <form action="search" method="get">
                    <input name="searchValue" style="height: 40px; width: 500px; border: 1px solid black; border-radius: 20px; background-color:#F6F6F6; padding-left: 10px; " placeholder="Search..."/>
                </form>

            </div>

            <div style="display: flex; padding-right: 40px;">
                <div>
                    <a href="note?user_id=${sessionScope.acc.userId}">
                        <div style="display: flex;align-items: center;justify-content: center;">
                            <img src="assets/img/notification_bell.jpg" alt="Notification" class="avatar">
                        </div>
                    </a>
                </div>


                <div class="avatar-container" style="height: 40px;">
                    <div style="display: flex;align-items: center;justify-content: center;">
                        <img src="${sessionScope.acc.avatar}" alt="Avatar" class="avatar" onclick="toggleDropdown()" >
                    </div>
                    <div class="dropdown-content" id="dropdownMenu">
                        <div>
                            <c:set var="thisUser" value="${sessionScope.account}" scope="session"/>
                            <c:choose>
                                <c:when test="${thisUser == null}">
                                    <a href="#" >Profile</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="view-student-set-list?userId=${thisUser.userId}">My library</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <a href="updateuser?id=${sessionScope.acc.userId}">Profile</a>
                        <a href="/quiz/logout">Log out</a>
                    </div>
                </div>
            </div>

        </header>
        <hr style="margin-top: 0; margin-bottom: 0; opacity: 30%;"/>
    </div>
</main>