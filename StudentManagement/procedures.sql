if OBJECT_ID('XEM_ALL_GRADE_OF_ID', 'P') is not null
    drop procedure XEM_ALL_GRADE_OF_ID;
go

create procedure XEM_ALL_GRADE_OF_ID 
    @id int
as
begin
    select 
        g.grade_id,
        u.name + '-ID:' + CONVERT(varchar, u.user_id) as student,
        c.course_name + '-ID:' + CONVERT(varchar, c.course_id) as course,
        g.grade 
    from Users u
    inner join Grades g
        on u.user_id = g.student_id
    inner join Courses c
        on g.course_id = c.course_id
    where u.user_id = @id;
end
go

-- exec XEM_ALL_GRADE_OF_ID 9;