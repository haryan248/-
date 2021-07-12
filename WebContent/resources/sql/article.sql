drop table article;

CREATE TABLE IF NOT EXISTS article(
	a_id VARCHAR(40) NOT NULL,
	a_title VARCHAR(50),
	a_subtitle  VARCHAR(50),
	a_content TEXT,
	a_fileName  VARCHAR(20),
	PRIMARY KEY (a_id)
)default CHARSET=utf8;

desc article;