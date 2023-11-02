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


@WebServlet(name = "DeleteCategoryServlet", urlPatterns = {"/Deletecat"})
public class DeleteCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String catid = request.getParameter("catid");
            
            Connection con = DbHelper.connect();
            
            PreparedStatement ps = con.prepareStatement("delete from category where catid=?");
            ps.setString(1, catid);            
            ps.executeUpdate(); 
            
            ps = con.prepareStatement("delete from events where catid=?");
            ps.setString(1, catid);            
            ps.executeUpdate();                         
            
            
            HttpSession session=request.getSession();
            
            session.setAttribute("msg", "Category deleted Successfully..!!");

            response.sendRedirect("Categories.jsp");
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }

}
