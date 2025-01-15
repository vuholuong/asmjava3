package controllers.student;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.NewsViewDAO;
import entities.NewsView;

@WebServlet("/student/news")
public class NewsController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		NewsViewDAO viewDao = new NewsViewDAO();

		List<NewsView> newsList;
		newsList = viewDao.selectAll();

		req.setAttribute("page", "news-view");
		req.setAttribute("newsList", newsList);

		req.getRequestDispatcher("/pages/student.jsp").forward(req, res);

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
