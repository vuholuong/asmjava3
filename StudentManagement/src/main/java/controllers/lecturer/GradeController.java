package controllers.lecturer;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.GradeDAO;
import daos.GradeViewDAO;
import entities.Grade;
import entities.GradeView;
import entities.User;
import utils.IdParser;

@WebServlet("/admin/grades")
public class GradeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		GradeViewDAO dao = new GradeViewDAO();

		List<GradeView> grades;
		grades = dao.selectAll();

		req.setAttribute("page", "grade-management");
		req.setAttribute("grades", grades);

		req.getRequestDispatcher("/pages/admin.jsp").forward(req, res);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User currentUser = (User) req.getSession().getAttribute("user");
		if (!currentUser.isBoss()) {
			res.getWriter().write("NOT ALLOW");
			return;
		}
		
		if(!validateFields(req.getParameter("student-id"), req.getParameter("course-id"), req.getParameter("grade"))) {
			res.getWriter().write("INVALID");
			return;
		}
		
		
		int studentId = IdParser.parse(req.getParameter("student-id"));
		int courseId = IdParser.parse(req.getParameter("course-id"));
		float grade = Float.valueOf(req.getParameter("grade"));

		Grade g = new Grade();
		g.setStudentId(studentId);
		g.setCourseId(courseId);
		g.setGradeValue(grade);

		GradeDAO dao = new GradeDAO();

		String gradeId = req.getParameter("id");
		if (isNullOrEmpty(gradeId)) {
			// INSERT
			dao.insert(g);
		} else {
			// UPDATE
			g.setGradeId(Integer.valueOf(gradeId));
			dao.update(g);
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
		
		GradeDAO dao = new GradeDAO();
		dao.delete(id);
		
		res.getWriter().write("OK");
		
	}


	private boolean validateFields(String courseName, String lecturerId, String grade) {
		return !(isNullOrEmpty(courseName) || isNullOrEmpty(lecturerId) || isNullOrEmpty(grade));
	}

	private boolean isNullOrEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}
}
