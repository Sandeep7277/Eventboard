<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp" />

<button type="button" data-target="#sadd" data-toggle="modal"
	class="btn btn-success btn-sm float-right">Add New</button>
<h4 class="p-2" style="border-bottom: 2px solid green">Students</h4>
<div class="container-fluid">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Reg. no</th>
				<th>Student Name</th>
				<th>City</th>
				<th>Course</th>
				<th>Email ID</th>
				<th>Phone</th>
				<th>Operation</th>
			</tr>
		</thead>
		<tbody>
			<%
        	List<Map<String,String>> list=DbHelper.allrecords("students");
                for(Map<String,String> map : list){
        %>
			<tr>
				<td><%= map.get("rollno") %></td>
				<td><%= map.get("name") %></td>
				<td><%= map.get("city") %></td>
				<td><%= map.get("course") %></td>
				<td><%= map.get("email") %></td>
				<td><%= map.get("phone") %></td>
				<td><a href="DeleteStudent?rollno=<%= map.get("rollno") %>"
					onclick="return confirm('Are you sure to delete this record ?')"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</div>
<div class="modal fade" id="sadd">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="SaveStudent.jsp">
				<div class="modal-header">
					<h4>Add New Student</h4>
					<button type="button" data-dismiss="modal" class="close">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" class="form-control" name="rollno"
							placeholder="Reg. no">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="name"
							placeholder="Student Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="city"
							placeholder="City">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="course"
							placeholder="Class">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="email"
							placeholder="Email ID">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="phone"
							placeholder="Phone Number">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary float-right">Save Student</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />
