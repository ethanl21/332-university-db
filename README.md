# 332-university-db

`332-university-db` is a university records database web app made using PHP and MySQL.

## Usage

`332-university-db` can be deployed to any web host that supports static HTML/CSS/JS, PHP, and MySQL.

1. Create a MySQL database and use the included SQL queries in `sql/init.sql` to initialize the databse
2. Add your MySQL credentials to your GitHub repository secrets (`MYSQL_DBNAME`, `MYSQL_HOSTNAME`, `MYSQL_USERNAME`, `MYSQL_PASSWORD`)
3. Add your FTP credentials to your GitHub repository secrets (`FTP_HOST`, `FTP_USERNAME`, `FTP_PASSWORD`)
4. Modify `deploy.yml` if necessary to deploy to your web host of choice.

### Default Inputs

Use the following inputs to query the database. All data contained in the database is for demonstration purposes only.

#### Professors

##### Class List

| Social Security Number |
| ---------------------- |
| 123456789              |
| 222222222              |
| 999999999              |

##### Grades

| Course Number | Section Number |
| ------------- | -------------- |
| 0             | 1              |
| 0             | 2              |
| 1             | 1              |
| 1             | 2              |
| 3             | 1              |
| 3             | 2              |
| 4             | 1              |

#### Students

##### Course Sections

| Course Number |
| ------------- |
| 0             |
| 1             |
| 3             |
| 4             |

##### Course History

| CWID      |
| --------- |
| 111111111 |
| 222222222 |
| 333333333 |
| 444444444 |
| 555555555 |
| 666666666 |
| 777777777 |
| 888888888 |

## Attribution

The following open-source libraries are uses:

- [Pico CSS](https://picocss.com)
- [htmx](https://htmx.org)
- [canvas-confetti](https://www.npmjs.com/package/canvas-confetti)
- [dompurify](https://www.npmjs.com/package/dompurify)
