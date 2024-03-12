<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    :root {
        --main-color: #A162FD;
        --color-dark: #34425A;
        --text-grey: #B0B0B0;
    }

    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style-type: none;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    #menu-toggle {
        display: none;
    }

    .sidebar {
        position: fixed;
        height: 100%;
        width: 165px;
        left: 0;
        bottom: 0;
        top: 0;
        z-index: 100;
        background: var(--color-dark);
        transition: left 300ms;
    }

    .side-header {
        box-shadow: 0px 5px 5px -5px rgb(0 0 0 /10%);
        background: var(--main-color);
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .side-header h3, side-head span {
        color: #fff;
        font-weight: 400;
    }

    .side-content {
        height: calc(100vh - 60px);
        overflow: auto;
    }

    /* width */
    .side-content::-webkit-scrollbar {
        width: 5px;
    }

    /* Track */
    .side-content::-webkit-scrollbar-track {
        box-shadow: inset 0 0 5px grey;
        border-radius: 10px;
    }

    /* Handle */
    .side-content::-webkit-scrollbar-thumb {
        background: #b0b0b0;
        border-radius: 10px;
    }

    /* Handle on hover */
    .side-content::-webkit-scrollbar-thumb:hover {
        background: #B0B0B0;
    }

    .profile {
        text-align: center;
        padding: 2rem 0rem;
    }

    .bg-img {
        background-repeat: no-repeat;
        background-size: cover;
        border-radius: 50%;
        background-size: cover;
    }

    .profile-img {
        height: 80px;
        width: 80px;
        display: inline-block;
        margin: 0 auto .5rem auto;
        border: 3px solid #899DC1;
    }

    .profile h4 {
        color: #fff;
        font-weight: 500;
    }

    .profile h4 {
        color: #899DC1;
        font-weight: 600;
    }

    .sidebar {
        /*overflow-y: auto;*/
    }

    .side-menu ul {
        text-align: center;
    }

    .side-menu a {
        display: block;
        padding: 1rem 0rem;
    }

    .side-menu a:hover {
        background: #2B384E;
    }

    .side-menu a span {
        display: block;
        text-align: center;
        font-size: 1.7rem;
    }

    .side-menu a span, .side-menu a h4 {
        color: #899DC1;
    }

    #menu-toggle:checked ~ .sidebar {
        width: 60px;
    }

    #menu-toggle:checked ~ .sidebar .side-header span {
        display: none;
    }

    #menu-toggle:checked ~ .main-content {
        margin-left: 60px;
        width: calc(100% - 60px);
    }

    #menu-toggle:checked ~ .main-content header {
        left: 60px;
    }

    #menu-toggle:checked ~ .sidebar .profile,
    #menu-toggle:checked ~ .sidebar .side-menu a h4 {
        display: none;
    }

</style>

<input type="checkbox" id="menu-toggle">
<div class="sidebar">
    <div class="side-header">
        <img src="../assets/img/quiz-maker.svg" alt="Quizme Logo" style="max-height: 100%">
    </div>

    <div class="side-content">
        <c:if test="${sessionScope.account.roleId == 2}">
            <div class="profile">
                <div class="profile-img bg-img" style=""></div>
                <h4>${sessionScope.account.userName}</h4>
            </div>
        </c:if>

        <div class="side-menu">
            <ul>
                <li>
                    <a href="">
                        <h4>Dashboard</h4>
                    </a>
                </li>
                <li>
                    <a href="admin-user-list">
                        <h4>User</h4>
                    </a>
                </li>
                <li>
                    <a href="">
                        <h4>Class</h4>
                    </a>
                </li>
                <li>
                    <a href="">

                        <h4>Projects</h4>
                    </a>
                </li>
                <li>
                    <a href="/quiz/logout">
                        <h4>Logout</h4>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>