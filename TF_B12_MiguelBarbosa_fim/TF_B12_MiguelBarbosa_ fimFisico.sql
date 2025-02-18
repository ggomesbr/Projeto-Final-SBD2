-- -------- < Trabalho Final - Data Mining > --------
--
--                    SCRIPT DE CRIAÇÃO (DDL)
--
-- Data Criação ...........: 13/02/2025
-- Autor(es) ..............: Miguel Barbosa
--                           Gabriel Gomes
--                           Arthur Trindade
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: beatport
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--         => 03 Views
--
-- ----------------------------------------------------------------------------------------

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS beatport;

-- Selecionando o banco de dados
USE beatport;

-- Tabela ARTIST
CREATE TABLE ARTIST (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(255) NOT NULL,
    artist_url VARCHAR(255)
);

-- Tabela GENRE
CREATE TABLE GENRE (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(255) NOT NULL,
    genre_url VARCHAR(255)
);

-- Tabela LABEL
CREATE TABLE LABEL (
    label_id INT PRIMARY KEY AUTO_INCREMENT,
    label_name VARCHAR(255) NOT NULL,
    label_url VARCHAR(255)
);

-- Tabela ALBUM
CREATE TABLE ALBUM (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_title VARCHAR(255) NOT NULL,
    album_date DATE,
    album_url VARCHAR(255),
    FK_LABEL_label_id INT,
    FOREIGN KEY (FK_LABEL_label_id) REFERENCES LABEL(label_id)
);

-- Tabela TRACK
CREATE TABLE TRACK (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    mix VARCHAR(255),
    is_remixed CHAR(1) NOT NULL DEFAULT 'f', -- 'f' para falso, 't' para verdadeiro
    release_date DATE,
    bpm VARCHAR(50),
    duration INT,
    track_url VARCHAR(255),
    FK_ALBUM_album_id INT,
    FK_GENRE_genre_id INT,
    FK_LABEL_label_id INT,
    FOREIGN KEY (FK_ALBUM_album_id) REFERENCES ALBUM(album_id),
    FOREIGN KEY (FK_GENRE_genre_id) REFERENCES GENRE(genre_id),
    FOREIGN KEY (FK_LABEL_label_id) REFERENCES LABEL(label_id)
);

-- Tabela ARTIST_ALBUM (tabela de relacionamento entre ARTIST e ALBUM)
CREATE TABLE ARTIST_ALBUM (
    fk_ARTIST_artist_id INT,
    fk_ALBUM_album_id INT,
    PRIMARY KEY (fk_ARTIST_artist_id, fk_ALBUM_album_id),
    FOREIGN KEY (fk_ARTIST_artist_id) REFERENCES ARTIST(artist_id),
    FOREIGN KEY (fk_ALBUM_album_id) REFERENCES ALBUM(album_id)
);

-- Tabela ARTIST_TRACK (tabela de relacionamento entre ARTIST e TRACK)
CREATE TABLE ARTIST_TRACK (
    fk_ARTIST_artist_id INT,
    fk_TRACK_track_id INT,
    PRIMARY KEY (fk_ARTIST_artist_id, fk_TRACK_track_id),
    FOREIGN KEY (fk_ARTIST_artist_id) REFERENCES ARTIST(artist_id),
    FOREIGN KEY (fk_TRACK_track_id) REFERENCES TRACK(track_id)
);