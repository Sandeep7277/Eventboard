<%@page import="config.DbHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:include flush="true" page="header.jsp" />

<h4 class="p-2" style="border-bottom: 2px solid green">Lecturer
	Dashboard</h4>
<%
	String id = session.getAttribute("id").toString();
    List<Map<String, String>> data = DbHelper.findrecords("teachers", "tid=" + id);
    Map<String, String> map = data.get(0);
%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-7">
			<table class="table table-bordered">
				<tr>
					<th style="width: 200px;">Lecturer ID</th>
					<th><%= map.get("tid")%></th>
				</tr>
				<tr>
					<th>Lecturer Name</th>
					<th><%= map.get("name")%></th>
				</tr>
				<tr>
					<th>Designation</th>
					<th><%= map.get("designation")%></th>
				</tr>
				<tr>
					<th>Email ID</th>
					<th><%= map.get("email")%></th>
				</tr>
				<tr>
					<th>Contact Number</th>
					<th><%= map.get("phone")%></th>
				</tr>
			</table>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />