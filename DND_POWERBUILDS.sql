CREATE DATABASE dnd_powerbuilds;
USE dnd_powerbuilds;

-- CREACIÓN DE TABLAS --
## TABLAS DIMENSIONALES ##
# Tabla CLASE
CREATE TABLE clase (
    id_clase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(10) NOT NULL,
    dados_hp VARCHAR(3) NOT NULL,
    full_casters BOOLEAN,
    ataque_extra BOOLEAN
);

# Tabla MANUAL
CREATE TABLE manual (
    id_manual VARCHAR(3) NOT NULL PRIMARY KEY,
    nombre_manual VARCHAR(50) NOT NULL UNIQUE,
    año DATE NOT NULL
);

# Tabla SUBCLASES
CREATE TABLE subclase (
    id_subclase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_subclase VARCHAR(50) NOT NULL,
    subclase_conjura BOOLEAN,
    id_clase INT NOT NULL,
    id_manual VARCHAR(3) NOT NULL,
    FOREIGN KEY (id_clase)
        REFERENCES clase (id_clase),
    FOREIGN KEY (id_manual)
        REFERENCES manual (id_manual)
);

# Tabla RAZA
CREATE TABLE raza (
    id_raza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_raza VARCHAR(15) NOT NULL,
    velocidad_base INT NOT NULL,
    tamaño CHAR NOT NULL,
    edad INT
);

# Tabla SUBRAZA
CREATE TABLE subraza (
    id_subraza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_subraza VARCHAR(50) NOT NULL,
    vision_noct INT,
    id_raza INT NOT NULL,
    id_manual VARCHAR(3) NOT NULL,
    FOREIGN KEY (id_raza)
        REFERENCES raza (id_raza),
    FOREIGN KEY (id_manual)
        REFERENCES manual (id_manual)
);

# Tabla CARACTERISTICAS
CREATE TABLE caracteristica (
    id_caract VARCHAR(3) NOT NULL PRIMARY KEY,
    nombre_caract VARCHAR(15) NOT NULL UNIQUE
);

# Tabla HABILIDAD
CREATE TABLE habilidad (
    id_habilid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_habilid VARCHAR(20) NOT NULL,
    id_caract VARCHAR(3) NOT NULL,
    FOREIGN KEY (id_caract)
        REFERENCES caracteristica (id_caract)
);

# Tabla TRASFONDO
CREATE TABLE trasfondo (
    id_trasfondo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_trasfondo VARCHAR(20) NOT NULL
);

# Tabla EQUIPO
CREATE TABLE equipo (
    id_equipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(30) NOT NULL,
    tipo_equipo VARCHAR(50) NOT NULL,
    daño_promedio INT
);

# Tabla CONJUROS_MAS
CREATE TABLE conjuros_mas (
    id_conjuro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_conjuro VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    concentracion BOOLEAN,
    id_manual VARCHAR(3) NOT NULL,
    FOREIGN KEY (id_manual)
        REFERENCES manual (id_manual)
);

# Tabla EXPERTO
CREATE TABLE experto (
    id_exp INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre_exp VARCHAR(50) NOT NULL UNIQUE,
    URL VARCHAR(100)
);

## TABLA DE HECHO ##
# Tabla POWERBUILD
CREATE TABLE powerbuild (
    id_build INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_subclase INT NOT NULL,
    id_subraza INT NOT NULL,
    id_trasfondo INT NOT NULL,
    tag VARCHAR(50),
    notas VARCHAR(200),
    FOREIGN KEY (id_subclase)
        REFERENCES subclase (id_subclase),
    FOREIGN KEY (id_subraza)
        REFERENCES subraza (id_subraza),
    FOREIGN KEY (id_trasfondo)
        REFERENCES trasfondo (id_trasfondo)
);

## TABLAS PUENTE ##
CREATE TABLE caractxclase (
    id_caractxclase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_clase INT NOT NULL,
    id_caract VARCHAR(3) NOT NULL,
    aptitud_magica BOOLEAN,
    FOREIGN KEY (id_clase)
        REFERENCES clase (id_clase),
    FOREIGN KEY (id_caract)
        REFERENCES caracteristica (id_caract)
);

CREATE TABLE caractxraza (
    id_caractxraza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_raza INT NOT NULL,
    id_caract VARCHAR(3) NOT NULL,
    mejora INT,
    FOREIGN KEY (id_raza)
        REFERENCES raza (id_raza),
    FOREIGN KEY (id_caract)
        REFERENCES caracteristica (id_caract)
);

CREATE TABLE habilidxclase (
    id_habilidxclase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_clase INT NOT NULL,
    id_habilid INT NOT NULL,
    FOREIGN KEY (id_clase)
        REFERENCES clase (id_clase),
    FOREIGN KEY (id_habilid)
        REFERENCES habilidad(id_habilid)
);

CREATE TABLE habilidxtrasf (
    id_habilidxtrasf INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_trasfondo INT NOT NULL,
    id_habilid INT NOT NULL,
    FOREIGN KEY (id_trasfondo)
        REFERENCES trasfondo (id_trasfondo),
    FOREIGN KEY (id_habilid)
        REFERENCES habilidad(id_habilid)
);

CREATE TABLE equipoxclase (
    id_equipoxclase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_clase INT NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_clase)
        REFERENCES clase (id_clase),
    FOREIGN KEY (id_equipo)
        REFERENCES equipo(id_equipo)
);

CREATE TABLE equipoxsubraza (
    id_equipoxsubraza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_subraza INT NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_subraza)
        REFERENCES subraza (id_subraza),
    FOREIGN KEY (id_equipo)
        REFERENCES equipo(id_equipo)
);

CREATE TABLE conjurosxclase (
    id_conjurosxclase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_clase INT NOT NULL,
    id_conjuro INT NOT NULL,
    FOREIGN KEY (id_clase)
        REFERENCES clase (id_clase),
    FOREIGN KEY (id_conjuro)
        REFERENCES conjuros_mas(id_conjuro)
);

CREATE TABLE conjuros_add (
    id_conjuros_add INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_subclase INT NOT NULL,
    id_conjuro INT NOT NULL,
    FOREIGN KEY (id_subclase)
        REFERENCES subclase (id_subclase),
    FOREIGN KEY (id_conjuro)
        REFERENCES conjuros_mas(id_conjuro)
);

CREATE TABLE ratingxsubclase (
    id_rating INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rating INT,
	id_subclase INT NOT NULL,
    id_exp INT NOT NULL,
    FOREIGN KEY (id_subclase)
        REFERENCES subclase (id_subclase),
    FOREIGN KEY (id_exp)
        REFERENCES experto(id_exp)
);

-- INSERCIÓN DE DATOS --
INSERT INTO manual VALUES 
('PHB','PLAYER´S HANDBOOK','2014-08-19'),
('XGE','XANATHAR´S GUIDE TO EVERYTHING','2017-11-15'),
('TCE','TASHA´S CAULDRON OF EVERYTHING','2020-11-17'),
('EGW','EXPLORER´S GUIDE TO WILDEMOUNT','2020-03-17');

INSERT INTO clase VALUES
(NULL,'ARTIFICE','d8',FALSE,FALSE),
(NULL,'BARBARO','d12',FALSE,TRUE),
(NULL,'BARDO','d8',TRUE,FALSE),
(NULL,'BRUJO','d8',FALSE,FALSE),
(NULL,'CLERIGO','d8',TRUE,FALSE),
(NULL,'DRUIDA','d8',TRUE,FALSE),
(NULL,'EXPLORADOR','d10',FALSE,TRUE),
(NULL,'GUERRERO','d10',FALSE,TRUE),
(NULL,'HECHICERO','d6',TRUE,FALSE),
(NULL,'MAGO','d6',TRUE,FALSE),
(NULL,'MONJE','d8',FALSE,TRUE),
(NULL,'PALADIN','d10',FALSE,TRUE),
(NULL,'PICARO','d8',FALSE,FALSE);

INSERT INTO raza VALUES 
(NULL,'ENANO',25,'M',350),
(NULL,'ELFO',30,'M',750),
(NULL,'MEDIANO',25,'S',250),
(NULL,'HUMANO',30,'M',80),
(NULL,'DRACONIDO',30,'M',80),
(NULL,'GNOMO',25,'S',500),
(NULL,'SEMIELFO',30,'M',180),
(NULL,'SEMIORCO',30,'M',75),
(NULL,'TIEFLING',30,'M',80);

INSERT INTO caracteristica VALUES
('STR','FUERZA'),
('DEX','DESTREZA'),
('CON','CONSTITUCION'),
('INT','INTELIGENCIA'),
('WIS','SABIDURIA'),
('CHA','CARISMA');

INSERT INTO habilidad VALUES
(NULL,'Atletismo','STR'),
(NULL,'Acrobacia','DEX'),
(NULL,'Juego de Manos','DEX'),
(NULL,'Sigilo','DEX'),
(NULL,'Arcana','INT'),
(NULL,'Historia','INT'),
(NULL,'Investigación','INT'),
(NULL,'Naturaleza','INT'),
(NULL,'Religión','INT'),
(NULL,'Medicina','WIS'),
(NULL,'Percepción','WIS'),
(NULL,'Perspicacia','WIS'),
(NULL,'Supervivencia','WIS'),
(NULL,'Trato con Animales','WIS'),
(NULL,'Engaño','CHA'),
(NULL,'Interpretación','CHA'),
(NULL,'Intimidación','CHA'),
(NULL,'Persuasión','CHA');

INSERT INTO subraza VALUES
(NULL,'Enano de las Colinas',60,(SELECT id_raza FROM raza WHERE nombre_raza='ENANO'),'PHB'),
(NULL,'Enano de las Montañas',60,(SELECT id_raza FROM raza WHERE nombre_raza='ENANO'),'PHB'),
(NULL,'Alto Elfo',60,(SELECT id_raza FROM raza WHERE nombre_raza='ELFO'),'PHB'),
(NULL,'Elfo de los Bosques',60,(SELECT id_raza FROM raza WHERE nombre_raza='ELFO'),'PHB'),
(NULL,'Elfo Oscuro',120,(SELECT id_raza FROM raza WHERE nombre_raza='ELFO'),'PHB'),
(NULL,'Elfo Pálido',60,(SELECT id_raza FROM raza WHERE nombre_raza='ELFO'),'EGW'),
(NULL,'Elfo del Mar',60,(SELECT id_raza FROM raza WHERE nombre_raza='ELFO'),'EGW'),
(NULL,'Piesligeros',0,(SELECT id_raza FROM raza WHERE nombre_raza='MEDIANO'),'PHB'),
(NULL,'Fornido',0,(SELECT id_raza FROM raza WHERE nombre_raza='MEDIANO'),'PHB'),
(NULL,'Lotusden',0,(SELECT id_raza FROM raza WHERE nombre_raza='MEDIANO'),'EGW'),
(NULL,'Humano',0,(SELECT id_raza FROM raza WHERE nombre_raza='HUMANO'),'PHB'),
(NULL,'Variante',0,(SELECT id_raza FROM raza WHERE nombre_raza='HUMANO'),'PHB'),
(NULL,'Dracónido',0,(SELECT id_raza FROM raza WHERE nombre_raza='DRACONIDO'),'PHB'),
(NULL,'Dragonborn',60,(SELECT id_raza FROM raza WHERE nombre_raza='DRACONIDO'),'EGW'),
(NULL,'Ravenite',60,(SELECT id_raza FROM raza WHERE nombre_raza='DRACONIDO'),'EGW'),
(NULL,'Gnomo de los Bosques',60,(SELECT id_raza FROM raza WHERE nombre_raza='GNOMO'),'PHB'),
(NULL,'Gnomo de las Rocas',60,(SELECT id_raza FROM raza WHERE nombre_raza='GNOMO'),'PHB'),
(NULL,'Semielfo',60,(SELECT id_raza FROM raza WHERE nombre_raza='SEMIELFO'),'PHB'),
(NULL,'Semiorco',60,(SELECT id_raza FROM raza WHERE nombre_raza='SEMIORCO'),'PHB'),
(NULL,'Tiefling',60,(SELECT id_raza FROM raza WHERE nombre_raza='TIEFLING'),'PHB');

INSERT INTO trasfondo VALUES
(NULL,'Acólito'),
(NULL,'Animador'),
(NULL,'Artesano Gremial'),
(NULL,'Charlatán'),
(NULL,'Criminal'),
(NULL,'Ermitaño'),
(NULL,'Erudito'),
(NULL,'Héroe del Pueblo'),
(NULL,'Huérfano'),
(NULL,'Marinero'),
(NULL,'Noble'),
(NULL,'Salvaje'),
(NULL,'Soldado');

INSERT INTO experto VALUES
(NULL,'Dungeon Dudes','https://www.youtube.com/channel/UCQDKouT6G_6P1eBIfkTkC-w'),
(NULL,'Now You Roll','https://www.nowyouroll.com/'),
(NULL,'RPG Bot','https://rpgbot.net/'),
(NULL,'Critical Role','https://critrole.com/'),
(NULL,'Wargamer','https://www.wargamer.com/');

-- CREACIÓN DE VISTAS -- 
#TOP 10 SUBCLASES
CREATE OR REPLACE VIEW top_10_subclases AS
(SELECT get_clase(id_clase) as CLASE,subclase.nombre_subclase as SUBCLASE,prom_rating(ratingxsubclase.id_subclase) as Rating_Promedio
FROM ratingxsubclase
INNER JOIN subclase ON ratingxsubclase.id_subclase = subclase.id_subclase
GROUP BY subclase.id_subclase
ORDER BY rating_promedio DESC
LIMIT 10);

#DESCRIPCIÓN DE POWERBUILDS
CREATE OR REPLACE VIEW powerbuild_desc AS
(SELECT powerbuild.id_build,get_clase(id_clase) as CLASE,subclase.nombre_subclase as SUBCLASE,get_raza(id_raza) as RAZA,subraza.nombre_subraza as SUBRAZA,trasfondo.nombre_trasfondo as TRASFONDO,tag,notas
FROM powerbuild 
INNER JOIN subclase ON powerbuild.id_subclase = subclase.id_subclase
INNER JOIN subraza ON powerbuild.id_subraza = subraza.id_subraza
INNER JOIN trasfondo ON powerbuild.id_trasfondo = trasfondo.id_trasfondo);

#HABILIDADESxCLASE más comunes
CREATE OR REPLACE VIEW habilid_comunes_clase AS
(SELECT habilidad.id_habilid,habilidad.nombre_habilid,COUNT(*) AS cant_habilidxclase
FROM habilidxclase
INNER JOIN habilidad ON habilidxclase.id_habilid = habilidad.id_habilid
GROUP BY id_habilid ORDER BY cant_habilidxclase DESC);

#CONJUROS ADICIONALES X SUBCLASE
CREATE OR REPLACE VIEW conjuros_addxsubclase AS
(SELECT get_clase(id_clase) AS nombre_clase,subclase.nombre_subclase,conjuros_mas.nombre_conjuro,conjuros_mas.nivel
FROM conjuros_add
INNER JOIN conjuros_mas ON conjuros_add.id_conjuro = conjuros_mas.id_conjuro
INNER JOIN subclase ON conjuros_add.id_subclase = subclase.id_subclase);

#SUBCLASES QUE CASTEAN
CREATE OR REPLACE VIEW subclases_conjuradoras AS
(SELECT subclase.nombre_subclase,clase.nombre_clase 
FROM subclase
INNER JOIN clase ON subclase.id_clase=clase.id_clase WHERE subclase_conjura=1);

-- CREACIÓN DE FUNCIONES -- 
#CALCULAR PROMEDIO DE RATING X SUBCLASE
DELIMITER $$
CREATE FUNCTION prom_rating (subclase int)
RETURNS FLOAT
DETERMINISTIC
BEGIN 
	DECLARE promedio FLOAT;
    
	SELECT AVG(rating) INTO promedio 
    FROM ratingxsubclase
	WHERE id_subclase = subclase
    LIMIT 1;
    
    RETURN promedio;
END$$
DELIMITER ;

#TRAER NOMBRE DE RAZA X ID
DELIMITER $$
CREATE FUNCTION get_raza(id_razaxsubraza int)
RETURNS VARCHAR(15)
READS SQL DATA
BEGIN
	DECLARE razaxsubraza VARCHAR(15);
    
    SELECT nombre_raza INTO razaxsubraza
    FROM raza
    WHERE id_raza = id_razaxsubraza;
    
    RETURN razaxsubraza;
END$$
DELIMITER ;

#TRAER NOMBRE DE CLASE X ID
DELIMITER $$
CREATE FUNCTION get_clase(id_clasexsubclase int)
RETURNS VARCHAR(10)
READS SQL DATA
BEGIN
	DECLARE clasexsubclase VARCHAR(10);
    
    SELECT nombre_clase INTO clasexsubclase
    FROM clase
    WHERE id_clase = id_clasexsubclase;
    
    RETURN clasexsubclase;
END$$
DELIMITER ;

-- CREACIÓN DE STORED PROCEDURES --
##SP DE ORDENAMIENTO DE TABLA CONJUROS_MAS
DELIMITER $$
CREATE PROCEDURE orden_conjuros_mas (IN campo VARCHAR (15), IN tipo_orden VARCHAR(4))
BEGIN
	IF campo <> '' AND tipo_orden = 'ASC' THEN
		SET @ordenar = concat('ORDER BY ', campo);
	ELSEIF campo <> '' AND tipo_orden = 'DESC' THEN
		SET @ordenar = concat('ORDER BY ', campo, ' DESC');
	ELSEIF campo <> '' AND tipo_orden NOT IN ('ASC','DESC') THEN
		SET @ordenar = 'Invalido';
		SELECT 'Debe indicarse orden "ASC" o "DESC"' AS ERROR;
    ELSE
		SET @ordenar = '';
	END IF;	    
    	IF @ordenar <> 'Inválido' THEN
		SET @clausula = concat('SELECT * FROM conjuros_mas ', @ordenar);
		PREPARE ejecucion FROM @clausula;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;	    
END$$
DELIMITER ;


##SP DE INSERCIÓN EN LA TABLA POWERBUILDS
DROP PROCEDURE IF EXISTS ins_del_powerbuilds;
DELIMITER $$
CREATE PROCEDURE ins_del_powerbuilds (IN accion VARCHAR(8),id INT,subclase INT, subraza INT, trasfondo INT, tag VARCHAR(50), notas VARCHAR(200))
BEGIN
	IF accion = 'ELIMINAR' THEN
	BEGIN
		DELETE FROM powerbuild WHERE id_build=id; 
	END;
	ELSEIF accion = 'INSERTAR' THEN
    BEGIN
		INSERT INTO powerbuild VALUES (id,subclase,subraza,trasfondo,tag,notas);
	END;
	ELSE
		SELECT 'Ingrese instrucción "INSERTAR" o "ELIMINAR"' AS ERROR;
	END IF;
    SELECT * FROM powerbuild ORDER BY id_build DESC;
END $$
DELIMITER ;


-- CREACIÓN DE TRIGGERS --
	-- Tablas log sobre powerbuild --
## TRIGGER AFTER: Log de evento de inserción
CREATE TABLE log_insercion_build (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_build INT NOT NULL,
    usuario VARCHAR(50),
    fecha_log DATETIME
);

CREATE TRIGGER ins_build 
AFTER INSERT ON powerbuild
FOR EACH ROW
INSERT INTO log_insercion_build VALUES (NULL,new.id_build,user(),now());

## TRIGGER BEFORE: Log de cantidad de builds creadas con la misma subclase que se inserta
CREATE TABLE log_cant_powerbuilds (
	id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cant_builds INT NOT NULL,
    id_subclase INT NOT NULL,
    usuario VARCHAR(50),
    fecha_log DATETIME
);

DELIMITER $$
CREATE TRIGGER contar_buildsxsubclase
BEFORE INSERT ON powerbuild
FOR EACH ROW
BEGIN
	SET @contar_builds = (SELECT COUNT(*) FROM powerbuild WHERE id_subclase=new.id_subclase);
	INSERT INTO log_cant_powerbuilds VALUES (NULL,@contar_builds,new.id_subclase,user(),now());
END $$
DELIMITER ;

	-- Tablas log sobre ratingxsubclase --
## TRIGGER AFTER: Log de evento de inserción
CREATE TABLE log_modificacion_ratingxsubclase (
	id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_rating INT NOT NULL,
    rating_v INT NOT NULL,
    rating_n INT NOT NULL,
    usuario VARCHAR (50),
    fecha_log DATETIME
);

CREATE TRIGGER upd_rating
AFTER UPDATE ON ratingxsubclase
FOR EACH ROW
INSERT INTO log_modificacion_ratingxsubclase VALUES (NULL,old.id_rating,old.rating,new.rating,user(),now());

## TRIGGER BEFORE: Log 
CREATE TABLE log_cant_ratings (
	id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cant_ratings INT NOT NULL,
    id_exp INT NOT NULL,
    usuario VARCHAR(50),
    fecha_log DATETIME
);

DELIMITER $$
CREATE TRIGGER contar_ratingxsubclase
BEFORE INSERT ON ratingxsubclase
FOR EACH ROW
BEGIN
	SET @contar_ratings = (SELECT COUNT(*) FROM ratingxsubclase);
	INSERT INTO log_cant_ratings VALUES (NULL,@contar_ratings,new.id_exp,user(),now());
END$$
DELIMITER ;

	-- SUBLENGUAJE DCL --
-- Creación de usuarios -- 
## Creación de usuario de solo lectura
CREATE USER 'solo_lectura'@'localhost' identified by '1234';
## Creación de usuario para lectura, inserción y modificación de datos
CREATE USER 'sel_ins_mod'@'localhost' identified by '1234';

SHOW GRANTS FOR 'solo_lectura'@'localhost';
SHOW GRANTS FOR 'sel_ins_mod'@'localhost';

-- Otorgar permisos --
## Otorga permisos de solo lectura (SELECT) sobre la base dnd_powerbuilds
GRANT SELECT ON dnd_powerbuilds.* TO 'solo_lectura'@'localhost';
## Otorga permisos de lectura, inserción y modificación de datos (SELECT,INSERT,UPDATE) sobre la base dnd_powerbuilds
GRANT SELECT, INSERT, UPDATE ON dnd_powerbuilds.* TO 'sel_ins_mod'@'localhost';


	-- SUBLENGUAJE TCL --
SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT=0;
-- SET AUTOCOMMIT=1;

# Transacción 1
INSERT INTO powerbuild VALUES (6,35,3,1,NULL,NULL);
INSERT INTO powerbuild VALUES (7,37,4,6,NULL,NULL);
INSERT INTO powerbuild VALUES (8,45,12,9,NULL,NULL);
START TRANSACTION;
DELETE FROM powerbuild WHERE id_build=6;
DELETE FROM powerbuild WHERE id_build=7;
DELETE FROM powerbuild WHERE id_build=8;
-- ROLLBACK;
-- COMMIT;

# Transacción 2
START TRANSACTION;
INSERT INTO ratingxsubclase VALUES (NULL,4,38,3);
INSERT INTO ratingxsubclase VALUES (NULL,2,39,3);
INSERT INTO ratingxsubclase VALUES (NULL,5,40,3);
INSERT INTO ratingxsubclase VALUES (NULL,5,41,3);
SAVEPOINT lot1_4;
INSERT INTO ratingxsubclase VALUES (NULL,4,42,3);
INSERT INTO ratingxsubclase VALUES (NULL,4,43,3);
INSERT INTO ratingxsubclase VALUES (NULL,5,44,3);
INSERT INTO ratingxsubclase VALUES (NULL,5,45,3);
SAVEPOINT lot5_8;
-- RELEASE SAVEPOINT lot1_4;
