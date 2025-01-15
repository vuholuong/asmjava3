-- Tạo cơ sở dữ liệu
CREATE DATABASE StudentManagement;
GO
USE StudentManagement;
GO

-- Bảng Users (Người dùng - Sinh viên hoặc Giảng viên)
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    role NVARCHAR(10) CHECK (role IN ('Lecturer', 'Student')) NOT NULL
);
GO

-- Bảng Courses (Môn học)
CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    lecturer_id INT,
    FOREIGN KEY (lecturer_id) REFERENCES Users(user_id) ON DELETE SET NULL
);
GO

-- Bảng Grades (Điểm của sinh viên)
CREATE TABLE Grades (
    grade_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
GO

create table news(
	id int identity(1,1) primary key,
	title nvarchar(200) not null,
	description NVARCHAR(200) NOT NULL DEFAULT '',
	content nvarchar(max) not null,
	created_at datetime not null DEFAULT GETDATE(),
	user_id int references users (user_id) on delete set null,
);

go

INSERT INTO Users (name, email, password, role) VALUES
('Nguyen Van A', 'nguyenvana@example.com', 'password123', 'Student'),
('Tran Thi B', 'tranthib@example.com', 'password123', 'Student'),
('Le Van C', 'levanc@example.com', 'password123', 'Lecturer'),
('Pham Thi D', 'phamthid@example.com', 'password123', 'Student'),
('Hoang Van E', 'hoangvane@example.com', 'password123', 'Lecturer');

INSERT INTO Courses (course_name, lecturer_id) VALUES
('Mathematics', 7),
('Physics', 7),
('Chemistry', 11),
('Biology', 11),
('Computer Science', 13);

INSERT INTO Grades (student_id, course_id, grade) VALUES
(9, 2, 8.5),  -- Nguyen Van A in Mathematics
(9, 3, 9.0),  -- Nguyen Van A in Physics
(10, 5, 7.8),  -- Tran Thi B in Mathematics
(12, 3, 9.2),  -- Le Van C in Chemistry
(12, 4, 8.8);  -- Pham Thi D in Biology
