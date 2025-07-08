CREATE SCHEMA IF NOT EXISTS `MusicTrends`;
USE `MusicTrends`;
CREATE TABLE IF NOT EXISTS `lastfm` (
  `id_artista` INT AUTO_INCREMENT NOT NULL,
  `nombre_artista` VARCHAR(100) NOT NULL,
  `bio` LONGTEXT NULL,
  `listeners` INT NULL,
  `playcount` INT NULL,
  `similar` LONGTEXT NULL,
  PRIMARY KEY (`id_artista`)
);
CREATE TABLE IF NOT EXISTS `Spotify` (
  `id_track` INT NOT NULL AUTO_INCREMENT,
  `nombre_cancion` VARCHAR(200) NULL,
  `nombre_artista` VARCHAR(100) NOT NULL,
  `id_artista` INT NULL,
  `año_lanzamiento` VARCHAR(4),
  `género_musical` VARCHAR(45) NULL,
  `tipo` VARCHAR(10) NULL,
  PRIMARY KEY(`id_track`),
  CONSTRAINT `fk_lastfm`
    FOREIGN KEY (`id_artista`)
    REFERENCES `lastfm`(`id_artista`)
	ON DELETE CASCADE
    ON UPDATE CASCADE);
    
SELECT COUNT(nombre_cancion)
FROM spotify
	WHERE año_lanzamiento=2019; -- 250 canciones por año
    
SELECT COUNT(nombre_cancion)
FROM spotify
	WHERE nombre_artista="various artists"; -- 511 trance
    
