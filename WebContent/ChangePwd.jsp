<%@page import="java.sql.*"%>
<%@page import="config.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String old=request.getParameter("opwd");
    String userid=session.getAttribute("userid").toString();
    String pwd=request.getParameter("pwd");    
    
    Connection con=DbHelper.connect();
    ResultSet rs=con.createStatement().executeQuery("select * from users where userid='"+userid+"' and pwd='"+old+"'");
    if(rs.next()){
        PreparedStatement ps=con.prepareStatement("update users set pwd=? where userid=?");
        ps.setString(1,pwd);
        ps.setString(2,userid);        
        ps.executeUpdate();
        session.setAttribute("msg","Password changed Successfully..!!");
    }else{        
        session.setAttribute("error","Incorrect Password..!!");
    }
    con.close();
    if(session.getAttribute("role").equals("admin")){
        response.sendRedirect("AdminHome.jsp");
    }else if(session.getAttribute("role").equals("lecturer")){
        response.sendRedirect("LecturerHome.jsp");
    }
    else{
        response.sendRedirect("StudentHome.jsp");
    }
%>