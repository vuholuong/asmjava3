USE StudentManagement;
GO

-- Create the VIEW for Courses with Lecturers
CREATE VIEW VIEW_MONHOC AS
SELECT 
    c.course_id, 
    c.course_name, 
    u.name + '-ID:' + CONVERT(varchar, u.user_id) AS lecturer   
FROM Courses AS c
INNER JOIN Users AS u
ON c.lecturer_id = u.user_id;
GO

-- Create the VIEW for Grades with Students and Courses
CREATE VIEW VIEW_DIEM AS 
SELECT 
    g.grade_id,
    u.name + '-ID:' + CONVERT(varchar, u.user_id) AS student,
    c.course_name + '-ID:' + CONVERT(varchar, c.course_id) AS course,
    g.grade 
FROM Users AS u
INNER JOIN Grades AS g
ON u.user_id = g.student_id
INNER JOIN Courses AS c
ON g.course_id = c.course_id;
GO

-- Create the VIEW for News with Authors
CREATE VIEW NEWS_VIEW AS
SELECT 
    n.id,
    n.title,
    n.description,
    n.content,
    n.created_at,
    u.name + '-ID:' + CONVERT(varchar, u.user_id) AS author 
FROM news AS n
INNER JOIN Users AS u
ON n.user_id = u.user_id;
GO

-- Query the NEWS_VIEW
SELECT * FROM NEWS_VIEW;

SELECT * FROM VIEW_DIEM;
GO
