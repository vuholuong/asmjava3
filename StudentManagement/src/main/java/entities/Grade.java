package entities;

public class Grade {
    private int gradeId;       // grade_id
    private int studentId;     // student_id
    private int courseId;      // course_id
    private Float gradeValue;  // grade, nullable

    // Getters and Setters
    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public Float getGradeValue() {
        return gradeValue;
    }

    public void setGradeValue(Float gradeValue) {
        this.gradeValue = gradeValue;
    }
}
