-- Insert the following new departments:

INSERT INTO Departments (DepartmentName)
VALUES 
    ('Finance'),
    ('IT'),
    ('Operations');
    
    -- Insert at least five new employees across the new departments
SELECT DepartmentID, DepartmentName FROM Departments WHERE DepartmentName IN ('Finance', 'IT', 'Operations');
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID) VALUES ('Alice', 'Williams', '2023-02-10', 1);
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID) VALUES ('Bob', 'Smith', '2023-03-15', 2);
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID) VALUES ('Charlie', 'Johnson', '2023-04-20', 3);
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID) VALUES ('David', 'Brown', '2023-05-25', 1);
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID) VALUES ('Eva', 'Jones', '2023-06-30', 2);


-- Retrieve the names of all employees who work in the Finance department.
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID in (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Finance')
limit 1000;


-- List all employees hired in the year 2023.
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE YEAR(HireDate) = 2023;


-- Find the number of employees in each department and sort the results by the number of employees in descending order.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY NumberOfEmployees DESC;


-- Update the department name "Operations" to "Operations and Logistics".
SET SQL_SAFE_UPDATES = 0;
UPDATE Departments
SET DepartmentName = 'Operations and Logistics'
WHERE DepartmentName = 'Operations';



-- : Identify departments that have more than two employees, and list the names of those employees.
SELECT d.DepartmentName, e.FirstName, e.LastName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 2
);



