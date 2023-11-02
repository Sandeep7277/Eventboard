package eb;

import config.DbHelper;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/SaveEvent")
@MultipartConfig
public class SaveEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String descr = request.getParameter("descr");
            String catid = request.getParameter("catid");
            String startd = request.getParameter("startdate");
            String endd = request.getParameter("enddate");
            String startt = request.getParameter("starttime");
            String endt = request.getParameter("endtime");
            String fees = request.getParameter("fees");
            Part photo = request.getPart("photo");

            Connection con = DbHelper.connect();
            PreparedStatement ps = con.prepareStatement("insert into events(descr,catid,startdate,endate,starttime,endtime,photo,fees) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, descr);
            ps.setString(2, catid);
            ps.setString(3, startd);
            ps.setString(4, endd);
            ps.setString(5, startt);
            ps.setString(6, endt);
            ps.setString(7, fees);
            ps.setString(7, photo.getSubmittedFileName());
            ps.setNString(8, fees);
            ps.executeUpdate();
            
            String path=getServletContext().getRealPath("/events/");
            Files.copy(photo.getInputStream(), 
                    Paths.get(path, photo.getSubmittedFileName()), 
                    StandardCopyOption.REPLACE_EXISTING);
            
            HttpSession session=request.getSession();
            
            session.setAttribute("msg", "Event Registered Successfully..!!");

            response.sendRedirect("Events.jsp");
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }

}
