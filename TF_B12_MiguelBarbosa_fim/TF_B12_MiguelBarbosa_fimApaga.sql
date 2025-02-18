-- -------- < Trabalho Final - Data Mining > --------
--
--                    SCRIPT DE REMOÇÃO (DDL)
--
-- Data Criação ...........: 16/02/2025
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
USE beatport;

DROP VIEW ArtistAlbumCount;
DROP VIEW TopLabels;
DROP VIEW MostProductiveArtists;

DROP TABLE ARTIST_TRACK;
DROP TABLE ARTIST_ALBUM;
DROP TABLE TRACK;
DROP TABLE ALBUM;
DROP TABLE LABEL;
DROP TABLE GENRE;
DROP TABLE ARTIST;