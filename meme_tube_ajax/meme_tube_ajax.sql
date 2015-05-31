DROP TABLE videos;

CREATE TABLE videos (
  id serial8 primary key,
  artist varchar(100),
  title varchar(100),
  description text,
  category varchar(100),
  genre varchar(100),
  url text
);

INSERT INTO videos (artist, title, description, category, genre, url)
  VALUES ('Panda Bear', 'Boys Latin', 'Official video', 'Music', 'Pop', 'prBaZzYmQrI');

INSERT INTO videos (artist, title, description, category, genre, url)
  VALUES ('Vice', 'Action Bronson', 'Food video', 'Food', 'Lifestyle', 'ZlWQKHnZMAk');
