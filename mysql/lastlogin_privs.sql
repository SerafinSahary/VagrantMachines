
SELECT CONCAT("GRANT EXECUTE ON PROCEDURE lastlogin.login_trigger TO '", user, "'@'", host, "';") AS query
  INTO OUTFILE '/var/lib/mysql-files/grants.sql'
  FROM mysql.user
 WHERE Super_priv = 'N';

