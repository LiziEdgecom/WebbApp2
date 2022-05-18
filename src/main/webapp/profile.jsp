<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("getmess",null);
    }
%>

<!DOCTYPE html>
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
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="workouts.jsp">My Workouts</a></li>
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
<!-- Masthead-->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">

    </div>
</header>

<!-- Portfolio Section-->
<section class="sign-in">
    <div class="container">
        <input type="hidden" id="status" value="<%= request.getAttribute("status")  %>">
        <form method="post" action="uploadUser" class="register-form">

            <div class="myDiv" style="size: A5 " >


                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" aria-describedby="namehelp" placeholder="<%=request.getAttribute("name")%> " value="<%=request.getAttribute("name")%>" >
                <small id="namehelp" class="form-text text-muted">Reenter your name as you like. </small>
            </div>
            <div class="form-group">
                <label id ="weightL" for="weightL">Weight</label>
                <input type="text" class="form-control" id="weight" name="weight" placeholder="<%=request.getAttribute("weight")%>" value="<%=request.getAttribute("weight")%>">
            </div>
            <div class="form-group">
                <label id ="heightL" for="heightL">Height</label>
                <input type="text" class="form-control" id="height" name="height" placeholder="<%=request.getAttribute("height")%>" value="<%=request.getAttribute("height")%>">
            </div>

            <button type="submit" class="btn btn-primary">Upload</button>
        </form>
    </div>
</section>
<!-- About Section-->

<!-- Contact Section-->

<!-- Footer-->
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <!-- Footer Location-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Location</h4>
                <p class="lead mb-0">
                    2215 John Daniel Drive <br /> Clark, MO 65243
                </p>
            </div>
            <!-- Footer Social Icons-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Around the Web</h4>
                <a class="btn btn-outline-light btn-social mx-1" href="#!"><i
                        class="fab fa-fw fa-facebook-f"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-twitter"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-linkedin-in"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-dribbble"></i></a>
            </div>
            <!-- Footer About Text-->
            <div class="col-lg-4">
                <h4 class="text-uppercase mb-4">About Freelancer</h4>
                <p class="lead mb-0">
                    Freelance is a free to use, MIT licensed Bootstrap theme created
                    by <a href="http://startbootstrap.com">Start Bootstrap</a> .
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- Copyright Section-->
<div class="copyright py-4 text-center text-white">
    <div class="container">
        <small>Copyright &copy; Your Website 2021</small>
    </div>
</div>
<!-- Portfolio Modals-->
<!-- Portfolio Modal 1-->

<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetaler.css">
<script type="text/javascript">

    var status = document.getElementById("status").value;
    if(status=="success"){

        swal("Congrats","Account updated succesfully!","success");
    }
    else if(status=="failed") {

        swal("Sorry!","You have to fill your name!","error")
    }

</script>

</body>
</html>
