DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR(255),
  password_digest VARCHAR(255)
);

CREATE TABLE pictures(
  id SERIAL PRIMARY KEY,
  owner_id BIGINT REFERENCES users(id)
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  body VARCHAR(400),
  picture_id BIGINT REFERENCES pictures(id),
  user_id BIGINT REFERENCES users(id)
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  up_vote_id BIGINT,
  up_vote_type VARCHAR(50),
  user_id BIGINT REFERENCES users(id)
);

CREATE UNIQUE INDEX up_vote_user_idx ON likes (up_vote_id, up_vote_type, user_id);