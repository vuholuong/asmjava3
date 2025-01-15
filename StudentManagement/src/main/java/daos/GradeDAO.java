package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Course;
import entities.Grade;
import utils.Jdbc;

public class GradeDAO implements DAO<Grade,Integer>  {

    @Override
    public List<Grade> selectAll() {
        List<Grade> grades = new ArrayList<>();
        String sql = "SELECT * FROM Grades";

        try (ResultSet rs = Jdbc.executeQuery(sql)) {
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setGradeId(rs.getInt("grade_id"));
                grade.setStudentId(rs.getInt("student_id"));
                grade.setCourseId(rs.getInt("course_id"));
                grade.setGradeValue(rs.getObject("grade") != null ? rs.getFloat("grade") : null);
                grades.add(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grades;
    }

    @Override
    public Grade selectById(Integer id) {
        Grade grade = null;
        String sql = "SELECT * FROM Grades WHERE grade_id = ?";

        try (ResultSet rs = Jdbc.executeQuery(sql, id)) {
            if (rs.next()) {
                grade = new Grade();
                grade.setGradeId(rs.getInt("grade_id"));
                grade.setStudentId(rs.getInt("student_id"));
                grade.setCourseId(rs.getInt("course_id"));
                grade.setGradeValue(rs.getObject("grade") != null ? rs.getFloat("grade") : null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grade;
    }

    @Override
    public void insert(Grade record) {
        String sql = "INSERT INTO Grades (student_id, course_id, grade) VALUES (?, ?, ?)";
        try {
            Jdbc.executeUpdate(sql, record.getStudentId(), record.getCourseId(), record.getGradeValue());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM Grades WHERE grade_id = ?";
        try {
            Jdbc.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Grade record) {
        String sql = "UPDATE Grades SET student_id = ?, course_id = ?, grade = ? WHERE grade_id = ?";
        try {
            Jdbc.executeUpdate(sql, record.getStudentId(), record.getCourseId(), record.getGradeValue(), record.getGradeId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
