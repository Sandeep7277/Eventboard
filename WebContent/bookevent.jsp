<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="config.DbHelper"%>
<jsp:include flush="false" page="mheader.jsp" />
<div class="p-1"></div>
<%
	String eventid = request.getParameter("eventid");
    List<Map<String, String>> data = DbHelper.findrecords("events", "eventid=" + eventid);
    Map<String, String> map = data.get(0);
    List<Map<String, String>> list2 = DbHelper.findrecords("category", "catid=" + map.get("catid"));
    Map<String, String> map2 = list2.get(0);
    String cname = map2.get("catname");
%>
<div class="container" style="min-height: 94vh">
	<div class="card shadow" style="margin-top: 54px;">
		<div class="card-body">
			<h4 class="p-2" style="border-bottom: 2px solid green;">Book
				Event</h4>
			<div class="row">
				<div class="col-sm-4 p-2">
					<img src="events/<%=map.get("photo")%>" alt="event image"
						class="img-thumbnail">
				</div>
				<div class="col-sm-8 p-2">
					<h4><%=cname%></h4>
					<p><%=map.get("descr")%></p>
					<h5>
						Date :
						<%=map.get("startdate")%>
						to
						<%=map.get("endate")%></h5>
					<h5>
						Time :
						<%=map.get("starttime")%>
						to
						<%=map.get("endtime")%></h5>
					<h5>
						Event Fees : &#8377;
						<%=map.get("fees")%></h5>
					<%
            	String id = session.getAttribute("id").toString();
                                List<Map<String, String>> data2 = DbHelper.findrecords("bookedevent", "eventid=" + eventid + " and id=" + id);
                                if (data2.size() > 0) {
            %>
					<h5 class="text-success mt-3">Event booked</h5>
					<%
            } else {
            %>
					<form method="post" action="booking.jsp">
						<input type="hidden" value="<%= eventid%>" name="eventid">
						<button class="btn btn-primary mt-3">Book Event</button>
					</form>
					<%
                    }
                if (session.getAttribute("msg") != null) {
            %>
					<div class="alert alert-success">
						<%= session.getAttribute("msg")%>
					</div>
					<%
                    session.removeAttribute("msg");
                }
            %>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="mfooter.jsp" />
