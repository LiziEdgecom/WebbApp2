<%@ page import="java.util.List" %>
<%@ page import="com.workout.registration.User" %><%--
  Created by IntelliJ IDEA.
  User: lizon
  Date: 18. 5. 2022
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My workout</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="img/portfolio/favicon.ico" />
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
    <link href="index-styles.css" rel="stylesheet" />
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
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="workouts.jsp">My Workouts</a></li>

                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>

            </ul>
        </div>
    </div>
</nav>

<!-- Masthead-->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
        <img class="masthead-avatar mb-5" src="img/portfolio/barbell.png"
             alt="..." />
        <!-- Masthead Heading-->
        <h1 class="masthead-heading text-uppercase mb-0">Welcome To My Workout</h1>
        <!-- Icon Divider-->
        <div class="divider-custom divider-light">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Masthead Subheading-->
        <p class="masthead-subheading font-weight-light mb-0">Track your workouts with this simple website</p>
    </div>
</header>
<!-- Portfolio Section-->


    <table class="table table-bordered">
        <thead>
        <tr>

            <th>Name</th>
            <th>Email</th>
            <th>Height</th>
            <th>Weight</th>
            <th>Action</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>


       <%
            List<User> posts=(List<User>) request.getAttribute("listUser");
            for (User post: posts) {
                if (!post.getName().equals("admin")){
        %>
        <tr><td><%=post.getName()%></td>
            <td><%=post.getEmail()%></td>
            <td><%=post.getHeight()%></td>
            <td><%=post.getWeight()%></td>

            <td><a href="BanServlet?val1=<%=post.getId()%>"  >
                <% try {if(post.getBan().equals("1")){
                    %>  BAN  <%

                } else {  %>
               UNBAN<%
                }
                } catch (NullPointerException e){

                }%>


            </a></td>
            <td><a href="DeleteUserServlet?val1=<%=post.getId()%>"  >
                DELETE

            </a></td>
        </tr>
            <%}}%>

    </table>

</body>

</html>
