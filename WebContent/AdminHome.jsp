<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp" />

<h4 class="p-2" style="border-bottom: 2px solid green">Admin
	Dashboard</h4>

<div class="row">
	<div class="col-sm-3 text-white text-center">
		<div class="card bg-primary p-3">
			<h3><%=DbHelper.count("students")%></h3>
			<h4>Students</h4>
		</div>
	</div>
	<div class="col-sm-3 text-white text-center">
		<div class="card bg-danger p-3">
			<h3><%=DbHelper.count("teachers")%></h3>
			<h4>Lecturers</h4>
		</div>
	</div>
	<div class="col-sm-3 text-white text-center">
		<div class="card bg-secondary p-3">
			<h3><%=DbHelper.count("events")%></h3>
			<h4>Events</h4>
		</div>
	</div>
	<div class="col-sm-3 text-white text-center">
		<div class="card bg-info p-3">
			<h3><%=DbHelper.count("users")%>
			</h3>
			<h4>Users</h4>
		</div>
	</div>

</div>

<jsp:include flush="true" page="footer.jsp" />