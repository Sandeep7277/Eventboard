<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("eventid");
    
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("UPDATE events set status='canceled' WHERE eventid=?");
    ps.setString(1, name);
    ps.executeUpdate();
    
    ps=con.prepareStatement("DELETE FROM bookedevent WHERE eventid=?");
    ps.setString(1, name);
    ps.executeUpdate();
    
    con.close();
    session.setAttribute("msg", "Event cancelled Successfully..!!");
    
    response.sendRedirect("Events.jsp");
%>

