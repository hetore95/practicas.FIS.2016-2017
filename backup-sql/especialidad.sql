INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Cardiología');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Dermatología');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Pediatría');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Psiquiatría');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Cardiovascular');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Aparato digestivo');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Fisioterapia');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Podología');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Odontología');
INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES (NULL, 'Psicología');

UPDATE `especialidad` SET `NOMBRE` = 'Rehabilitación' WHERE `especialidad`.`ID` = 19;
UPDATE `especialidad` SET `NOMBRE` = REPLACE(NOMBRE, '?', 'í') WHERE TIPO = 'Clínica';