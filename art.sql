CREATE DATABASE IF NOT EXISTS ArtBase;
USE ArtBase;
DROP TABLE IF EXISTS Artists CASCADE;
DROP TABLE IF EXISTS Artworks CASCADE;
DROP TABLE IF EXISTS Groups CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;

CREATE TABLE Artists {
    name varchar(255) NOT NULL UNIQUE,
    birthplace varchar(255),
    age int,
    art_style varchar(255),
    CONSTRAINT pk_artists PRIMARY KEY (name)
}

CREATE TABLE Artworks {
    title varchar(255) NOT NULL UNIQUE,
    artist varchar(255) NOT NULL,
    year int,
    type varchar(255),
    price int,
    CONSTRAINT pk_artworks PRIMARY KEY (title),
    CONSTRAINT fk_artists FOREIGN KEY (artist) REFERENCES Artists(name)
}

CREATE TABLE Groups {
    name varchar(255) NOT NULL UNIQUE,
    description varchar(255),
    CONSTRAINT pk_groups PRIMARY KEY (name)
}

CREATE TABLE Customers {
    name varchar(255) NOT NULL UNIQUE,
    address varchar(255),
    dollars_spent DECIMAL(10,2),
    CONSTRAINT pk_customers PRIMARY KEY (name)
}