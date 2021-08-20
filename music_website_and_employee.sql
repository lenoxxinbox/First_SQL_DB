------------------------------------------------------
-----------������ ����� ����� music_website-----------
------------------------------------------------------

CREATE SCHEMA music_website
    AUTHORIZATION postgres;
    
-----------------------------------------------
-----------������ ������� ����������-----------
-----------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician (
	id serial PRIMARY KEY, 
	alias varchar(40) UNIQUE NOT NULL
);
   
-------------------------------------------------------
-----------������ ������� ����������� ������-----------
-------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.style (
	id serial PRIMARY KEY, 
	name_of_the_style varchar(40) UNIQUE NOT NULL,
	description varchar(200)
); 
   
---------------------------------------------
-----------������ ������� ��������-----------
---------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.album (
	id serial PRIMARY KEY, 
	title varchar(100) UNIQUE NOT NULL,
	year_of_release date
);
   
----------------------------------------------------------------------------------------------
-----------������ ������� ������, ������ ���� ������ � ����� �������� �� id �������-----------
----------------------------------------------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS music_website.track (
	id serial PRIMARY KEY,
	album_id integer NOT NULL REFERENCES album(id),
	name varchar(100),
	duration int
);
   
----------------------------------------------
-----------������ ������� ���������-----------
----------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.music_collection (
	id serial PRIMARY KEY, 
	name_of_collection varchar(100) UNIQUE NOT NULL,
	create_year date
);

-------------------------------------------------------------------------------------------------------
----------------------------------------�������� ������� �� �������------------------------------------
-------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------
--------------------------������� musician_style ��������� ���������� � �����-------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician_style (
	id serial PRIMARY KEY,
	musician_id integer NOT NULL REFERENCES musician(id),
	style_id integer NOT NULL REFERENCES style(id)
);

------------------------------------------------------------------------------------------------------
-------------------------������� musician_album ��������� ���������� � �������------------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.musician_album (
	id serial PRIMARY KEY,
	musician_id integer NOT NULL REFERENCES musician(id),
	album_id integer NOT NULL REFERENCES album(id)
);
   
------------------------------------------------------------------------------------------------------
-----------------------������� track_collection ��������� ���������� � ��������-----------------------
------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music_website.track_collection (
	id serial PRIMARY KEY,
	track_id integer NOT NULL REFERENCES track(id),
	music_collection_id integer NOT NULL REFERENCES music_collection(id)
);


----------------------------------------------
-----������ ����� ����� employee_company------
----------------------------------------------

CREATE SCHEMA employee_company
    AUTHORIZATION postgres;
    
--------------------------------------------------------------------
-------------������ ������� ������� � �� �������������--------------
--------------------------------------------------------------------
   
CREATE TABLE IF NOT EXISTS employee_company.departments (
	id serial PRIMARY KEY, 
	department varchar(40) UNIQUE NOT NULL,
	boss_name varchar(200) NOT NULL,
	boss_post varchar(200) NOT NULL
);
--------------------------------------------------------------
-----------������ ������� ���� ����������� ��������-----------
--------------------------------------------------------------

CREATE TABLE IF NOT EXISTS employee_company.all_staff (
	id serial PRIMARY KEY, 
	employee_name varchar(100) NOT NULL,
	position varchar(100) NOT NULL,
	department_id integer NOT NULL REFERENCES employee_company.departments(id)
);
   
