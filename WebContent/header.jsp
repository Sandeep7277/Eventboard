<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables.css" rel="stylesheet" type="text/css"/>        
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/all.css" rel="stylesheet" type="text/css"/>
        <link href="css/simple-notify.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/all.js" type="text/javascript"></script>
        <script src="js/simple-notify.min.js" type="text/javascript"></script>
        <style>
            .list-group-item:hover{
                background-color: lightgray;                
            }
            .list-group-item:hover a{
                color:white;
                text-decoration: none;
            }
            .list-group-item{
                border-right:1px solid black !important;
                padding:7px;
            }
            .list-group-item a{
                color:black;
            }
            .list-group-item.active > a{
            	color:white !important;
            }
        </style>
    </head>
    <body>
        <%
            String role = session.getAttribute("role").toString();
            String cclass = "";
            if (role.equals("admin")) {
                cclass = "bg-dark";
            } else if (role.equals("lecturer")) {
                cclass = "bg-danger";
            } 
            String pagename=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1).trim();
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2 p-0 <%= cclass%> text-center" style="height: 100vh;">
                    <img src="images/admin.jpg" class="img-thumbnail rounded-circle m-2" style="height:150px;">
                    <ul class="list-group list-group-flush text-left">

                        <% if (role.equals("admin")) { %>
                        <li class="list-group-item <%= pagename.equals("AdminHome.jsp") ? "active" : "" %>"><a class="d-block" href="AdminHome.jsp">Home</a></li>
                        <li class="list-group-item <%= pagename.equals("Categories.jsp") ? "active" : "" %>"><a class="d-block" href="Categories.jsp">Categories</a></li>
                        <li class="list-group-item <%= pagename.equals("Events.jsp") ? "active" : "" %>"><a class="d-block" href="Events.jsp">Events</a></li>
                        <li class="list-group-item <%= pagename.equals("BookedEvents.jsp") ? "active" : "" %>"><a class="d-block" href="BookedEvents.jsp">Booked Events</a></li>
                        <li class="list-group-item <%= pagename.equals("Users.jsp") ? "active" : "" %>"><a class="d-block" href="Users.jsp">Users</a></li>
                        <li class="list-group-item <%= pagename.equals("Lecturers.jsp") ? "active" : "" %>"><a class="d-block" href="Lecturers.jsp">Lecturers</a></li>
                        <li class="list-group-item <%= pagename.equals("Students.jsp") ? "active" : "" %>"><a class="d-block" href="Students.jsp">Students</a></li>
                        <li class="list-group-item">
                            <a href="#" class="d-block" data-target="#updateprofile" data-toggle="modal">Change Profile</a>
                        </li>
                        
                            <% } else if (role.equals("lecturer")) { %>
                        <li class="list-group-item <%= pagename.equals("LecturerHome.jsp") ? "active" : "" %>"><a class="d-block" href="LecturerHome.jsp">Home</a></li>
                        <li class="list-group-item <%= pagename.equals("Events.jsp") ? "active" : "" %>"><a class="d-block" href="Events.jsp">Events</a></li>
                            <% }%>  
                        <li class="list-group-item">
                            <a href="#" class="d-block" data-target="#changepwd" data-toggle="modal">Change Password</a>
                        </li>
                        <li class="list-group-item"><a class="d-block" href="Logout.jsp">Logout</a></li>
                    </ul>
                </div>
                <div class="col-sm-10 p-0">
                    <h5 class="float-right text-white m-3">Welcome ${sessionScope.uname}</h5>
                    <div class="jumbotron p-3 mb-1 text-center <%= cclass%> text-white rounded-0">
                        <h4>Event Board</h4>
                    </div>
                    <jsp:include flush="true" page="msg.jsp"/>
                    <div class="container-fluid">
                    	<div class="card shadow" style="min-height:90vh;">
                    		<div class="card-body">
                    	