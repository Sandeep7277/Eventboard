<%@page import="java.sql.*"%>
<%@page import="config.DbHelper"%>

<%
	String id = session.getAttribute("id").toString();
    String name=request.getParameter("name");    
    String email=request.getParameter("email");       
    String phone=request.getParameter("phone");  
    
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("update students SET name=?,email=?,phone=? where rollno=?");
    ps.setString(1,name);
    ps.setString(2,email);    
    ps.setString(3,phone);    
    ps.setString(4,id);
    ps.executeUpdate();
    session.setAttribute("msg","Profile updated Successfully..!!");
    
    response.sendRedirect("StudentHome.jsp");
%>