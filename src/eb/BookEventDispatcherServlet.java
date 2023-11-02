package eb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookEvent")
public class BookEventDispatcherServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		if(session.getAttribute("id")!=null) {
			req.getRequestDispatcher("bookevent.jsp").forward(req, resp);
		}else {
			session.setAttribute("msg", "Please login to book event");
			resp.sendRedirect("Login.jsp");
		}
	}
}
