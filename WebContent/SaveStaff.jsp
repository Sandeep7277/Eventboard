<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String tid=request.getParameter("tid");
    String name=request.getParameter("name");
    String city=request.getParameter("city");
    String desg=request.getParameter("designation");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("insert into teachers values(?,?,?,?,?,?)");
    ps.setString(1, tid);
    ps.setString(2, name);
    ps.setString(3, city);
    ps.setString(4, desg);
    ps.setString(5, email);
    ps.setString(6, phone);
    ps.executeUpdate();
    con.close();
    session.setAttribute("msg", "Staff Registered Successfully..!!");
    
	response.sendRedirect("Lecturers.jsp");
%>

