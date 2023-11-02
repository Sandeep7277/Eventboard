<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="true" page="header.jsp"/>

    <button type="button" data-target="#sadd" data-toggle="modal" 
            class="btn btn-success btn-sm float-right">Add New</button>
    <h4 class="p-2" style="border-bottom:2px solid green">Events</h4>
<div class="container-fluid">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Event ID</th>
                <th style="width:400px;">Description</th>
                <th>Fees</th>
                <th>Start Date</th>
                <th>Start Time</th>
                <th>End Date</th>
                <th>End Time</th>
                <th>Cancel</th>
            </tr>
        </thead>
        <tbody>
            <%
            	List<Map<String, String>> list = DbHelper.allrecords("events");
                            for (Map<String, String> map : list) {
            %>
            <tr>
                <td><%=map.get("eventid")%></td>
                <td><%=map.get("descr")%></td>
                <td>&#8377; <%=map.get("fees")%></td>
                <td><%=map.get("startdate")%></td>
                <td><%=map.get("starttime")%></td>
                <td><%=map.get("endate")%></td>
                <td><%=map.get("endtime")%></td>
                <td><%
                	if(map.get("status").equals("canceled"))  {
                %>
                Cancelled
                <%
                	} else {
                %>
                <a href="CancelEvent.jsp?eventid=<%=map.get("eventid")%>" class="btn btn-danger btn-sm">Cancel Event</a>
                <%
                	}
                %>
                </td>
            </tr>
            <%
            	}
            %>
        </tbody>
    </table>        
</div>
<div class="modal fade" id="sadd">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="SaveEvent" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4>Add New Event</h4>
                    <button type="button" data-dismiss="modal" class="close">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <select class="form-control" name="catid">
                            <option><-- Select Category --></option>
                            <%
                            	List<Map<String, String>> list2 = DbHelper.allrecords("category");
                                                            for (Map<String, String> map2 : list2) {
                            %>
                            <option value="<%= map2.get("catid")%>"><%= map2.get("catname")%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="4" name="descr" placeholder="Description"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="startdate" name="startdate" placeholder="Start Date">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="starttime" placeholder="Start Time">
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="enddate" name="enddate" placeholder="End Date">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="endtime" placeholder="End Time">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="fees" placeholder="Event Fees">
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control" name="photo">
                    </div>                                        
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary float-right">Save Event</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
document.querySelector("#startdate").valueAsDate=new Date();
document.querySelector("#enddate").valueAsDate=new Date();
</script>
<jsp:include flush="true" page="footer.jsp"/>

