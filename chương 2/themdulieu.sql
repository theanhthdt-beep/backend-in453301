-- Them du lieu vao bang members
INSERT INTO theanh1.members (full_name, email) VALUES
    ('Nguyễn An', 'an@dthu.edu.vn'),
    ('Trần Bình', 'binh@dthu.edu.vn'),
    ('Lê Chi', 'chi@dthu.edu.vn');

-- Them du lieu vao bang courses
INSERT INTO theanh1.courses (title, capacity) VALUES
    ('Lập trình Web', 2),
    ('Cơ sở dữ liệu', 40);

-- Them du lieu vao bang registrations
INSERT INTO theanh1.registrations (member_id, course_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1);

-- Kiem tra du lieu
SELECT * FROM theanh1.members;
SELECT * FROM theanh1.courses;
SELECT * FROM theanh1.registrations;