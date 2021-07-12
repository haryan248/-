drop table vehicle;

CREATE TABLE IF NOT EXISTS vehicle(
	v_id VARCHAR(40) NOT NULL,
	v_name VARCHAR(50),
	v_unitPrice  INTEGER,
	v_description TEXT,
   	v_category VARCHAR(20),
	v_unitsInStock LONG,
	v_condition VARCHAR(20),
	v_fileName  VARCHAR(20),
	v_releaseDate VARCHAR(20),
	PRIMARY KEY (v_id)
)default CHARSET=utf8;

desc vehicle;