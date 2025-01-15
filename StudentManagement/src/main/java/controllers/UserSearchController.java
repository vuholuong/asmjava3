package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Validator;

import java.io.IOException;
import java.util.List;

import daos.UserDAO;
import entities.User;

@WebServlet("/admin/user-search")
public class UserSearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		String name = req.getParameter("name");
		
		if (name == null) {
			res.getWriter().write("INVALID");
			return;
		}
		
		
		List<User> users = dao.selectContainsName(name);
		
		req.setAttribute("users", users);
		req.getRequestDispatcher("/components/user-table.jsp").forward(req, res);
	}
	
}
