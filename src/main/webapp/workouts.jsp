<%--
  Created by IntelliJ IDEA.
  User: lizon
  Date: 15. 5. 2022
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>My workout</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/img/portfolio/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
          rel="stylesheet" type="text/css" />
    <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index-styles.css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
<!-- Navigation-->
<nav
        class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
        id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top">My workout</a>
        <button
                class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            Menu <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Home</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
                <li class="nav-item mx-0 mx-lg-1 bg-danger" ><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="profile.jsp"><%=session.getAttribute("name") %></a></li>

            </ul>
        </div>
    </div>
</nav>
<main>
    <!-- Start DEMO HTML (Use the following code into your project)-->
    <div class=" container rounded-3 border border-2 border-dark my-5 bg-white" style="height:auto;">
        <div style="margin-top: 10%">

            <div class="row">

                <div class="col-5">
                    <!-- <i onclick="addList()" class=" btn btn-dark rounded-pill fas fa-4x fa-plus-circle "></i> -->
                    <a class="btn btn-primary" href="AddWorkoutJ.jsp" role="button">New workout</a>



                    </div>

                </div>
            </div>
        </div>
        <hr>
        <div class="row rounded bg-white">
            <div class=" col-12">
                <ul class=" list-group" id="list"></ul>
            </div>
        </div>

    </div>
    <!-- END EDMO HTML (Happy Coding!)-->
</main>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>


<script src="js/exercise.js"></script>
</body>

</html>