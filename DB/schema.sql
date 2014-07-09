CREATE TABLE clubs
(
  id serial NOT NULL primary key,
  name varchar(255),
  image_url text,
  description text,
  rating smallint
);

