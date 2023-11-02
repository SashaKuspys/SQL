--1
SELECT
    s.id, 
    s.fullname, 
    ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 5;

--2
SELECT 
    s.id, 
    s.fullname, 
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
where g.subject_id = 1
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 1;

--3
SELECT 
    g.subject_id,
    s.group_id,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON g.student_id = s.id
WHERE g.subject_id = 1
GROUP BY g.subject_id, s.group_id;

--4
SELECT 
    ROUND(AVG(grade), 2) AS average_grade
FROM grades;

--5
SELECT 
    s.name AS course_name
FROM subjects s
WHERE s.teacher_id = 1;

--6
SELECT 
    id,
    fullname
FROM students
WHERE group_id = 1;

--7
SELECT 
    s.fullname AS student_name,
    g.grade,
    sub.name AS subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.group_id = 1
    AND g.subject_id = 2;
   
--8
SELECT 
    t.fullname AS teacher_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
JOIN grades g ON sub.id = g.subject_id
WHERE t.id = 1
GROUP BY t.fullname;

--9
SELECT 
    sub.name AS course_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.id = 1;

--10
SELECT 
    sub.name AS course_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE s.id = 1
    AND t.id = 2;

--11
SELECT 
    t.fullname AS teacher_name,
    s.fullname AS student_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
JOIN grades g ON sub.id = g.subject_id
JOIN students s ON g.student_id = s.id
WHERE t.id = 1
    AND s.id = 2
GROUP BY t.fullname, s.fullname;

--12
SELECT 
    s.fullname AS student_name,
    g.grade AS last_lecture_grade
FROM students s
JOIN (
    SELECT 
        student_id,
        subject_id,
        MAX(grade_date) AS last_lecture_date
    FROM grades
    GROUP BY student_id, subject_id
) last_lecture ON s.id = last_lecture.student_id
JOIN grades g ON s.id = g.student_id
    AND g.subject_id = last_lecture.subject_id
    AND g.grade_date = last_lecture.last_lecture_date
WHERE s.group_id = 1 -- Замініть на номер потрібної групи
    AND g.subject_id = 2; -- Замініть на номер потрібного предмета







