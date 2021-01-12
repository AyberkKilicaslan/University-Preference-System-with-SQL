
/* create table part */

	create table university(
		id serial not null,
		name varchar(100) not null unique,
		uni_type varchar(10) not null,
		city varchar(100) not null,
		email varchar(100) not null unique,
		foundation int not null,
		address varchar(100),
		CONSTRAINT "uni_id" PRIMARY KEY("id")
	);

	create table faculty(
		uni_id int NOT NULL,
		faculty_id serial not null,
		name varchar(100) not null,
		email varchar(100) not null unique,
		CONSTRAINT "pk_faculty_id" PRIMARY KEY("faculty_id"),
		CONSTRAINT "for_key_uni_id" FOREIGN KEY("uni_id")
		REFERENCES university("id") match simple
		ON UPDATE CASCADE ON DELETE CASCADE
	);


	create table department(
		faculty_id int NOT NULL,
		dep_id serial not null,
		name varchar(100) not null,
		email varchar(100) not null unique,
		language varchar(2) not null,
		e_type varchar(2) not null,
		period int not null,
		quota int not null,
		quota_first int,
		min_score float,
		min_order int,
		CONSTRAINT "pk_department_id" PRIMARY KEY("dep_id"),
		CONSTRAINT "for_key_faculty_id" FOREIGN KEY("faculty_id")
		REFERENCES faculty("faculty_id") match simple
		ON UPDATE CASCADE ON DELETE CASCADE
	);

	create table student(
		student_id int NOT NULL,
		name varchar(100) not null,
		surname varchar(100) not null,
		exam_score float not null,
		exam_rank int not null,
		top_ranked varchar(10),
		CONSTRAINT "pk_student_id" PRIMARY KEY("student_id")
	);

	CREATE TABLE student_department
	(
		student_id int NOT NULL,
		department_id int NOT NULL,
		pref_order int not NULL,
		CONSTRAINT "pk_student_department_id" PRIMARY KEY (student_id, department_id),
		CONSTRAINT "fk_student_id" FOREIGN KEY ("student_id")
			REFERENCES student("student_id") MATCH SIMPLE
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		CONSTRAINT "fk_department_id" FOREIGN KEY ("department_id")
			REFERENCES department("dep_id") MATCH SIMPLE
			ON UPDATE CASCADE
			ON DELETE CASCADE
	);

/* insert into tables part */

	INSERT into university(name,uni_type,city,email,foundation,address)
	VALUES
		('Dokuz Eylül University' , 'Devlet' , 'İzmir' , 'deu@edu.tr' , '1982' , 'Buca/İzmir'),
		('Ege University' , 'Devlet' , 'İzmir' , 'ege@edu.tr' , '1955' , 'Bornova/İzmir'),
		('Yasar University' , 'Vakıf' , 'İzmir' , 'yasar@edu.tr' , '2001' , 'Bornova/İzmir'),
		('ODTU' , 'Devlet' , 'Ankara' , 'odtü@edu.tr' , '1956' , 'Cankaya/Ankara'),
		('Izmir University' , 'Vakif' , 'İzmir' , 'izmir@edu.tr' , '2005' , 'Göztepe/İzmir'),
		('Hacettepe University' , 'Devlet' , 'Ankara' , 'hacettepe@edu.tr' , '1967' , 'Cankaya/Ankara'),
		('Izmir Technical University' , 'Devlet' , 'İzmir', 'iyte@edu.tr' , '1996' , 'Gülbahçe/İzmir');


	INSERT into faculty(uni_id,name,email)
	VALUES
		(1 , 'Faculty of Engineering' , 'deuengineering@edu.tr'),
		(1 , 'Faculty of Medicine' , 'deumed@edu.tr'),
		(1 , 'Faculty of Law' , 'deulaw@edu.tr'),
		(2 , 'Faculty of Engineering' , 'egeeng@edu.tr'),
		(2 , 'Faculty of Medicine' , 'egemed@edu.tr'),
		(2 , 'Faculty of Law' , 'egelaw@edu.tr'),
		(3 , 'Faculty of Engineering' , 'yasareng@edu.tr'),
		(3 , 'Faculty of Law' , 'yasarlaw@edu.tr'),
		(4 , 'Faculty of Engineering' , 'odtueng@edu.tr'),
		(5 , 'Faculty of Engineering' , 'izmireng@edu.tr'),
		(5 , 'Faculty of Law' , 'izmirlaw@edu.tr'),
		(6 , 'Faculty of Engineering' , 'hacettepeeng@edu.tr'),
		(6 , 'Faculty of Medicine' , 'hacettepemed@edu.tr'),
		(7 , 'Faculty of Medicine' , 'iytemed@edu.tr');



	INSERT into department(faculty_id,name,email,language,e_type,period,quota,quota_first,min_score,min_order)
	VALUES
		(1 , 'Computer Engineering' , 'deuceng@edu.tr', 'en' , 'öö' , 4, 90 , 3, 445.245 , 33000),
		(1 , 'Mechanical Engineering' , 'deumec@edu.tr', 'tr' , 'öö' , 4, 90 , 3, 410.245 , 56000),
		(1 , 'Mechanical Engineering' , 'deumeciö@edu.tr', 'tr' , 'iö' , 4, 50 , 2, 399.245 , 66000),
		(2 , 'Medicine' , 'deumedi@edu.tr', 'tr' , 'öö' , 6, 200 , 0, 496.245 , 2000),
		(3 , 'Law' , 'deulawdep@edu.tr', 'tr' , 'öö' , 6, 300 , 0, 456.245 , 5500),
		(4 , 'Computer Engineering' , 'egeceng@edu.tr', 'tr' , 'öö' , 4, 90 , 5, 450.245 , 31000),
		(4 , 'Mechanical Engineering' , 'egemech@edu.tr', 'tr' , 'öö' , 4, 90 , 5, 406.545 , 61000),
		(4 , 'Mechanical Engineering' , 'egemechiö@edu.tr', 'tr' , 'iö' , 4, 90 , 5, 380.245 , 68000),
		(5 , 'Medicine' , 'egemedi@edu.tr', 'tr' , 'öö' , 4, 250 , 1, 498.245 , 1500),
		(6 , 'Law' , 'egelawdep@edu.tr', 'tr' , 'öö' , 4, 350 , 1, 450.245 , 6500),
		(7 , 'Computer Engineering' , 'yasarceng@edu.tr', 'en' , 'öö' , 4, 30 , 1, 436.245 , 37000),
		(8 , 'Law' , 'yasarlawdep@edu.tr', 'en' , 'öö' , 4, 20 , 1, 446.245 , 7500),
		(9 , 'Computer Engineering' , 'odtuceng@edu.tr', 'en' , 'öö' , 4, 90 , 3, 486.245 , 2500),
		(9 , 'Electronical Engineering' , 'odtueee@edu.tr', 'en' , 'öö' , 4, 80 , 3, 496.245 , 1500),
		(10 , 'Computer Engineering' , 'izmirceng@edu.tr', 'tr' , 'öö' , 4, 40 , 3, 426.245 , 48000),
		(10 , 'Electronical Engineering' , 'izmireee@edu.tr', 'tr' , 'öö' , 4, 45 , 3, 416.245 , 48700),
		(11 , 'Law' , 'izmirlawdep@edu.tr', 'tr' , 'öö' , 4,100 , 3, 246.245 , 180000),
		(12 , 'AI Engineering' , 'hacettepeai@edu.tr', 'en' , 'öö' , 5, 15 , 1, 498.245 , 570),
		(12 , 'Chemistry Engineering' , 'hacettepechem@edu.tr', 'en' , 'öö' , 5, 75 , 1, 421.245 , 65000),
		(13 , 'Medicine' , 'hacettepemed@edu.tr', 'en' , 'öö' , 8, 105 , 1, 499.745 , 200),
		(14 , 'Medicine' , 'iytemed@edu.tr', 'tr' , 'öö' , 9, 35 , 1, 490.745 , 800);

	/* if student is the top ranked student in high school, top_ranked = yes otherwise top_ranked = no 
		for language : English = en, Turkish = tr */
	INSERT into student(student_id,name,surname,exam_score,exam_rank,top_ranked)
	VALUES
		(100 , 'Ayberk' , 'Kılıçaslan', '497.212' , '1657' , 'no'),
		(101 , 'Arif' , 'Mertaslan', '496.850' , '1723' , 'no'),
		(102 , 'Hazar' , 'Özyağcı', '447.212' , '32500' , 'no'),
		(103 , 'Cemal Can' , 'Canseven', '399.212' , '67500' , 'yes'),
		(104 , 'Barış Murat' , 'Yağcı', '434.212' , '36500' , 'no'),
		(105 , 'Jordan' , 'Henderson', '457.212' , '24500' , 'no'),
		(106 , 'Fernando' , 'Torres', '499.212' , '253' , 'no'),
		(107 , 'Patrick' , 'Stump', '387.212' , '81500' , 'no'),
		(108 , 'Ahmet' , 'Bulur', '421.212' , '47500' , 'no');


	INSERT into student_department(student_id,department_id,pref_order)
	VALUES

		(100 , 18, 1),
		(100 , 1, 2),
		(100 , 4, 3),

		(101 , 1, 1),
		(101 , 6, 2),
		(101 , 4, 3),

		(102 , 18, 1),
		(102 , 13, 2),
		(102 , 1, 3),

		(103 , 19, 1),
		(103 , 7, 2),
		(103 , 3, 3),

		(104 , 1, 1),
		(104 , 11, 2),
		(104 , 2, 3),

		(105 , 6, 1),
		(105 , 5, 2),
		(105 , 19, 3),

		(106 , 9, 1),
		(106 , 4, 2),
		(106 , 21, 3),

		(107 , 7, 1),
		(107 , 8, 2),
		(107 , 19, 3),

		(108 , 6, 1),
		(108 , 1, 2),
		(108 , 2, 3);
	
/* query part */	

	/*first query*/
	SELECT * FROM university WHERE foundation > 1990 AND city LIKE 'İ%';
	/* Yasar University , Izmir University , Izmir Technical University */

	/*second query*/
	SELECT * FROM university WHERE id IN(SELECT uni_id FROM faculty WHERE name LIKE '%Engineering' INTERSECT SELECT uni_id FROM faculty WHERE name LIKE '%Medicine');
	/* hacettepe deu ege */

	/*third query*/
	SELECT COUNT(*) FROM faculty WHERE uni_id IN (SELECT id FROM university WHERE uni_type = 'Vakıf' OR uni_type = 'Vakif') UNION
	SELECT COUNT(*) FROM faculty WHERE uni_id IN (SELECT id FROM university WHERE uni_type = 'Devlet');
	/* vakif = 4 , devlet = 10 */

	/*fourth query*/
	SELECT * FROM department WHERE name LIKE '%Engineering'  AND e_type = 'iö';
	/* deu mechanical, ege mechanical */

	/*fifth query*/
	SELECT * FROM department ORDER BY period DESC , min_score LIMIT 5;
	/*  1- iyte medicine
		2-hacettepe medicine
		3-deu law
		4-deu medicine
		5-hacettepe chemistry eng */

	/*sixth query*/
	SELECT * FROM department where period = 4 and dep_id IN (SELECT department_id from student_department GROUP BY department_id ORDER BY COUNT(*) DESC) LIMIT 1;
	/* deu computer engineering */

	/*seventh query*/
	SELECT * FROM student WHERE student_id IN (SELECT student_id FROM student_department  WHERE pref_order = 1 and department_id IN(SELECT dep_id FROM department WHERE name = 'Computer Engineering'));
	/* jordan henderson , arif mertaslan , ahmet bulur , barış murat yağcı */

	/*eigth query*/
	UPDATE faculty SET email = 'iyteeng@edu.tr', uni_id = (SELECT id FROM university WHERE name = 'Izmir Technical University')
	WHERE uni_id IN(SELECT id FROM university WHERE name = 'Dokuz Eylül University') and name = 'Faculty of Engineering';
	/* deu engineering fakültesinin uni_id = izmir technical university id */

	/*ninth query*/
	UPDATE department SET period = period + 1 WHERE faculty_id in(SELECT faculty_id From faculty where name = 'Faculty of Law');
	/* departments' under the law faculty periods incremented by 1 
	 dep id = 5, 10, 12 */

	/*tenth query*/
	DELETE from faculty WHERE uni_id IN(SELECT id FROM university  WHERE name = 'Izmir University'); 
	/* faculty 10-11 deleted and department 15-16-17 deleted */

