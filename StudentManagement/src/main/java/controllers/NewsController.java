package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import daos.NewsDAO;
import daos.NewsViewDAO;
import entities.News;
import entities.NewsView;

/**
 * Servlet implementation class NewsDetailController
 */
@WebServlet("/news/*")
public class NewsController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
		if (pathInfo != null && pathInfo.length() > 1) {
			String idStr = pathInfo.substring(1);
			
			try {
				int id = Integer.parseInt(idStr);
				NewsViewDAO dao = new NewsViewDAO();
				NewsView n = dao.selectById(id);
				
				if (n == null) {
					res.getWriter().write("NOT FOUND");
					return;
				}

				req.setAttribute("news", n);
				req.setAttribute("page", "news-detail");
				req.getRequestDispatcher("/pages/student.jsp").forward(req, res);

			} catch (NumberFormatException e) {
				res.getWriter().write("ERROR: INVALID NEWS ID");
			}
		} else {
			res.getWriter().write("ERROR: INVALID NEWS ID");

		}
	}

}
