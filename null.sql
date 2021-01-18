-- List the teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept IS NULL

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- Use a different JOIN so that all teachers are listed
SELECT teacher.name, dept.name
 FROM teacher LEFT OUTER JOIN dept
           ON (teacher.dept=dept.id)

-- Use a different JOIN so that all departments are listed
SELECT teacher.name, dept.name
 FROM teacher RIGHT OUTER JOIN dept
           ON (teacher.dept=dept.id)

-- Use COALESCE to print the mobile number
SELECT name,COALESCE(mobile,'07986 444 2266') AS numb
FROM teacher

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name,COALESCE(dept.name,'None')
FROM teacher LEFT OUTER JOIN dept ON (dept.id=teacher.dept)
