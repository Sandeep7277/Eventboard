<!DOCTYPE html>
<html>
<head>
<%
            if (session.getAttribute("id") == null) {
                response.sendRedirect("Login.jsp");
            }
        %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event Board</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/simple-notify.min.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/simple-notify.min.js" type="text/javascript"></script>
<style>
.nav-item a {
	color: white !important;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		style="box-shadow: 0 0 2px 2px white">
		<a class="navbar-brand" href="index.jsp">Event Board</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="index.jsp#about">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="index.jsp#event">Events</a>
				</li>
				<% if (session.getAttribute("userid") == null) { %>
				<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Register.jsp">Register</a>
				</li>
				<% } else { %>
				<li class="nav-item"><a class="nav-link" href="StudentHome.jsp">Dashboard</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a>
				</li>
				<% }%>
				<li class="nav-item"><a class="nav-link"
					href="index.jsp#contact">Contact Us</a></li>

			</ul>
		</div>
	</nav>
	<jsp:include flush="true" page="msg.jsp" />