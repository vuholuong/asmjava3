package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Course;
import entities.CourseView;
import utils.Jdbc;

public class CourseViewDAO {
	
	public List<CourseView> selectContainsName(String name) {
        List<CourseView> courses = new ArrayList<>();
        String sql = "SELECT * FROM VIEW_MONHOC where course_name like ?";

        try (ResultSet rs = Jdbc.executeQuery(sql, "%"+name+"%")) {
            while (rs.next()) {
            	CourseView course = new CourseView();
                course.setCourseId(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setLecturer(rs.getString("lecturer"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
	
	
	 public List<CourseView> selectAll() {
	        List<CourseView> courses = new ArrayList<>();
	        String sql = "SELECT course_id, course_name, lecturer FROM VIEW_MONHOC";

	        try (ResultSet rs = Jdbc.executeQuery(sql)) {
	            while (rs.next()) {
	                CourseView course = new CourseView();
	                course.setCourseId(rs.getInt("course_id"));
	                course.setCourseName(rs.getString("course_name"));
	                course.setLecturer(rs.getString("lecturer"));
	                courses.add(course);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return courses;
	    }

}
