package eb;

import config.DbHelper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "DeleteLecturerServlet", urlPatterns = {"/dellect"})
public class DeleteLecturerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tid = request.getParameter("tid");
            
            Connection con = DbHelper.connect();
            
            PreparedStatement ps = con.prepareStatement("delete from teachers where tid=?");
            ps.setString(1, tid);            
            ps.executeUpdate(); 
            
            ps = con.prepareStatement("delete from users where id=?");
            ps.setString(1, tid);            
            ps.executeUpdate();                        
            
            HttpSession session=request.getSession();
            
            session.setAttribute("msg", "Lecturer deleted Successfully..!!");

            response.sendRedirect("Lecturers.jsp");
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }

}
