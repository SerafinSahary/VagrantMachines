-- DROP DATABASE tracking;
CREATE DATABASE lastlogin;

use lastlogin;

DROP TABLE IF EXISTS login_tracking;
CREATE TABLE login_tracking (
  user VARCHAR(16)
, host VARCHAR(60)
, timestamp TIMESTAMP
, PRIMARY KEY (user, host)
) engine = MyISAM;


DROP PROCEDURE IF EXISTS login_trigger;
DELIMITER //

CREATE PROCEDURE login_trigger()
SQL SECURITY DEFINER
BEGIN
  INSERT INTO lastlogin.login_tracking (user, host, timestamp)
  VALUES (SUBSTR(USER(), 1, instr(USER(), '@')-1), substr(USER(), instr(USER(), '@')+1), NOW())
  ON DUPLICATE KEY UPDATE timestamp = NOW();
END;

//
DELIMITER ;

