<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String eventid=request.getParameter("eventid");
    String id=session.getAttribute("id").toString();
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("delete from bookedevent where eventid=? and id=?");
    ps.setString(1, eventid);
    ps.setString(2, id);
    ps.executeUpdate();
   
    
    response.sendRedirect("StudentHome.jsp");
%>

