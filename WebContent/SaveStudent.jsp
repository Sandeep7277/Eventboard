<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String rollno=request.getParameter("rollno");
    String name=request.getParameter("name");
    String city=request.getParameter("city");
    String course=request.getParameter("course");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    
    Connection con=DbHelper.connect();
    PreparedStatement ps=con.prepareStatement("insert into students values(?,?,?,?,?,?)");
    ps.setString(1, rollno);
    ps.setString(2, name);
    ps.setString(3, city);
    ps.setString(4, course);
    ps.setString(5, email);
    ps.setString(6, phone);
    ps.executeUpdate();
    con.close();
    session.setAttribute("msg", "Student Registered Successfully..!!");
    
    response.sendRedirect("Students.jsp");
%>

