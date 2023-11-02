<%@page import="config.DbHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:include flush="true" page="mheader.jsp" />
<div class="p-1"></div>
<div class="container-fluid">
	<%
    	String id = session.getAttribute("id").toString();
            List<Map<String, String>> data = DbHelper.findrecords("students", "rollno=" + id);
            Map<String, String> map = data.get(0);
    %>
	<h2>Student Dashboard</h2>
	<div class="row">
		<div class="col-sm-8">
			<h4>Booked Event</h4>
			<div class="row">
				<%
                	List<Map<String, String>> list = DbHelper.findrecords("events", "eventid in(SELECT eventid from bookedevent WHERE id='"+id+"')");
                                    for (Map<String, String> map2 : list) {
                                        List<Map<String, String>> list2 = DbHelper.findrecords("category", "catid=" + map2.get("catid"));
                                        Map<String, String> map3 = list2.get(0);
                                        String cname = map3.get("catname");
                %>
				<div class="col-md-6">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top" style="height: 200px;"
							src="events/<%= map2.get("photo")%>" data-holder-rendered="true">
						<div class="card-body">
							<h5><%= cname%></h5>
							<p class="my-0">
								Date : From
								<%= map2.get("startdate")%>
								to
								<%= map2.get("endate")%></p>
							<p>
								Time : From
								<%= map2.get("starttime")%>
								to
								<%= map2.get("endtime")%></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="leaveevent.jsp?eventid=<%= map2.get("eventid")%>"
										class="btn btn-sm btn-outline-danger">Leave Event</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<% }
                %>
			</div>
		</div>
		<div class="col-sm-4">
			<table class="table table-bordered">
				<tr>
					<th style="width: 200px;">Reg. no</th>
					<th><%= map.get("rollno")%></th>
				</tr>
				<tr>
					<th>Student Name</th>
					<th><%= map.get("name")%></th>
				</tr>
				<tr>
					<th>Course</th>
					<th><%= map.get("course")%></th>
				</tr>
				<tr>
					<th>Email ID</th>
					<th><%= map.get("email")%></th>
				</tr>
				<tr>
					<th>Contact Number</th>
					<th><%= map.get("phone")%></th>
				</tr>
				<tr>
					<th colspan="2"><a href="editprofile.jsp"
						class="btn btn-sm btn-primary float-right">Edit Profile</a> <a
						href="#" data-target="#changepwd" data-toggle="modal"
						class="btn btn-primary btn-sm float-right mr-2">Change
							Password</a></th>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="modal fade" id="changepwd">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<form action="ChangePwd.jsp" method="post">
				<div class="modal-header">
					<h4>Change Password</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="password" name="opwd" class="form-control"
							placeholder="Current Password">
					</div>
					<div class="form-group">
						<input type="password" name="pwd" class="form-control"
							placeholder="New Password">
					</div>
					<div class="form-group">
						<input type="password" name="npwd" class="form-control"
							placeholder="Confirm Password">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm float-right">Change
						Password</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="mfooter.jsp" />