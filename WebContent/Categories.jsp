<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp" />

<h4 class="p-2" style="border-bottom: 2px solid green">Categories</h4>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-8">
			<table class="table table-bordered table-sm">
				<thead class="table-dark">
					<tr>
						<th>Category ID</th>
						<th>Category Name</th>
						<th>Operation</th>
					</tr>
				</thead>
				<tbody>
					<%
                    	List<Map<String, String>> list = DbHelper.allrecords("category");
                                            for (Map<String, String> map : list) {
                    %>
					<tr>
						<td><%= map.get("catid")%></td>
						<td><%= map.get("catname")%></td>
						<td><a href="Deletecat?catid=<%= map.get("catid") %>"
							onclick="return confirm('Are you sure to delete this record ?')"
							class="btn btn-danger btn-sm">Delete</a></td>
					</tr>
					<% }%>
				</tbody>
			</table>
		</div>
		<div class="col-sm-4">
			<form method="post" action="SaveCat.jsp">
				<div class="form-group">
					<input type="text" placeholder="Category Name" class="form-control"
						name="cname">
				</div>
				<button class="btn btn-primary btn-block">Save Category</button>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />
