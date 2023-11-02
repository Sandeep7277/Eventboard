<%@page import="config.DbHelper"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
    Connection con = DbHelper.connect();
    PreparedStatement ps = con.prepareStatement("select * from users WHERE id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        session.setAttribute("error", "User already registered..");
    } else {
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        String role = request.getParameter("role");
        String uname = request.getParameter("uname");
        ps = con.prepareStatement("INSERT INTO users VALUES(?,?,?,?,?)");
        ps.setString(1, userid);
        ps.setString(2, uname);
        ps.setString(3, pwd);
        ps.setString(4, role);
        ps.setString(5, id);
        ps.executeUpdate();
        session.setAttribute("msg", "User Registration Successful..");
    }
    response.sendRedirect("Login.jsp");
%>

