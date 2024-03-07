# Containerize MySQL database

## Setup
- Downloaded `mysql:latest` Docker image via Docker Hub
- Executed the following command to create a Docker container:
`docker run --name container_mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --restart unless-stopped mysql:latest`
- Copied the `company.sql` file from host OS into container
`docker cp company.sql container_mysql:/`
- Entered `container_mysql` Docker container shell through the following command:
`docker exec -it container_mysql bin/bash`
- Entered MySQL Command-Line using `mysql -u root -p` and entered password 1234
- Imported `company.sql` using `source ./company.sql
- Created a user named john and granted all permissions to the company database:
`CREATE USER 'john'@'localhost' IDENTIFIED BY 'password';`
`GRANT ALL PRIVILEGES ON company.* TO 'john'@'localhost' WITH GRANT OPTION;`
- Found average salary for each department using the following MySQL Query:
```sql
SELECT d.department_name, AVG(e.salary) AS average_salary FROM employees e JOIN departments d ON e.department = d.department_id GROUP BY d.department_name;
```
Result:
```text
+-----------------+----------------+
| department_name | average_salary |
+-----------------+----------------+
| Sales           |   60000.000000 |
| Engineering     |   75111.111111 |
| Finance         |   53666.666667 |
| Marketing       |   67250.000000 |
| HR              |   51500.000000 |
| Operations      |   63500.000000 |
| Consulting      |   83000.000000 |
| Administration  |   58500.000000 |
+-----------------+----------------+
```

## Database persistence
- To mount a volume in the database container I used the following docker command to create the container:
`docker run --name container_mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 -v mysql:/var/lib/mysql mysql:latest`