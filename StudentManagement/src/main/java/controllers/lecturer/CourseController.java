package controllers.lecturer;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.CourseDAO;
import daos.CourseViewDAO;
import entities.Course;
import entities.CourseView;
import entities.User;

@WebServlet("/admin/courses")
public class CourseController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		CourseViewDAO dao = new CourseViewDAO();

		List<CourseView> courses;
		courses = dao.selectAll();

		req.setAttribute("page", "course-management");
		req.setAttribute("courses", courses);

		req.getRequestDispatcher("/pages/admin.jsp").forward(req, res);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User currentUser = (User) req.getSession().getAttribute("user");
		if (!currentUser.isBoss()) {
			doGet(req, res);
			return;
		}

		String courseName = req.getParameter("course-name");
		String formLecturer = req.getParameter("lecturer");
		boolean containsChar = formLecturer.chars().anyMatch(Character::isLetter);
		int lecturerId = containsChar ? Integer.valueOf(formLecturer.split("-ID:")[1]) : Integer.valueOf(formLecturer);

		CourseDAO dao = new CourseDAO();
		Course c = new Course();

		c.setCourseName(courseName);
		c.setLecturerId(lecturerId);

		String courseId = req.getParameter("id");
		if (!isNullOrEmpty(courseId)) {
			try {
				c.setCourseId(Integer.valueOf(courseId));
				dao.update(c);
			} catch (Exception e) {
				doGet(req, res);
			}
		} else {
			dao.insert(c);
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

		CourseDAO dao = new CourseDAO();
		dao.delete(id);

		res.getWriter().write("OK");

	}

	private boolean isNullOrEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}
}
