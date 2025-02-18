-- ----- < Trabalho Final - Data Mining > --------
--
--                    SCRIPT DE CONSULTAS (DDL e DML)
--
-- Data Criacao ...........: 15/02/2025
-- Autor(es) ..............: Miguel Barbosa
--                           Gabriel Gomes
--                           Arthur Trindade
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: beatport
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--         => 04 Views
--
-- ---------------------------------------------------------

USE beatport;

-- View 1: Quantidade de álbuns por artista
-- Essa view ajuda a identificar quais artistas têm maior volume de lançamentos, 
-- útil para analisar padrões de produtividade e relevância no mercado musical.
CREATE VIEW ArtistAlbumCount AS
SELECT a.artist_id, a.artist_name, COUNT(aa.album_id) AS total_albums
FROM ARTIST a
LEFT JOIN ARTIST_ALBUM aa ON a.artist_id = aa.artist_id
GROUP BY a.artist_id, a.artist_name;

SELECT * FROM ArtistAlbumCount;

-- View 2: Faixas mais populares por gênero
-- Permite entender quais faixas são mais populares dentro de cada gênero, ajudando em análises de tendências e preferências do público.
CREATE VIEW TopTracksByGenre AS
SELECT g.genre_name, t.track_name, t.popularity
FROM TRACK t
JOIN GENRE g ON t.genre_id = g.genre_id
WHERE t.popularity >= (SELECT AVG(popularity) FROM TRACK) -- Ajuste para tornar a métrica dinâmica
ORDER BY g.genre_name, t.popularity DESC;

SELECT * FROM TopTracksByGenre;

-- View 3: Gravadoras com maior número de lançamentos
-- Útil para identificar as gravadoras mais ativas no mercado e possíveis tendências baseadas nos lançamentos.
CREATE VIEW TopLabels AS
SELECT l.label_name, COUNT(al.album_id) AS total_releases
FROM LABEL l
JOIN ALBUM al ON l.label_id = al.label_id
GROUP BY l.label_name
ORDER BY total_releases DESC
LIMIT 10;

SELECT * FROM TopLabels;

-- View 4: Artistas mais produtivos (com mais faixas)
-- Ajuda a encontrar os artistas mais ativos na produção de músicas, indicando sua presença no mercado e possíveis influências nas tendências.
CREATE VIEW MostProductiveArtists AS
SELECT a.artist_name, COUNT(at.track_id) AS total_tracks
FROM ARTIST a
JOIN ARTIST_TRACK at ON a.artist_id = at.artist_id
GROUP BY a.artist_name
ORDER BY total_tracks DESC
LIMIT 10;

SELECT * FROM MostProductiveArtists;

