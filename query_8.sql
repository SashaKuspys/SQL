SELECT
    t.fullname AS teacher_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
JOIN grades g ON sub.id = g.subject_id
WHERE t.id = 1
GROUP BY t.fullname;