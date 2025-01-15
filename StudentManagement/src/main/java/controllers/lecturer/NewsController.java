package controllers.lecturer;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.NewsDAO;
import daos.NewsViewDAO;
import entities.News;
import entities.NewsView;
import entities.User;
import utils.Validator;

@WebServlet("/admin/news")
public class NewsController extends HttpServlet {

	private NewsDAO dao = new NewsDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		NewsViewDAO viewDao = new NewsViewDAO();

		List<NewsView> newsList;
		newsList = viewDao.selectAll();

		req.setAttribute("page", "news-management");
		req.setAttribute("newsList", newsList);

		req.getRequestDispatcher("/pages/admin.jsp").forward(req, res);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (!user.isBoss()) {
			res.getWriter().write("NOT ALLOW");
			return;
		}

		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String content = req.getParameter("content");

		News n;

		if (Validator.validateFields(title, description, content)) {
			n = new News(0, title, description, content, null, null);
		} else {
			res.getWriter().write("INVALID INPUT");
			return;
		}

		if (Validator.isNullOrEmpty(id)) {
			n.setUserId(user.getUserId());
			dao.insert(n);
		} else {
			n.setId(Integer.valueOf(id.trim()));
			dao.update(n);
		}

		doGet(req, res);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (!user.isBoss()) {
			res.getWriter().write("NOT ALLOW");
			return;
		}
		
		String id = req.getParameter("id");
		if(Validator.isNullOrEmpty(id)) {
			res.getWriter().write("INVALID");
			return;
		}
		
		dao.delete(Integer.valueOf(id.trim()));
	}
}
