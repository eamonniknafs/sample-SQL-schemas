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
    group_name varchar(255),
    year int,
    type varchar(255),
    price int,
    CONSTRAINT fk_artist FOREIGN KEY (artist) REFERENCES Artists(name),
    CONSTRAINT fk_groups FOREIGN KEY (group_name) REFERENCES Groups(name),
    CONSTRAINT pk_artworks PRIMARY KEY (title),
}

CREATE TABLE Groups {
    name varchar(255) NOT NULL UNIQUE,
    description varchar(255),
    CONSTRAINT pk_groups PRIMARY KEY (name)
}

CREATE TABLE Artwork_Group {
    artwork_title varchar(255) NOT NULL,
    group_name varchar(255) NOT NULL,
    CONSTRAINT fk_artwork FOREIGN KEY (artwork_title) REFERENCES Artworks(title),
    CONSTRAINT fk_group FOREIGN KEY (group_name) REFERENCES Groups(name),
}

CREATE TABLE Customers {
    name varchar(255) NOT NULL UNIQUE,
    address varchar(255),
    dollars_spent DECIMAL(10,2),
    CONSTRAINT pk_customers PRIMARY KEY (name)
}

CREATE TABLE Liked_Groups{
    customer_name varchar(255) NOT NULL,
    group_name varchar(255) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_name) REFERENCES Customers(name),
    CONSTRAINT fk_group FOREIGN KEY (group_name) REFERENCES Groups(name),
}

CREATE TABLE Liked_Artists {
    customer_name varchar(255) NOT NULL,
    artist_name varchar(255) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_name) REFERENCES Customers(name),
    CONSTRAINT fk_artist FOREIGN KEY (artist_name) REFERENCES Artists(name),
}