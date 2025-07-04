-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MusicTrends`;
USE `MusicTrends` ;

-- -----------------------------------------------------
-- Table `lastfm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lastfm` (
  `id_artista` INT AUTO_INCREMENT,
  `nombre_artista` VARCHAR(100) NULL,
  `bio` LONGTEXT NULL,
  `listeners` INT NULL,
  `playcount` INT NULL,
  `similar` LONGTEXT NULL,
  PRIMARY KEY (`id_artista`))
;


-- -----------------------------------------------------
-- Table Spotify`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify` (
  `id_track` INT NOT NULL AUTO_INCREMENT,
  `nombre_artista` VARCHAR(100) NOT NULL,
  `nombre_cancion` VARCHAR(200) NULL,
  `año_lanzamiento` DATE NULL,
  `género_musical` VARCHAR(45) NULL,
  `tipo` VARCHAR(10) NULL,
  PRIMARY KEY(`id_track`, `nombre_artista`));


ALTER TABLE Spotify
MODIFY COLUMN año_lanzamiento DATE NULL; 
ALTER TABLE Spotify
MODIFY COLUMN id_track INT NOT NULL AUTO_INCREMENT;

INSERT INTO Spotify (id_track, nombre_artista, nombre_cancion, año_lanzamiento, género_musical, tipo)
VALUES (0,'Har-El','Exile Babylon','2019-05-06','trance','track'),
(1,'Stefre Roland','Miami - Original Mix','2019-02-14','trance','track');


INSERT INTO lastfm (id_artista, nombre_artista, bio, listeners, playcount, similar)
VALUES (0,'Har-El',"Har-El Prusky, Goa Trance/Acid producer from Israel primarily known for California Sunshine and Adrenalin Drum projects. <a href=""https://www.last.fm/music/Har-El"">Read more on Last.fm</a>",1171,4901,"['Tristan and a Green Nun', 'Kayseri', 'I Savastano', 'Epic-tone', 'Exotonic']"),
(1,'Stefre Roland',"Stefre Roland, real name Igor Karpov, is a Russian sound producer and DJ, born September 15, 1990 in Nefteyugansk, Russia. <a href=""https://www.last.fm/music/Stefre+Roland"">Read more on Last.fm</a>",9931,132676,"['iriser', 'Inward Universe', 'Fevy', 'Faraon', 'Anton Ishutin']");



 `lastfm_id_artista` INT,
 -- INDEX `fk_Spotify_lastfm_idx` (`lastfm_id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_Spotify_lastfm`
    FOREIGN KEY (`lastfm_id_artista`)
    REFERENCES `lastfm` (`id_artista`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)