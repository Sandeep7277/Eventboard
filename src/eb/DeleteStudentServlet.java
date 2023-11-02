package eb;

import config.DbHelper;

import java.io.Console;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "DeleteStudentServlet", urlPatterns = {"/DeleteStudent"})
public class DeleteStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String rollno = request.getParameter("rollno");
            
            Connection con = DbHelper.connect();
          
            PreparedStatement ps = con.prepareStatement("delete from users where id=?");
            ps.setString(1, rollno);            
            ps.executeUpdate(); 
            
            ps = con.prepareStatement("delete from bookedevent where id=?");
            ps.setString(1, rollno);            
            ps.executeUpdate(); 
            
            ps = con.prepareStatement("delete from students where rollno=?");
            ps.setString(1, rollno);            
            ps.executeUpdate(); 
           
           
            HttpSession session=request.getSession();
            
            session.setAttribute("msg", "Student deleted Successfully..!!");

            response.sendRedirect("Students.jsp");
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }

}
