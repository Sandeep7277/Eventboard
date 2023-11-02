<%@page import="java.sql.*"%>
<%@page import="config.DbHelper"%>
<%
	String id = request.getParameter("id");
    String role = request.getParameter("role");
    Connection con = DbHelper.connect();
    PreparedStatement ps = null;
    if (role.equals("student")) {
        ps = con.prepareStatement("SELECT name from students where rollno=?");
    } else if (role.equals("lecturer")) {
        ps = con.prepareStatement("SELECT name from teachers where tid=?");
    }
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        response.getWriter().println(rs.getString("name"));
    } else {
        response.getWriter().println("Invalid");
    }
    con.close();
%>
