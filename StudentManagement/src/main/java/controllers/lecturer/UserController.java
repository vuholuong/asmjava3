package controllers.lecturer;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.UserDAO;
import entities.User;
import utils.Validator;

@WebServlet("/admin/users")
public class UserController extends HttpServlet {
	private UserDAO dao = new UserDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<User> users;
		users = dao.selectAll();

		req.setAttribute("page", "user-management");
		req.setAttribute("users", users);

		req.getRequestDispatcher("/pages/admin.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User currentUser = (User) req.getSession().getAttribute("user");
		if (!currentUser.isBoss()) {
			res.getWriter().write("NOT ALLOW");
			return;
		}

		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");

		User user = new User();

		if (!Validator.isNullOrEmpty(id)) {
			if (Validator.validateFields(name, role)) {
				user.setName(name);
				user.setRole(role);
			} else {
				res.getWriter().write("NOT ALLOW");
				return;
			}
			user.setUserId(Integer.valueOf(id));
			dao.adminUpdate(user);
		} else {
			if (Validator.validateFields(name, email, password, role)) {
				user.setName(name);
				user.setEmail(email);
				user.setPassword(password);
				user.setRole(role);
			} else {
				res.getWriter().write("NOT ALLOW");
				return;
			}

			dao.insert(user);
		}

		doGet(req, res);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User currentUser = (User) req.getSession().getAttribute("user");
		if (!currentUser.isBoss()) {
			res.getWriter().write("NOT ALLOW");
			return;
		}

		int id = Integer.valueOf(req.getParameter("id"));
		dao.delete(id);

		res.getWriter().write("OK");
	}

}
