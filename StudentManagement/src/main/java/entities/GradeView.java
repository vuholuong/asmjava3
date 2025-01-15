package entities;

public class GradeView {
    private int gradeId;       // grade_id
    private String student;     // student_id
    private String course;      // course_id
    private Float gradeValue;  // grade, nullable

    // Getters and Setters
    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Float getGradeValue() {
        return gradeValue;
    }

    public void setGradeValue(Float gradeValue) {
        this.gradeValue = gradeValue;
    }
}
