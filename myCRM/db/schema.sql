CREATE DATABASE myCRM;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    email VARCHAR(300),
    password_digest VARCHAR(400),
    role VARCHAR(100)
);


CREATE TABLE clients
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    address VARCHAR(400)
);

CREATE TABLE service_reports
(
    id SERIAL PRIMARY KEY,
    date DATE,
    user_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL
);


ALTER TABLE service_reports ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE service_reports ADD CONSTRAINT client_id_fk FOREIGN KEY (client_id) REFERENCES clients (id);

ALTER TABLE service_reports ADD COLUMN reports text;


