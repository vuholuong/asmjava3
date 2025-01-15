package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.CourseView;
import entities.GradeView;
import utils.Jdbc;

public class GradeViewDAO {
	 public List<GradeView> selectAll() {
	        List<GradeView> courses = new ArrayList<>();
	        String sql = "SELECT grade_id, student, course, grade FROM VIEW_DIEM";

	        try (ResultSet rs = Jdbc.executeQuery(sql)) {
	            while (rs.next()) {
	                GradeView course = new GradeView();
	                course.setGradeId(rs.getInt("grade_id"));
	                course.setStudent(rs.getString("student"));
	                course.setCourse(rs.getString("course"));
	                course.setGradeValue(rs.getFloat("grade"));
	                courses.add(course);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return courses;
	    }

	 
	 public List<GradeView> selectAllForId(int id) {
	        List<GradeView> courses = new ArrayList<>();
	        String sql = "{CALL XEM_ALL_GRADE_OF_ID(?)}";

	        try (ResultSet rs = Jdbc.executeQuery(sql,id)) {
	            while (rs.next()) {
	                GradeView course = new GradeView();
	                course.setGradeId(rs.getInt("grade_id"));
	                course.setStudent(rs.getString("student"));
	                course.setCourse(rs.getString("course"));
	                course.setGradeValue(rs.getFloat("grade"));
	                courses.add(course);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return courses;
	    }
}
