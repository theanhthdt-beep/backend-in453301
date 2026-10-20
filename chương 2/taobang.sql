-- Tao schema theanh1
CREATE SCHEMA IF NOT EXISTS theanh1;

-- Tao bang members
CREATE TABLE theanh1.members (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    joined_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Tao bang courses
CREATE TABLE theanh1.courses (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0)
);

-- Tao bang registrations
CREATE TABLE theanh1.registrations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT NOT NULL REFERENCES theanh1.members(id),
    course_id INT NOT NULL REFERENCES theanh1.courses(id),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    registered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (member_id, course_id)
);

-- Tao chi muc
CREATE INDEX ix_reg_course
ON theanh1.registrations (course_id);