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