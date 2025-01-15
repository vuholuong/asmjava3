package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Validator;

import java.io.IOException;
import java.util.List;

import daos.CourseDAO;
import daos.CourseViewDAO;
import daos.UserDAO;
import entities.Course;
import entities.CourseView;
import entities.User;

@WebServlet("/admin/course-search")
public class CourseSearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CourseViewDAO dao = new CourseViewDAO();
		String name = req.getParameter("name");
		
		if (name == null) {
			res.getWriter().write("INVALID");
			return;
		}
		
		
		List<CourseView> courses = dao.selectContainsName(name);
		
		req.setAttribute("courses", courses);
		req.getRequestDispatcher("/components/course-table.jsp").forward(req, res);
	}
	
}
