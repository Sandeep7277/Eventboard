<%@page import="config.DbHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:include flush="true" page="mheader.jsp" />
<%
	String id = session.getAttribute("id").toString();
        List<Map<String, String>> data = DbHelper.findrecords("students", "rollno=" + id);
        Map<String, String> map = data.get(0);
%>
<div class="container-fluid" style="min-height: 88vh;">
	<div class="card shadow" style="margin-top: 60px">
		<div class="card-body">
			<h4 class="p-2" style="border-bottom: 2px solid green">Student
				Profile</h4>
			<div class="row">
				<div class="col-sm-4 mx-auto mt-3">
					<form method="post" action="profileupdate.jsp">
						<table class="table table-bordered table-sm">
							<tr>
								<th style="width: 200px;">Reg. no</th>
								<th><%= map.get("rollno")%></th>
							</tr>
							<tr>
								<th>Student Name</th>
								<th><input type="text" name="name"
									class="form-control form-control-sm"
									value="<%= map.get("name")%>"></th>
							</tr>
							<tr>
								<th>Course</th>
								<th><%= map.get("course")%></th>
							</tr>
							<tr>
								<th>Email ID</th>
								<th><input type="email" name="email"
									class="form-control form-control-sm"
									value="<%= map.get("email")%>"></th>
							</tr>
							<tr>
								<th>Contact Number</th>
								<th><input type="text" name="phone" maxlength="10"
									class="form-control form-control-sm"
									value="<%= map.get("phone")%>"></th>
							</tr>
							<tr>
								<th colspan="2"><button
										class="btn btn-sm btn-primary float-right">Update
										Profile</button></th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="mfooter.jsp" />