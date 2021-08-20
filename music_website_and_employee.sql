------------------------------------------------------
-----------Создаю новую схему music_website-----------
------------------------------------------------------

CREATE SCHEMA music_website
    AUTHORIZATION postgres;
    
-----------------------------------------------
-----------Создаю таблицу музыкантов-----------
-----------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician (
	id serial PRIMARY KEY, 
	alias varchar(40) UNIQUE NOT NULL
);
   
-------------------------------------------------------
-----------Создаю таблицу музыкальных жанров-----------
-------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.style (
	id serial PRIMARY KEY, 
	name_of_the_style varchar(40) UNIQUE NOT NULL,
	description varchar(200)
); 
   
---------------------------------------------
-----------Создаю таблицу альбомов-----------
---------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.album (
	id serial PRIMARY KEY, 
	title varchar(100) UNIQUE NOT NULL,
	year_of_release date
);
   
----------------------------------------------------------------------------------------------
-----------Создаю таблицу треков, каждый трек связан с одним альбомом по id альбома-----------
----------------------------------------------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.track (
	id serial PRIMARY KEY,
	album_id integer NOT NULL REFERENCES album(id),
	name varchar(100),
	duration int
);
   
----------------------------------------------
-----------Создаю таблицу сборников-----------
----------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.music_collection (
	id serial PRIMARY KEY, 
	name_of_collection varchar(100) UNIQUE NOT NULL,
	create_year date
);

-------------------------------------------------------------------------------------------------------
----------------------------------------Добавляю таблицы со связями------------------------------------
-------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------
--------------------------таблица musician_style связывает музыкантов и жанры-------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician_style (
	id serial PRIMARY KEY,
	musician_id integer NOT NULL REFERENCES musician(id),
	style_id integer NOT NULL REFERENCES style(id)
);

------------------------------------------------------------------------------------------------------
-------------------------таблица musician_album связывает музыкантов и альбомы------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician_album (
	id serial PRIMARY KEY,
	musician_id integer NOT NULL REFERENCES musician(id),
	album_id integer NOT NULL REFERENCES album(id)
);
   
------------------------------------------------------------------------------------------------------
-----------------------таблица track_collection связывает музыкантов и сборники-----------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.track_collection (
	id serial PRIMARY KEY,
	track_id integer NOT NULL REFERENCES track(id),
	music_collection_id integer NOT NULL REFERENCES music_collection(id)
);


----------------------------------------------
-----создаю новую схему employee_company------
----------------------------------------------

CREATE SCHEMA employee_company
    AUTHORIZATION postgres;
    
--------------------------------------------------------------------
-------------Создаю таблицу отделов и их руководителей--------------
--------------------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS employee_company.departments (
	id serial PRIMARY KEY, 
	department varchar(40) UNIQUE NOT NULL,
	boss_name varchar(200) NOT NULL,
	boss_post varchar(200) NOT NULL
);
--------------------------------------------------------------
-----------Создаю таблицу всех сотрудников кампании-----------
--------------------------------------------------------------

CREATE TABLE IF NOT EXISTS employee_company.all_staff (
	id serial PRIMARY KEY, 
	employee_name varchar(100) NOT NULL,
	position varchar(100) NOT NULL,
	department_id integer NOT NULL REFERENCES employee_company.departments(id)
);
   
