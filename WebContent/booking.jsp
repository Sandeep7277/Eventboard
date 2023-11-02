<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("eventid");
    String id=session.getAttribute("id").toString();
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("insert into bookedevent values(?,?)");
    ps.setString(1, name);
    ps.setString(2, id);
    ps.executeUpdate();
    
    session.setAttribute("msg", "Event Booked Successfully..!!");
    
    response.sendRedirect("bookevent.jsp?eventid="+name);
%>

