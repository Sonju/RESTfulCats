CREATE DATABASE food_banks;

\c food_banks

CREATE TABLE food_banks (id SERIAL PRIMARY KEY, name VARCHAR(255), address VARCHAR(255), city VARCHAR(255));
