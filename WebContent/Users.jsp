<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp" />

<h4 class="p-2" style="border-bottom: 2px solid green">Users</h4>
<div class="container-fluid">
	<table class="table table-bordered table-sm">
		<thead class="table-primary">
			<tr>
				<th>User Id</th>
				<th>User Name</th>
				<th>Password</th>
				<th>Role</th>
				<th>ID</th>
			</tr>
		</thead>
		<tbody>
			<%
            	List<Map<String, String>> list = DbHelper.allrecords("users");
                            for (Map<String, String> map : list) {
            %>
			<tr>
				<td><%= map.get("userid")%></td>
				<td><%= map.get("uname")%></td>
				<td><%= map.get("pwd")%></td>
				<td><%= map.get("role")%></td>
				<td><%= map.get("id")%></td>
			</tr>
			<% }%>
		</tbody>
	</table>
</div>
<jsp:include flush="true" page="footer.jsp" />
