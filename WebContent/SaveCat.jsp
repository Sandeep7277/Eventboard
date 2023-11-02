<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("cname");
	
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("insert into category(catname) values(?)");
    ps.setString(1, name);
    ps.executeUpdate();
    con.close();
    session.setAttribute("msg", "Category Created Successfully..!!");
    
    response.sendRedirect("Categories.jsp");
%>

