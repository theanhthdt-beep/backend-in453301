-- Cau 1: Liet ke ten cac khoa hoc Nguyen An da dang ky
SELECT c.title AS ten_khoa_hoc
FROM theanh1.courses c
JOIN theanh1.registrations r ON c.id = r.course_id
JOIN theanh1.members m ON m.id = r.member_id
WHERE m.full_name = 'Nguyễn An';


-- Cau 2: Dem so thanh vien cua moi khoa hoc
-- Khoa nhieu nguoi nhat dung dau
SELECT
    c.id,
    c.title AS ten_khoa_hoc,
    COUNT(r.member_id) AS so_luong_thanh_vien
FROM theanh1.courses c
LEFT JOIN theanh1.registrations r ON c.id = r.course_id
GROUP BY c.id, c.title
ORDER BY COUNT(r.member_id) DESC;


-- Cau 3: Dang ky Le Chi vao khoa Co so du lieu
-- Su dung transaction
BEGIN;

INSERT INTO theanh1.registrations (member_id, course_id)
SELECT m.id, c.id
FROM theanh1.members m
JOIN theanh1.courses c
    ON c.title = 'Cơ sở dữ liệu'
WHERE m.full_name = 'Lê Chi'
ON CONFLICT (member_id, course_id) DO NOTHING;

COMMIT;


-- Kiem tra dang ky cua Le Chi
SELECT
    m.full_name,
    c.title AS ten_khoa_hoc,
    r.status,
    r.registered_at
FROM theanh1.registrations r
JOIN theanh1.members m ON m.id = r.member_id
JOIN theanh1.courses c ON c.id = r.course_id
WHERE m.full_name = 'Lê Chi';