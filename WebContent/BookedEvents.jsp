<%@page import="config.DbHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:include flush="true" page="header.jsp"/>
<div class="jumbotron p-3 text-center mb-2 bg-info text-white">  
    <h4>Booked Events</h4>
</div>
<div class="container">
    <table class="table table-bordered table-sm">
        <thead>
            <tr>
                <th>Reg. no</th>
                <th>Student Name</th> 
                <th>Class</th>
                <th>Event Category</th>
                <th>Event Summary</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Map<String, String>> list = DbHelper.allrecords("bookedevent");
                for (Map<String, String> map : list) {
                    String eventid = map.get("eventid");
                    String id = map.get("id");
                    List<Map<String, String>> list2 = DbHelper.findrecords("students", "rollno=" + id);
                    List<Map<String, String>> list3 = DbHelper.findrecords("events", "eventid=" + eventid);
                    Map<String, String> map2 = list2.get(0);
                    Map<String, String> map3 = list3.get(0);
                    List<Map<String, String>> list4 = DbHelper.findrecords("category", "catid=" + map3.get("catid"));
                    Map<String, String> map4 = list4.get(0);
            %>
            <tr>
                <td><%= map2.get("rollno")%></td>
                <td><%= map2.get("name")%></td>
                <td><%= map2.get("course")%></td>         
                <td><%= map4.get("catname")%></td>         
                <td><%= map3.get("descr").substring(0,20)%>....</td>         
                <td><%= DbHelper.getDate(map3.get("startdate")) %></td>
                <td><%= DbHelper.getDate(map3.get("endate")) %></td>
            </tr>
            <% }%>
        </tbody>
    </table>        
</div>
<jsp:include flush="true" page="footer.jsp"/>
