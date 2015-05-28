DROP TABLE videos;

CREATE TABLE videos (
  id serial8 primary key, 
  title varchar(225),
  description text,
  url varchar(225),
  genre varchar(30)
);

INSERT into VIDEOS (title, description, url, genre) VALUES ('BFL', 'A music video', 'https://youtu.be/toQXPFzFU38?list=LMQdF0AQCpb_CAxGDdyG456Q', 'pop');

INSERT into VIDEOS (title, description, url, genre) VALUES ('WoD', 'Another music video', 'https://youtu.be/FMqWSFNC1jU?list=LMQdF0AQCpb_CAxGDdyG456Q', 'rock');