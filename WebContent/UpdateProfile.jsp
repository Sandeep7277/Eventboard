<%@page import="java.sql.*"%>
<%@page import="config.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String name=request.getParameter("uname");
    String userid=request.getParameter("userid");       
    
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("update users SET userid=?,uname=? where userid=?");
    ps.setString(1,userid);
    ps.setString(2,name);    
    ps.setString(3,session.getAttribute("userid").toString());
    ps.executeUpdate();
    session.setAttribute("uname", name);
    session.setAttribute("userid", userid);
    session.setAttribute("msg","User Profile updated Successfully..!!");
    response.sendRedirect("AdminHome.jsp");
%>