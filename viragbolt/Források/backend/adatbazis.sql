-- Adatbázis: sutemenyek

DROP DATABASE IF EXISTS sutemenyek;
CREATE DATABASE sutemenyek DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE sutemenyek;

-- Táblák létrehozása

CREATE TABLE sutik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev TEXT NOT NULL
  
);

CREATE TABLE tulajdonsagok (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sutikId INT NOT NULL,
    energiatartalom INT NOT NULL,
    rendeles INT NOT NULL,
    leiras TEXT NOT NULL,
    url TEXT NOT NULL,
    ar INT NOT NULL,
    FOREIGN KEY(sutikId) REFERENCES sutik(id)

);