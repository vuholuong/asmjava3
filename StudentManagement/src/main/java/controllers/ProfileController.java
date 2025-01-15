package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import daos.UserDAO;
import entities.User;

@WebServlet("/my-profile")
public class ProfileController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s = req.getSession();
		User user = (User) s.getAttribute("user");
		
		req.setAttribute("page", "profile-management");
		req.setAttribute("user", user);

		if (user.isBoss()) {
		req.getRequestDispatcher("/pages/admin.jsp").forward(req, res);
		} else {
			req.getRequestDispatcher("/pages/student.jsp").forward(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		
		if (!password.equals(repassword)) {
			res.getWriter().write("PASSWORDS DON'T MATCH");
			return;
		} 
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user.getUserId() != Integer.parseInt(id)) {
			res.getWriter().write("YOU ARE NOT ALLOW TO CHANGE OTHERS INFORMATION");
			return;
		}

		user.setName(name);
		user.setPassword(repassword);
		
		UserDAO dao = new UserDAO();
		
		dao.userUpdate(user);
		session.setAttribute("user", user);
		
		doGet(req, res);
	}

}
