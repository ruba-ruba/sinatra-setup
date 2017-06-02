CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email varchar(255) not null unique,
  password varchar(255)
);
