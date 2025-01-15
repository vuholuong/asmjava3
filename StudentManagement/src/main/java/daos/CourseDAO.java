package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Course;
import utils.Jdbc;

public class CourseDAO implements DAO<Course,Integer> {

    @Override
    public List<Course> selectAll() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM Courses";

        try (ResultSet rs = Jdbc.executeQuery(sql)) {
            while (rs.next()) {
                Course course = new Course();
                course.setCourseId(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setLecturerId(rs.getObject("lecturer_id") != null ? rs.getInt("lecturer_id") : null);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    

    @Override
    public Course selectById(Integer id) {
        Course course = null;
        String sql = "SELECT * FROM Courses WHERE course_id = ?";

        try (ResultSet rs = Jdbc.executeQuery(sql, id)) {
            if (rs.next()) {
                course = new Course();
                course.setCourseId(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setLecturerId(rs.getObject("lecturer_id") != null ? rs.getInt("lecturer_id") : null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    @Override
    public void insert(Course record) {
        String sql = "INSERT INTO Courses (course_name, lecturer_id) VALUES (?, ?)";
        try {
            Jdbc.executeUpdate(sql, record.getCourseName(), record.getLecturerId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM Courses WHERE course_id = ?";
        try {
            Jdbc.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Course record) {
        String sql = "UPDATE Courses SET course_name = ?, lecturer_id = ? WHERE course_id = ?";
        try {
            Jdbc.executeUpdate(sql, record.getCourseName(), record.getLecturerId(), record.getCourseId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
