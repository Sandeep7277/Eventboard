<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp" />
<button type="button" data-target="#tadd" data-toggle="modal"
	class="btn btn-success btn-sm float-right">Add New</button>
<h4 class="p-2" style="border-bottom: 2px solid green">Lecturers</h4>
<div class="container-fluid">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Reg. no</th>
				<th>Lecturer's Name</th>
				<th>City</th>
				<th>Designation</th>
				<th>Email ID</th>
				<th>Phone</th>
				<th>Operation</th>
			</tr>
		</thead>
		<tbody>
			<%
         	List<Map<String,String>> list=DbHelper.allrecords("teachers");
                  for(Map<String,String> map : list){
         %> 
			<tr>
				<td><%= map.get("tid") %></td>
				<td><%= map.get("name") %></td>
				<td><%= map.get("city") %></td>
				<td><%= map.get("designation") %></td>
				<td><%= map.get("email") %></td>
				<td><%= map.get("phone") %></td>
				<td><a href="dellect?tid=<%= map.get("tid") %>"
					onclick="return confirm('Are you sure to delete this record ?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</div>
<div class="modal fade" id="tadd">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="SaveStaff.jsp">
				<div class="modal-header">
					<h4>Add New Lecturer</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" class="form-control" name="tid"
							placeholder="Lecturer ID">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="name"
							placeholder="Lecturer Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="city"
							placeholder="City">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="designation"
							placeholder="Designation">
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
					<button class="btn btn-primary float-right">Save Lecturer</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />
