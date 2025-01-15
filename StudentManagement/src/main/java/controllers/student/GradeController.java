package controllers.student;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import daos.GradeViewDAO;
import entities.GradeView;
import entities.User;

@WebServlet("/student/grades")
public class GradeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		GradeViewDAO dao = new GradeViewDAO();
		
		
		List<GradeView> grades;
		
		User student = (User) req.getSession().getAttribute("user");
		grades = dao.selectAllForId(student.getUserId());

		req.setAttribute("page", "grade-view");
		req.setAttribute("grades", grades);

		req.getRequestDispatcher("/pages/student.jsp").forward(req, res);

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
