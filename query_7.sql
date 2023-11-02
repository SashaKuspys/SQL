SELECT
    s.fullname AS student_name,
    g.grade,
    sub.name AS subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.group_id = 1
    AND g.subject_id = 2;