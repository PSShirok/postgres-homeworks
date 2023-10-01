-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(student_id serial,
 first_name varchar,
 last_name varchar,
 birthday date,
 phone varchar)

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER Table student
ADD COLUMN middle_name varchar

-- 3. Удалить колонку middle_name
ALTER Table student
DROP COLUMN middle_name

-- 4. Переименовать колонку birthday в birth_date
ALTER Table student
RENAME birthday TO  birth_date

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER Table student Alter COLUMN phone
SET DATA TYPE  varchar(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора

INSERT INTO student (first_name, last_name,birth_date,phone) VALUES ('Ivan','Ivanov','2000-01-01','1234567890');
INSERT INTO student (first_name, last_name,birth_date,phone) VALUES ('Petr','Petrov','1999-01-01','9876543210');
INSERT INTO student (first_name, last_name,birth_date,phone) VALUES ('Sergey','Sergeev','01-01-1998','2345678901');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE student RESTART IDENTITY