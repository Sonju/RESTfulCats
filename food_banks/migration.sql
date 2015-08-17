CREATE DATABASE foodbanks;

\c food_banks

CREATE TABLE foodbank (id SERIAL PRIMARY KEY, name VARCHAR(255), address VARCHAR(255), city VARCHAR(255));
