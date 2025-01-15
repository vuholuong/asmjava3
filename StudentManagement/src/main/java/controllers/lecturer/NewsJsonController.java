package controllers.lecturer;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import daos.NewsDAO;
import entities.News;

/**
 * Servlet implementation class NewsDetailController
 */
@WebServlet("/api/news/*")
public class NewsJsonController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
		if (pathInfo != null && pathInfo.length() > 1) {
			String idStr = pathInfo.substring(1);
			try {
				int id = Integer.parseInt(idStr);
				NewsDAO dao = new NewsDAO();
				News n = dao.selectById(id);
				
				if (n == null) {
					res.getWriter().write("NOT FOUND");
					return;
				}

				ObjectMapper objectMapper = new ObjectMapper();
				String jsonResponse = objectMapper.writeValueAsString(n);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");

				res.getWriter().write(jsonResponse);

			} catch (NumberFormatException e) {
				res.getWriter().write("ERROR: INVALID NEWS ID");
			}
		} else {
			res.getWriter().write("ERROR: INVALID NEWS ID");

		}
	}

}
