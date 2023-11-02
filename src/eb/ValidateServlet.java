package eb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import config.DbHelper;

@WebServlet("/Validate")
public class ValidateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String role=request.getParameter("role");
		HttpSession session=request.getSession();
		try {
			Connection con=DbHelper.connect();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE userid=? and pwd=?");
			ps.setString(1,userid);
			ps.setString(2,pwd);    
			ResultSet rs=ps.executeQuery();
			if(rs.next()){        
				session.setAttribute("uname", rs.getString("uname"));
				session.setAttribute("userid", rs.getString("userid"));
				session.setAttribute("role", rs.getString("role"));
				session.setAttribute("id", rs.getString("id"));
				if(rs.getString("role").equals("admin")){
					response.sendRedirect("AdminHome.jsp");
				}else if(rs.getString("role").equals("lecturer")){
					response.sendRedirect("LecturerHome.jsp");
				}else if(rs.getString("role").equals("student")){
					response.sendRedirect("StudentHome.jsp");
				}else{
					session.setAttribute("error", "Invalid role selected..");
					response.sendRedirect("Login.jsp");
				}
			}
			else{
				session.setAttribute("error", "Invalid username or Password..");
				response.sendRedirect("Login.jsp");
			}
		}catch(Exception ex) {
			System.out.println("error "+ex.getMessage());
		}
	}
}
