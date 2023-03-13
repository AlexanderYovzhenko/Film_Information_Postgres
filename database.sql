-- Create database
CREATE DATABASE film_information;

-- Create tables
CREATE TABLE person 
(
	person_id serial PRIMARY KEY,
	first_name varchar(64) NOT NULL,
  last_name varchar(64) NOT NULL
);

CREATE TABLE film
(
	film_id serial PRIMARY KEY,
  film_name varchar(64) NOT NULL,
  film_description text,
	year int NOT NULL,
	country varchar(64) NOT NULL,
  rating float,
  assessments int,
  reviews int,
  slogan text,
  subtitles varchar(64),
  quality varchar(64),
  age_limit int,
  ranking_MPAA varchar(64),
  duration interval,
  filmmaker int, 
  FOREIGN KEY (filmmaker) REFERENCES person(person_id),
  script int,
  FOREIGN KEY (script) REFERENCES person(person_id),
  producer int,
  FOREIGN KEY (producer) REFERENCES person(person_id),
  operator int,
  FOREIGN KEY (operator) REFERENCES person(person_id),
  composer int,
  FOREIGN KEY (composer) REFERENCES person(person_id),
  painter int,
  FOREIGN KEY (painter) REFERENCES person(person_id),
  installation int,
  FOREIGN KEY (installation) REFERENCES person(person_id)
);

CREATE TABLE finance
(
  finance_id serial PRIMARY KEY,
  budget money NOT NULL,
  marketing money,
  fees_USA money,
  fees_world money,
  film_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id)
);

CREATE TABLE audio_track
(
  audio_track_id serial PRIMARY KEY,
  language_track varchar(64) NOT NULL
);

CREATE TABLE film_audio_track
(
  film_audio_track_id serial PRIMARY KEY,
  film_id int NOT NULL,
  audio_track_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id),
  FOREIGN KEY (audio_track_id) REFERENCES audio_track(audio_track_id)
);

CREATE TABLE released
(
  released_id serial PRIMARY KEY,
  premiere_Russia date,
  premiere_world date NOT NULL,
  released_DVD date,
  film_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id)
);

CREATE TABLE film_person_role
(
  film_person_role_id serial PRIMARY KEY,
  film_id int NOT NULL,
  person_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE film_person_duplicate
(
  film_person_duplicate_id serial PRIMARY KEY,
  film_id int NOT NULL,
  person_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE genre
(
	genre_id serial PRIMARY KEY,
	genre_name varchar(64) NOT NULL
);

CREATE TABLE film_genre
(
  film_genre_id serial PRIMARY KEY,
  film_id int NOT NULL,
  genre_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id),
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE country_viewer
(
	country_viewer_id serial PRIMARY KEY,
	country varchar(64) NOT NULL,
	viewership int NOT NULL,
  film_id int NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(film_id)
);


-- Insert tables
INSERT INTO person(first_name, last_name)
VALUES 
('Фрэнк', 'Дарабонт'),
('Стивен', 'Кинг'),
('Дэвид', 'Валдес'),
('Дэвид', 'Тэттерсолл'),
('Томас', 'Ньюман'),
('Теренс', 'Марш'),
('Ричард', 'Фрэнсис-Брюс'),
('Том', 'Хэнкс'),
('Дэвид', 'Морс'),
('Бонни', 'Хант'),
('Майкл', 'Дункан'),
('Джеймс', 'Кромуэлл'),
('Майкл', 'Джитер'),
('Грэм', 'Грин'),
('Даг', 'Хатчисон'),
('Сэм', 'Рокуэлл'),
('Барри', 'Пеппер'),
('Всеволод', 'Кузнецов'),
('Владимир', 'Антоник'),
('Любовь', 'Германова'),
('Валентин', 'Голубенко'),
('Александр', 'Белявский');

INSERT INTO film
(
  film_name, film_description, year, country, rating, assessments, 
  reviews, slogan, subtitles, quality, age_limit, ranking_MPAA, duration, 
  filmmaker, script, producer, operator, composer, painter, installation
)
VALUES 
(
  'Зеленая миля', 'В тюрьме для смертников появляется заключенный с божественным даром. Мистическая драма по роману Стивена Кинга', 1998, 'США',
  9.1, 864048, 475, 'Пол Эджкомб не верил в чудеса. Пока не столкнулся с одним из них', 'Русские', 'Full HD', 16, 'R', '189 minutes', 
  1, 2, 3, 4, 5, 6, 7
);

INSERT INTO finance(budget, marketing, fees_USA, fees_world, film_id)
VALUES 
('$60,000.000', '$30,000.000', '$136,801.374', '$286,801.374', 1);

INSERT INTO audio_track(language_track)
VALUES 
('Русский'),
('Английский');

INSERT INTO film_audio_track(film_id, audio_track_id)
VALUES 
(1, 1),
(1, 2);

INSERT INTO released(premiere_Russia, premiere_world, released_DVD, film_id)
VALUES
('2000-04-18', '1999-12-18', '2001-02-13', 1);

INSERT INTO film_person_role(film_id, person_id)
VALUES
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17);

INSERT INTO film_person_duplicate(film_id, person_id)
VALUES
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22);

INSERT INTO genre(genre_name)
VALUES
('драма'),
('фэнтези'),
('криминал'),
('комедия'),
('биография'),
('история'),
('военный');

INSERT INTO film_genre(film_id, genre_id)
VALUES
(1, 1),
(1, 2),
(1, 3);

INSERT INTO country_viewer(country, viewership, film_id)
VALUES
('USA', 26000000, 1),
('Germany', 2100000, 1),
('Italy', 1700000, 1);


-- Delete tables
DROP TABLE released;
DROP TABLE film_audio_track;
DROP TABLE audio_track;
DROP TABLE finance;
DROP TABLE film_person_duplicate;
DROP TABLE film_person_role;
DROP TABLE film_genre;
DROP TABLE genre;
DROP TABLE country_viewer;
DROP TABLE film;
DROP TABLE person;
