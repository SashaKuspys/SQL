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