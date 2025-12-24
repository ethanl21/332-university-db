# 332-university-db

`332-university-db` is a university records database web app made using PHP and MySQL.

## Usage

`332-university-db` can be deployed to any web host that supports static HTML/CSS/JS, PHP, and MySQL.

1. Create a MySQL database and use the included SQL queries in `sql/init.sql` to initialize the databse
2. Add your MySQL credentials to your GitHub repository secrets (`MYSQL_DBNAME`, `MYSQL_HOSTNAME`, `MYSQL_USERNAME`, `MYSQL_PASSWORD`)
3. Add your FTP credentials to your GitHub repository secrets (`FTP_HOST`, `FTP_USERNAME`, `FTP_PASSWORD`)
4. Modify `deploy.yml` if necessary to deploy to your web host of choice.

## Attribution

The following open-source libraries are uses:

- [Pico CSS](https://picocss.com)
- [htmx](https://htmx.org)
- [canvas-confetti](https://www.npmjs.com/package/canvas-confetti)
- [dompurify](https://www.npmjs.com/package/dompurify)
