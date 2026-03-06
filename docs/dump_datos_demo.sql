-- ========================================
-- DUMP DE DATOS DEMO - GESTOR DE TORNEOS
-- ========================================
-- Para video de presentacion y pruebas
-- Ejecutar despues de crear el schema

SET FOREIGN_KEY_CHECKS = 0;

-- Limpiar tablas existentes (opcional - descomentar si es necesario)
TRUNCATE TABLE participacion;
TRUNCATE TABLE partido;
TRUNCATE TABLE equipo_miembros;
TRUNCATE TABLE equipo;
TRUNCATE TABLE establecimiento;
TRUNCATE TABLE evento;
TRUNCATE TABLE noticia;
TRUNCATE TABLE invitacion;
TRUNCATE TABLE usuario;
TRUNCATE TABLE localidad;
TRUNCATE TABLE deporte;

-- ========================================
-- DEPORTES
-- ========================================
INSERT INTO deporte (id, nombre, cant_min_jugadores, cant_max_jugadores, duracion) VALUES
(1, 'Futbol 11', 11, 18, 90),
(2, 'Futbol 5', 5, 8, 50),
(3, 'Basquet', 5, 12, 40),
(4, 'Voley', 6, 12, 60),
(5, 'Handball', 7, 14, 60),
(6, 'Tenis', 1, 4, 120),
(7, 'Padel', 2, 4, 90),
(8, 'Futbol 7', 7, 12, 70),
(9, 'Rugby', 15, 23, 80),
(10, 'Hockey', 11, 18, 70),
(11, 'Natacion', 1, 8, 60),
(12, 'Atletismo', 1, 20, 120);

-- ========================================
-- LOCALIDADES
-- ========================================
INSERT INTO localidad (id, descripcion, lat, lng, codigo) VALUES
(1, 'Rosario, Santa Fe', '-32.9442', '-60.6505', 'ROS-SF'),
(2, 'Cordoba, Cordoba', '-31.4201', '-64.1888', 'CBA-CBA'),
(3, 'Buenos Aires, CABA', '-34.6037', '-58.3816', 'BSAS-CABA'),
(4, 'Mendoza, Mendoza', '-32.8895', '-68.8458', 'MDZ-MDZ'),
(5, 'Villa Maria, Cordoba', '-32.4072', '-63.2401', 'VM-CBA'),
(6, 'San Miguel de Tucuman, Tucuman', '-26.8083', '-65.2176', 'SMT-TUC'),
(7, 'La Plata, Buenos Aires', '-34.9205', '-57.9536', 'LP-BUE'),
(8, 'Mar del Plata, Buenos Aires', '-38.0055', '-57.5426', 'MDP-BUE'),
(9, 'Salta, Salta', '-24.7859', '-65.4117', 'SLT-SLT'),
(10, 'Posadas, Misiones', '-27.3671', '-55.8961', 'POS-MIS'),
(11, 'Neuquen, Neuquen', '-38.9516', '-68.0591', 'NQN-NQN'),
(12, 'Santa Fe, Santa Fe', '-31.6333', '-60.7000', 'SF-SF');

-- ========================================
-- USUARIOS
-- ========================================
-- Contrasena para todos: "demo123" (hash bcrypt real)
INSERT INTO usuario (id, nombre, apellido, usuario, contrasenia, email, role, fecha_nacimiento, estado, ultimo_login) VALUES
(1, 'Admin', 'Sistema', 'admin', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'admin@gestortorneos.com', 'Administrador', '1990-01-01', 1, NOW()),
(2, 'Juan', 'Perez', 'jperez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'jperez@email.com', 'Usuario', '1995-03-15', 1, NOW()),
(3, 'Maria', 'Gonzalez', 'mgonzalez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mgonzalez@email.com', 'Usuario', '1998-07-22', 1, NOW()),
(4, 'Carlos', 'Rodriguez', 'crodriguez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'crodriguez@email.com', 'Usuario', '1992-11-08', 1, NOW()),
(5, 'Ana', 'Martinez', 'amartinez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'amartinez@email.com', 'Usuario', '1997-05-30', 1, NOW()),
(6, 'Luis', 'Fernandez', 'lfernandez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'lfernandez@email.com', 'Usuario', '1994-09-12', 1, NOW()),
(7, 'Laura', 'Lopez', 'llopez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'llopez@email.com', 'Usuario', '1996-02-18', 1, NOW()),
(8, 'Pablo', 'Sanchez', 'psanchez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'psanchez@email.com', 'Usuario', '1993-12-05', 1, NOW()),
(9, 'Sofia', 'Romero', 'sromero', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'sromero@email.com', 'Usuario', '1999-08-25', 1, NOW()),
(10, 'Diego', 'Torres', 'dtorres', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'dtorres@email.com', 'Usuario', '1991-04-17', 1, NOW()),
(11, 'Valentina', 'Ramirez', 'vramirez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'vramirez@email.com', 'Usuario', '2000-01-09', 1, NOW()),
(12, 'Martin', 'Flores', 'mflores', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mflores@email.com', 'Usuario', '1995-06-14', 1, NOW()),
(13, 'Camila', 'Silva', 'csilva', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'csilva@email.com', 'Usuario', '1998-10-21', 1, NOW()),
(14, 'Lucas', 'Vargas', 'lvargas', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'lvargas@email.com', 'Usuario', '1992-03-28', 1, NOW()),
(15, 'Juliana', 'Castro', 'jcastro', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'jcastro@email.com', 'Usuario', '1997-11-03', 1, NOW()),
(16, 'Federico', 'Morales', 'fmorales', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'fmorales@email.com', 'Usuario', '1994-07-19', 1, NOW()),
(17, 'Daniela', 'Gimenez', 'dgimenez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'dgimenez@email.com', 'Usuario', '1996-12-11', 1, NOW()),
(18, 'Matias', 'Medina', 'mmedina', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mmedina@email.com', 'Usuario', '1993-05-06', 1, NOW()),
(19, 'Agustina', 'Navarro', 'anavarro', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'anavarro@email.com', 'Usuario', '1998-04-02', 1, NOW()),
(20, 'Nicolas', 'Herrera', 'nherrera', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'nherrera@email.com', 'Usuario', '1994-08-19', 1, NOW()),
(21, 'Florencia', 'Acosta', 'facosta', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'facosta@email.com', 'Usuario', '1999-06-11', 1, NOW()),
(22, 'Tomas', 'Rinaldi', 'trinaldi', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'trinaldi@email.com', 'Usuario', '1993-10-27', 1, NOW()),
(23, 'Micaela', 'Suarez', 'msuarez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'msuarez@email.com', 'Usuario', '1997-01-14', 1, NOW()),
(24, 'Bruno', 'Quiroga', 'bquiroga', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'bquiroga@email.com', 'Usuario', '1992-12-03', 1, NOW()),
(25, 'Renata', 'Ponce', 'rponce', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'rponce@email.com', 'Usuario', '2000-09-08', 1, NOW()),
(26, 'Santiago', 'Leiva', 'sleiva', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'sleiva@email.com', 'Administrador', '1991-05-21', 1, NOW()),
(27, 'Ignacio', 'Santos', 'isantos', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'isantos@email.com', 'Usuario', '1995-02-14', 1, NOW()),
(28, 'Veronica', 'Carrillo', 'vcarrillo', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'vcarrillo@email.com', 'Usuario', '1998-09-22', 1, NOW()),
(29, 'Rodrigo', 'Araya', 'raraya', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'raraya@email.com', 'Usuario', '1992-06-05', 1, NOW()),
(30, 'Lisandra', 'Gomez', 'lgomez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'lgomez@email.com', 'Usuario', '1997-03-18', 1, NOW()),
(31, 'Guillermo', 'Benitez', 'gbenitez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'gbenitez@email.com', 'Usuario', '1994-11-30', 1, NOW()),
(32, 'Adriana', 'Vega', 'avega', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'avega@email.com', 'Usuario', '1996-08-09', 1, NOW()),
(33, 'Cristian', 'Rojas', 'crojas', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'crojas@email.com', 'Usuario', '1993-04-25', 1, NOW()),
(34, 'Cecilia', 'Miranda', 'cmiranda', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'cmiranda@email.com', 'Usuario', '1999-07-12', 1, NOW()),
(35, 'Marcelo', 'Valencia', 'mvalencia', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mvalencia@email.com', 'Usuario', '1991-12-16', 1, NOW()),
(36, 'Alejandra', 'Fuentes', 'afuentes', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'afuentes@email.com', 'Usuario', '1998-05-03', 1, NOW()),
(37, 'Antonio', 'Heredia', 'aheredia', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aheredia@email.com', 'Usuario', '1994-10-11', 1, NOW()),
(38, 'Beatriz', 'Navarro', 'bnavarro', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'bnavarro@email.com', 'Usuario', '1997-01-20', 1, NOW()),
(39, 'Gabriel', 'Campos', 'gcampos', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'gcampos@email.com', 'Usuario', '1993-08-07', 1, NOW()),
(40, 'Esperanza', 'Ramos', 'eramos', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'eramos@email.com', 'Usuario', '2000-04-14', 1, NOW()),
(41, 'Javier', 'Cabrera', 'jcabrera', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'jcabrera@email.com', 'Usuario', '1995-11-22', 1, NOW()),
(42, 'Mariana', 'Dominguez', 'mdominguez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mdominguez@email.com', 'Usuario', '1998-02-09', 1, NOW()),
(43, 'Andres', 'Granada', 'agranada', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'agranada@email.com', 'Usuario', '1992-09-27', 1, NOW()),
(44, 'Lorena', 'Valenzuela', 'lvalenzuela', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'lvalenzuela@email.com', 'Usuario', '1996-06-15', 1, NOW()),
(45, 'Eduardo', 'Burgos', 'eburgos', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'eburgos@email.com', 'Usuario', '1993-12-04', 1, NOW()),
(46, 'Paulina', 'Robles', 'probles', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'probles@email.com', 'Usuario', '1997-07-19', 1, NOW()),
(47, 'Fernando', 'Pina', 'fpina', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'fpina@email.com', 'Usuario', '1994-03-10', 1, NOW()),
(48, 'Catalina', 'Vasquez', 'cvasquez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'cvasquez@email.com', 'Usuario', '1998-10-31', 1, NOW()),
(49, 'Ricardo', 'Contreras', 'rcontreras', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'rcontreras@email.com', 'Usuario', '1991-05-08', 1, NOW()),
(50, 'Natalia', 'Reyes', 'nreyes', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'nreyes@email.com', 'Usuario', '1999-01-26', 1, NOW()),
(51, 'Vicente', 'Parra', 'vparra', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'vparra@email.com', 'Usuario', '1995-08-14', 1, NOW()),
(52, 'Gisela', 'Leon', 'gleon', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'gleon@email.com', 'Usuario', '1996-12-02', 1, NOW()),
(53, 'Sergio', 'Ramirez', 'sramirez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'sramirez@email.com', 'Usuario', '1993-11-17', 1, NOW()),
(54, 'Veronica', 'Ruiz', 'vruiz', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'vruiz@email.com', 'Usuario', '1997-04-29', 1, NOW()),
(55, 'Hector', 'Saez', 'hsaez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'hsaez@email.com', 'Usuario', '1992-09-13', 1, NOW()),
(56, 'Fabiola', 'Tapia', 'ftapia', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'ftapia@email.com', 'Usuario', '1998-06-21', 1, NOW()),
(57, 'Mauricio', 'Toledo', 'mtoledo', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'mtoledo@email.com', 'Usuario', '1994-02-05', 1, NOW()),
(58, 'Susana', 'Urrutia', 'surrutia', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'surrutia@email.com', 'Usuario', '1996-11-12', 1, NOW()),
(59, 'Julio', 'Vargas', 'jvargas', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'jvargas@email.com', 'Usuario', '1993-10-28', 1, NOW()),
(60, 'Ximena', 'Vidal', 'xvidul', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'xvidul@email.com', 'Usuario', '1990-07-06', 1, NOW()),
(61, 'Ismael', 'Yañez', 'iyanez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'iyanez@email.com', 'Usuario', '1999-03-24', 1, NOW()),
(62, 'Zinnia', 'Zarate', 'zzarate', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'zzarate@email.com', 'Usuario', '1997-12-09', 1, NOW()),
(63, 'Walter', 'Zavala', 'wzavala', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'wzavala@email.com', 'Usuario', '1991-06-03', 1, NOW()),
(64, 'Yolanda', 'Zambrano', 'yzambrano', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'yzambrano@email.com', 'Usuario', '1998-04-17', 1, NOW()),
(65, 'Xavier', 'Zepeda', 'xzepeda', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'xzepeda@email.com', 'Usuario', '1995-09-11', 1, NOW()),
(66, 'Yara', 'Zorrilla', 'yzorrilla', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'yzorrilla@email.com', 'Usuario', '1994-01-29', 1, NOW()),
(67, 'Zael', 'Albornoz', 'zalbornoz', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'zalbornoz@email.com', 'Usuario', '1992-07-14', 1, NOW()),
(68, 'Alicia', 'Alcantara', 'aalcantara', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aalcantara@email.com', 'Usuario', '1997-05-20', 1, NOW()),
(69, 'Adolfo', 'Alecio', 'aalecio', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aalecio@email.com', 'Usuario', '1998-02-08', 1, NOW()),
(70, 'Amelia', 'Alfaro', 'aalfaro', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aalfaro@email.com', 'Usuario', '1996-10-25', 1, NOW()),
(71, 'Aurelio', 'Alvarez', 'aalvarez', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aalvarez@email.com', 'Usuario', '1993-03-19', 1, NOW()),
(72, 'Amparo', 'Amador', 'aamador', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aamador@email.com', 'Usuario', '1999-08-11', 1, NOW()),
(73, 'Arturo', 'Amoroso', 'aamoroso', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aamoroso@email.com', 'Usuario', '1991-11-06', 1, NOW()),
(74, 'Aurora', 'Andreu', 'aandreu', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aandreu@email.com', 'Usuario', '1990-04-22', 1, NOW()),
(75, 'Aurelio', 'Andres', 'aandres', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aandres@email.com', 'Usuario', '2000-12-30', 1, NOW()),
(76, 'Agustin', 'Anh', 'aanh', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aanh@email.com', 'Usuario', '1995-06-13', 1, NOW()),
(77, 'Angelic', 'Anita', 'aanita', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aanita@email.com', 'Usuario', '1998-09-01', 1, NOW()),
(78, 'Aramis', 'Antero', 'aantero', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aantero@email.com', 'Usuario', '1994-05-16', 1, NOW()),
(79, 'Azul', 'Apia', 'aapia', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aapia@email.com', 'Usuario', '1993-07-28', 1, NOW()),
(80, 'Arjen', 'Apodaca', 'aapodaca', '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 'aapodaca@email.com', 'Usuario', '1992-02-12', 1, NOW());

-- ========================================
-- EVENTOS / TORNEOS
-- ========================================
INSERT INTO evento (id, nombre, descripcion, es_publico, contrasenia, cant_equipos_max, fecha_inicio_inscripcion, fecha_fin_inscripcion, fecha_inicio_evento, fecha_fin_evento, codigo, creador_id, deporte_id, localidad_id) VALUES
(1, 'Copa Primavera 2026', 'Torneo de futbol 11 categoria libre. Participa y demostra tu talento en la cancha.', 1, NULL, 16, '2026-02-01', '2026-02-28', '2026-03-05', '2026-04-30', 'COPA-PRIM-2026', 2, 1, 1),
(2, 'Liga Rapida Futbol 5', 'Torneo express de futbol 5. Formato todos contra todos.', 1, NULL, 8, '2026-01-15', '2026-02-15', '2026-02-20', '2026-03-20', 'LIGA-F5-2026', 3, 2, 1),
(3, 'Torneo Basquet Universitario', 'Campeonato interuniversitario de basquet. Inscripciones abiertas.', 1, NULL, 12, '2026-02-10', '2026-03-10', '2026-03-15', '2026-05-15', 'BASQUET-UNI-26', 4, 3, 2),
(4, 'Voley Mixto Verano', 'Torneo de voley con equipos mixtos. Ambiente competitivo y recreativo.', 1, NULL, 10, '2026-01-20', '2026-02-20', '2026-02-25', '2026-04-10', 'VOLEY-MIX-26', 5, 4, 3),
(5, 'Handball Clausura 2026', 'Torneo de handball categoria senior. Clasificacion a regional.', 0, '$2b$10$sIBjctI36JJ52lV/TmHt9OYN2UoK4GMEVWPNZ.ZdEwLPGVNZiBm5e', 8, '2026-02-05', '2026-03-05', '2026-03-10', '2026-05-20', 'HAND-CLAU-26', 6, 5, 4),
(6, 'Copa Relampago Futbol 5', 'Torneo express en un solo dia. 8 equipos, eliminacion directa.', 1, NULL, 8, '2026-03-01', '2026-03-10', '2026-03-15', '2026-03-15', 'RELAMPAGO-F5', 2, 2, 5),
(7, 'Abierto de Tenis Otono 2026', 'Competencia amateur de tenis en formato liga corta.', 1, NULL, 12, '2026-02-15', '2026-03-25', '2026-04-01', '2026-05-10', 'TENIS-OTO-26', 20, 6, 2),
(8, 'Circuito Padel Doble Mixto', 'Fecha inicial del circuito anual de padel por parejas.', 1, NULL, 16, '2026-02-10', '2026-03-30', '2026-04-05', '2026-05-20', 'PADEL-MIX-26', 21, 7, 3),
(9, 'Liga Voley Apertura Centro', 'Liga regional de voley con grupos y cruces eliminatorios.', 1, NULL, 12, '2026-02-20', '2026-04-05', '2026-04-12', '2026-06-01', 'VOLEY-CENTRO-26', 23, 4, 6),
(10, 'Futbol 7 Primavera 2026', 'Torneo de futbol 7 con formato liga. Dinamica y emocion en cada partido.', 1, NULL, 12, '2026-03-01', '2026-03-20', '2026-03-25', '2026-05-15', 'F7-PRIM-26', 7, 8, 4),
(11, 'Rugby Abierto Centro', 'Campeonato regional de rugby. Categoria senior mezcla. Inscripcion abierta.', 1, NULL, 10, '2026-03-02', '2026-03-30', '2026-04-05', '2026-05-30', 'RUGBY-CENTRO-26', 12, 9, 7),
(12, 'Hockey Amateur Verano', 'Torneo amistoso de hockey para equipos amateur. Ambiente competitivo.', 1, NULL, 12, '2026-03-03', '2026-03-25', '2026-03-30', '2026-05-10', 'HOCKEY-VERANO-26', 18, 10, 11);

-- ========================================
-- ESTABLECIMIENTOS
-- ========================================
INSERT INTO establecimiento (id, nombre, direccion, evento_id) VALUES
(1, 'Complejo Deportivo Central', 'Av. Pellegrini 2500, Rosario', 1),
(2, 'Cancha Sintetica El Potrero', 'Riobamba 1234, Rosario', 2),
(3, 'Gimnasio Municipal Cordoba', 'Av. Colon 3400, Cordoba', 3),
(4, 'Polideportivo CABA Norte', 'Av. del Libertador 4500, CABA', 4),
(5, 'Club Deportivo Mendoza', 'San Martin 890, Mendoza', 5),
(6, 'Complejo La Cancha', 'Bv. Espana 567, Villa Maria', 6),
(7, 'Tenis Club Centro', 'Av. Velez Sarsfield 1550, Cordoba', 7),
(8, 'Arena Padel Palermo', 'Godoy Cruz 1800, CABA', 8),
(9, 'Polideportivo Norte', 'Av. Mate de Luna 900, Tucuman', 9),
(10, 'Cancha F7 Mendoza', 'Av. San Martin 1200, Mendoza', 10),
(11, 'Estadio Rugby La Plata', 'Calle 1 esq. 50, La Plata', 11),
(12, 'Pista Hockey Neuquen', 'Ruta 7 Km 5, Neuquen', 12);

-- ========================================
-- EQUIPOS
-- ========================================
INSERT INTO equipo (id, nombre, nombre_capitan, puntos, es_publico, contrasenia, evento_id, capitan_id) VALUES
-- Equipos Copa Primavera (Evento 1)
(1, 'Los Tigres FC', 'Juan Perez', 9, 1, NULL, 1, 2),
(2, 'aguilas United', 'Martin Flores', 7, 1, NULL, 1, 12),
(3, 'Leones del Sur', 'Tomas Rinaldi', 6, 1, NULL, 1, 22),
(4, 'Halcones FC', 'Adriana Vega', 4, 1, NULL, 1, 32),
-- Equipos Liga Futbol 5 (Evento 2)
(5, 'Rapidos y Furiosos', 'Mariana Dominguez', 12, 1, NULL, 2, 42),
(6, 'Los Cracks', 'Catalina Vasquez', 10, 1, NULL, 2, 48),
(7, 'Team Relampago', 'Veronica Ruiz', 9, 1, NULL, 2, 54),
(8, 'Escuadron 5', 'Ximena Vidal', 6, 1, NULL, 2, 60),
-- Equipos Basquet (Evento 3)
(9, 'Condores Basket', 'Yara Zorrilla', 8, 1, NULL, 3, 66),
(10, 'Halcones Negros', 'Amparo Amador', 7, 1, NULL, 3, 72),
(11, 'Titanes BC', 'Aramis Antero', 5, 1, NULL, 3, 78),
-- Equipos Voley (Evento 4)
(12, 'Voley Stars', 'Laura Lopez', 6, 1, NULL, 4, 7),
(13, 'Net Warriors', 'Camila Silva', 4, 1, NULL, 4, 13),
(14, 'Spike Masters', 'Agustina Navarro', 3, 1, NULL, 4, 19),
-- Equipos Handball (Evento 5)
(15, 'Handball Elite', 'Santiago Leiva', 5, 1, NULL, 5, 26),
(16, 'Gladiadores HC', 'Cristian Rojas', 4, 1, NULL, 5, 33),
-- Equipos Copa Relampago (Evento 6)
(17, 'Flash FC', 'Javier Cabrera', 0, 1, NULL, 6, 41),
(18, 'Veloces FC', 'Ricardo Contreras', 0, 1, NULL, 6, 49),
-- Equipos Tenis (Evento 7)
(19, 'Smash Norte', 'Fabiola Tapia', 0, 1, NULL, 7, 56),
(20, 'Drive Winners', 'Zinnia Zarate', 0, 1, NULL, 7, 62),
(21, 'Topspin Team', 'Alicia Alcantara', 0, 1, NULL, 7, 68),
-- Equipos Padel (Evento 8)
(22, 'Padel Point', 'Juan Perez', 0, 1, NULL, 8, 2),
(23, 'Lob y Vibora', 'Laura Lopez', 0, 1, NULL, 8, 7),
(24, 'Cristal Pair', 'Martin Flores', 0, 1, NULL, 8, 12),
(25, 'Bandeja Pro', 'Matias Medina', 0, 1, NULL, 8, 18),
-- Equipos Voley (Evento 9)
(26, 'Red Storm', 'Micaela Suarez', 0, 1, NULL, 9, 23),
(27, 'Saque Total', 'Lisandra Gomez', 0, 1, NULL, 9, 30),
(28, 'Bloqueo Sur', 'Antonio Heredia', 0, 1, NULL, 9, 37),
-- Equipos Futbol 7 (Evento 10 - INSCRIPCION ABIERTA)
(29, 'Dinamicos F7', 'Lorena Valenzuela', 0, 1, NULL, 10, 44),
(30, 'Veloces Siete', 'Natalia Reyes', 0, 1, NULL, 10, 50),
(31, 'Titanicos F7', 'Fabiola Tapia', 0, 1, NULL, 10, 56),
(32, 'Ejecutivos FC', 'Zinnia Zarate', 0, 1, NULL, 10, 62),
(33, 'Furor Futbol 7', 'Alicia Alcantara', 0, 1, NULL, 10, 68),
-- Equipos Rugby (Evento 11 - INSCRIPCION ABIERTA)
(34, 'Raiders Rugby Club', 'Juan Perez', 0, 1, NULL, 11, 2),
(35, 'Pumas del Centro', 'Diego Torres', 0, 1, NULL, 11, 10),
(36, 'Leones Rugby', 'Matias Medina', 0, 1, NULL, 11, 18),
(37, 'Tortugas Verdes', 'Santiago Leiva', 0, 1, NULL, 11, 26),
(38, 'Jaguar Rugby Team', 'Cecilia Miranda', 0, 1, NULL, 11, 34),
(39, 'Bufalo Rugby Crew', 'Mariana Dominguez', 0, 1, NULL, 11, 42),
-- Equipos Hockey (Evento 12 - INSCRIPCION ABIERTA)
(40, 'Halcones Hockey', 'Natalia Reyes', 0, 1, NULL, 12, 50),
(41, 'Estrellas Hockey', 'Fabiola Tapia', 0, 1, NULL, 12, 56),
(42, 'Fuego Hockey', 'Zinnia Zarate', 0, 1, NULL, 12, 62),
(43, 'Hielo Puro HC', 'Alicia Alcantara', 0, 1, NULL, 12, 68),
(44, 'Velocidad Hockey', 'Aurelio Andres', 0, 1, NULL, 12, 75);

-- ========================================
-- MIEMBROS DE EQUIPOS (Distribucion mejorada sin duplicados por evento)
-- ========================================
INSERT INTO equipo_miembros (equipo_id, usuario_id) VALUES
-- EVENTO 1: COPA PRIMAVERA (Usuarios 2-41, sin duplicados dentro del evento)
-- Los Tigres FC (Equipo 1) - 10 usuarios
(1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11),
-- aguilas United (Equipo 2) - 10 usuarios
(2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21),
-- Leones del Sur (Equipo 3) - 10 usuarios
(3, 22), (3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30), (3, 31),
-- Halcones FC (Equipo 4) - 10 usuarios
(4, 32), (4, 33), (4, 34), (4, 35), (4, 36), (4, 37), (4, 38), (4, 39), (4, 40), (4, 41),

-- EVENTO 2: LIGA FUTBOL 5 (Usuarios 42-65, sin duplicados dentro del evento)
-- Rapidos y Furiosos (Equipo 5) - 6 usuarios
(5, 42), (5, 43), (5, 44), (5, 45), (5, 46), (5, 47),
-- Los Cracks (Equipo 6) - 6 usuarios
(6, 48), (6, 49), (6, 50), (6, 51), (6, 52), (6, 53),
-- Team Relampago (Equipo 7) - 6 usuarios
(7, 54), (7, 55), (7, 56), (7, 57), (7, 58), (7, 59),
-- Escuadron 5 (Equipo 8) - 6 usuarios
(8, 60), (8, 61), (8, 62), (8, 63), (8, 64), (8, 65),

-- EVENTO 3: BASQUET (Usuarios 66-80, 2-8, sin duplicados dentro del evento)
-- Condores Basket (Equipo 9) - 6 usuarios
(9, 66), (9, 67), (9, 68), (9, 69), (9, 70), (9, 71),
-- Halcones Negros (Equipo 10) - 6 usuarios
(10, 72), (10, 73), (10, 74), (10, 75), (10, 76), (10, 77),
-- Titanes BC (Equipo 11) - 8 usuarios (reutilizar otros eventos)
(11, 78), (11, 79), (11, 80), (11, 2), (11, 3), (11, 4), (11, 5), (11, 6),

-- EVENTO 4: VOLEY (Usuarios 7-25, sin duplicados dentro del evento)
-- Voley Stars (Equipo 12) - 6 usuarios
(12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12),
-- Net Warriors (Equipo 13) - 6 usuarios
(13, 13), (13, 14), (13, 15), (13, 16), (13, 17), (13, 18),
-- Spike Masters (Equipo 14) - 7 usuarios
(14, 19), (14, 20), (14, 21), (14, 22), (14, 23), (14, 24), (14, 25),

-- EVENTO 5: HANDBALL (Usuarios 26-40, sin duplicados dentro del evento)
-- Handball Elite (Equipo 15) - 7 usuarios
(15, 26), (15, 27), (15, 28), (15, 29), (15, 30), (15, 31), (15, 32),
-- Gladiadores HC (Equipo 16) - 7 usuarios
(16, 33), (16, 34), (16, 35), (16, 36), (16, 37), (16, 38), (16, 39),

-- EVENTO 6: COPA RELAMPAGO (Usuarios 41-55, sin duplicados dentro del evento)
-- Flash FC (Equipo 17) - 8 usuarios
(17, 41), (17, 42), (17, 43), (17, 44), (17, 45), (17, 46), (17, 47), (17, 48),
-- Veloces FC (Equipo 18) - 7 usuarios
(18, 49), (18, 50), (18, 51), (18, 52), (18, 53), (18, 54), (18, 55),

-- Equipos Tenis (Evento 7) - MAX 4 JUGADORES POR EQUIPO
-- Smash Norte (Equipo 19) - Fabiola Tapia (56) + 3 mas
(19, 56), (19, 57), (19, 58), (19, 59),
-- Drive Winners (Equipo 20) - Zinnia Zarate (62) + 3 mas
(20, 62), (20, 63), (20, 64), (20, 65),
-- Topspin Team (Equipo 21) - Alicia Alcantara (68) + 3 mas
(21, 68), (21, 69), (21, 70), (21, 71),

-- EVENTO 8: PADEL (MAX 4 JUGADORES POR EQUIPO - sin duplicados dentro del evento)
-- Padel Point (Equipo 22) - Juan Perez (2) + 3 mas
(22, 2), (22, 3), (22, 4), (22, 5),
-- Lob y Vibora (Equipo 23) - Laura Lopez (7) + 3 mas
(23, 7), (23, 8), (23, 9), (23, 10),
-- Cristal Pair (Equipo 24) - Martin Flores (12) + 3 mas
(24, 12), (24, 13), (24, 14), (24, 15),
-- Bandeja Pro (Equipo 25) - Matias Medina (18) + 3 mas
(25, 18), (25, 19), (25, 20), (25, 21),

-- EVENTO 9: VOLEY (Usuarios 23-43, sin duplicados dentro del evento)
-- Red Storm (Equipo 26) - 7 usuarios
(26, 23), (26, 24), (26, 25), (26, 26), (26, 27), (26, 28), (26, 29),
-- Saque Total (Equipo 27) - 7 usuarios
(27, 30), (27, 31), (27, 32), (27, 33), (27, 34), (27, 35), (27, 36),
-- Bloqueo Sur (Equipo 28) - 7 usuarios
(28, 37), (28, 38), (28, 39), (28, 40), (28, 41), (28, 42), (28, 43),

-- EVENTO 10: FUTBOL 7 (Usuarios 44-73, sin duplicados dentro del evento)
-- Dinamicos F7 (Equipo 29) - 6 usuarios
(29, 44), (29, 45), (29, 46), (29, 47), (29, 48), (29, 49),
-- Veloces Siete (Equipo 30) - 6 usuarios
(30, 50), (30, 51), (30, 52), (30, 53), (30, 54), (30, 55),
-- Titanicos F7 (Equipo 31) - 6 usuarios
(31, 56), (31, 57), (31, 58), (31, 59), (31, 60), (31, 61),
-- Ejecutivos FC (Equipo 32) - 6 usuarios
(32, 62), (32, 63), (32, 64), (32, 65), (32, 66), (32, 67),
-- Furor Futbol 7 (Equipo 33) - 6 usuarios
(33, 68), (33, 69), (33, 70), (33, 71), (33, 72), (33, 73),

-- EVENTO 11: RUGBY (Usuarios 2-51, sin duplicados dentro del evento - 51 es 7 equipos x ~7-8 jugadores)
-- Raiders Rugby Club (Equipo 34) - 8 usuarios
(34, 2), (34, 3), (34, 4), (34, 5), (34, 6), (34, 7), (34, 8), (34, 9),
-- Pumas del Centro (Equipo 35) - 8 usuarios
(35, 10), (35, 11), (35, 12), (35, 13), (35, 14), (35, 15), (35, 16), (35, 17),
-- Leones Rugby (Equipo 36) - 8 usuarios
(36, 18), (36, 19), (36, 20), (36, 21), (36, 22), (36, 23), (36, 24), (36, 25),
-- Tortugas Verdes (Equipo 37) - 8 usuarios
(37, 26), (37, 27), (37, 28), (37, 29), (37, 30), (37, 31), (37, 32), (37, 33),
-- Jaguar Rugby Team (Equipo 38) - 8 usuarios
(38, 34), (38, 35), (38, 36), (38, 37), (38, 38), (38, 39), (38, 40), (38, 41),
-- Bufalo Rugby Crew (Equipo 39) - 8 usuarios
(39, 42), (39, 43), (39, 44), (39, 45), (39, 46), (39, 47), (39, 48), (39, 49),

-- EVENTO 12: HOCKEY (Usuarios 50-80, sin duplicados dentro del evento)
-- Halcones Hockey (Equipo 40) - 6 usuarios
(40, 50), (40, 51), (40, 52), (40, 53), (40, 54), (40, 55),
-- Estrellas Hockey (Equipo 41) - 6 usuarios
(41, 56), (41, 57), (41, 58), (41, 59), (41, 60), (41, 61),
-- Fuego Hockey (Equipo 42) - 6 usuarios
(42, 62), (42, 63), (42, 64), (42, 65), (42, 66), (42, 67),
-- Hielo Puro HC (Equipo 43) - 7 usuarios
(43, 68), (43, 69), (43, 70), (43, 71), (43, 72), (43, 73), (43, 74),
-- Velocidad Hockey (Equipo 44) - 6 usuarios
(44, 75), (44, 76), (44, 77), (44, 78), (44, 79), (44, 80);

-- ========================================
-- PARTIDOS
-- ========================================
INSERT INTO partido (id, fecha, hora, juez, resultado_local, resultado_visitante, equipo_local_id, equipo_visitante_id, evento_id, establecimiento_id, mvp_id, max_anotador_id) VALUES
-- Copa Primavera (Evento 1)
(1, '2026-03-08', '16:00', 'Roberto Mendez', 3, 1, 1, 2, 1, 1, 2, 2),
(2, '2026-03-08', '18:00', 'Carlos Ruiz', 2, 2, 3, 4, 1, 1, 4, 5),
(3, '2026-03-15', '16:00', 'Roberto Mendez', 2, 0, 1, 3, 1, 1, 2, 4),
(4, '2026-03-15', '18:00', 'Elena Paz', 1, 2, 2, 4, 1, 1, 5, 5),
(5, '2026-03-22', '17:00', 'Carlos Ruiz', 4, 0, 1, 4, 1, 1, 2, 2),
(6, '2026-03-22', '19:00', 'Roberto Mendez', 1, 1, 2, 3, 1, 1, 3, 4),
-- Liga Futbol 5 (Evento 2)
(7, '2026-02-22', '20:00', 'Juan Ibarra', 5, 3, 5, 6, 2, 2, 6, 6),
(8, '2026-02-22', '21:00', 'Marcelo Gomez', 4, 2, 7, 8, 2, 2, 8, 8),
(9, '2026-02-28', '20:00', 'Juan Ibarra', 3, 2, 5, 7, 2, 2, 6, 6),
(10, '2026-02-28', '21:00', 'Marcelo Gomez', 2, 3, 6, 8, 2, 2, 9, 9),
(11, '2026-03-07', '20:00', 'Juan Ibarra', 4, 1, 5, 8, 2, 2, 6, 8),
(12, '2026-03-07', '21:00', 'Marcelo Gomez', 3, 3, 6, 7, 2, 2, 7, 8),
-- Basquet (Evento 3)
(13, '2026-03-18', '19:00', 'Sandra Torres', 78, 65, 9, 10, 3, 3, 10, 10),
(14, '2026-03-18', '21:00', 'Ricardo Blanco', 72, 68, 9, 11, 3, 3, 12, 12),
(15, '2026-03-25', '19:00', 'Sandra Torres', 81, 75, 10, 11, 3, 3, 11, 11),
-- Voley (Evento 4)
(16, '2026-02-28', '18:00', 'Marta Rios', 3, 1, 12, 13, 4, 4, 13, 13),
(17, '2026-03-07', '18:00', 'Jorge Luna', 3, 2, 12, 14, 4, 4, 15, 15),
(18, '2026-03-14', '18:00', 'Marta Rios', 2, 3, 13, 14, 4, 4, 15, 14),
-- Handball (Evento 5)
(19, '2026-03-12', '20:00', 'Pablo Ortiz', 28, 25, 15, 16, 5, 5, 16, 16),
(20, '2026-03-19', '20:00', 'Lucia Vera', 30, 27, 15, 16, 5, 5, 16, 17),
-- Tenis (Evento 7)
(21, '2026-04-04', '16:00', 'Romina Paz', 2, 1, 19, 20, 7, 7, 20, 20),
(22, '2026-04-11', '17:00', 'Romina Paz', 1, 2, 20, 21, 7, 7, 24, 24),
(23, '2026-04-18', '18:00', 'Mariano Ceballos', 2, 0, 19, 21, 7, 7, 21, 20),
-- Padel (Evento 8)
(24, '2026-04-09', '20:00', 'Cecilia Nunez', 6, 4, 22, 23, 8, 8, 21, 23),
(25, '2026-04-16', '20:30', 'Cecilia Nunez', 7, 5, 24, 25, 8, 8, 25, 20),
-- Voley (Evento 9)
(26, '2026-04-20', '19:30', 'Hernan Diaz', 3, 2, 26, 27, 9, 9, 23, 24),
(27, '2026-04-27', '19:30', 'Hernan Diaz', 1, 3, 27, 28, 9, 9, 25, 25),
(28, '2026-05-04', '19:30', 'Gabriela Soto', 3, 1, 26, 28, 9, 9, 24, 23);

-- ========================================
-- PARTICIPACIONES
-- ========================================
INSERT INTO participacion (id, puntos, minutosjugados, faltas, partido_id, usuario_id) VALUES
-- Copa Primavera (Evento 1)
(1, 2, 90, 1, 1, 2),
(2, 1, 90, 2, 1, 3),
(3, 1, 90, 1, 1, 4),
(4, 2, 90, 1, 2, 4),
(5, 1, 90, 0, 2, 5),
(6, 1, 90, 1, 2, 6),
-- Liga Futbol 5 (Evento 2)
(7, 3, 50, 1, 7, 6),
(8, 2, 50, 0, 7, 7),
(9, 1, 50, 1, 7, 8),
(10, 2, 50, 1, 8, 8),
(11, 1, 50, 2, 8, 9),
(12, 1, 50, 0, 8, 10),
-- Basquet (Evento 3)
(13, 24, 40, 2, 13, 10),
(14, 18, 40, 3, 13, 11),
(15, 20, 40, 1, 14, 12),
(16, 22, 40, 2, 15, 11),
-- Tenis (Evento 7)
(17, 2, 120, 1, 21, 20),
(18, 1, 120, 0, 21, 22),
(19, 1, 120, 1, 22, 22),
(20, 2, 120, 0, 22, 24),
(21, 2, 120, 1, 23, 21),
(22, 0, 120, 0, 23, 24),
-- Padel (Evento 8)
(23, 3, 90, 1, 24, 21),
(24, 2, 90, 2, 24, 26),
(25, 2, 90, 1, 24, 23),
(26, 2, 90, 1, 24, 24),
(27, 4, 90, 1, 25, 25),
(28, 3, 90, 2, 25, 20),
(29, 3, 90, 0, 25, 19),
(30, 2, 90, 1, 25, 22),
-- Voley (Evento 9)
(31, 14, 60, 1, 26, 23),
(32, 12, 60, 2, 26, 24),
(33, 10, 60, 1, 26, 20),
(34, 15, 60, 1, 27, 25),
(35, 11, 60, 2, 27, 22),
(36, 13, 60, 1, 28, 24),
(37, 9, 60, 2, 28, 26),
(38, 12, 60, 1, 28, 23);

-- ========================================
-- NOTICIAS
-- ========================================
INSERT INTO noticia (id, titulo, descripcion, fecha) VALUES
(1, '¡Bienvenidos al Gestor de Torneos!', 'Plataforma completa para organizar y participar en competencias deportivas. Crea torneos, forma equipos y vive el deporte.', '2026-01-15'),
(2, 'Copa Primavera 2026 - Inscripciones Abiertas', 'Ya podes inscribirte en la Copa Primavera de Futbol 11. Hasta 16 equipos, formato eliminacion directa. No te lo pierdas.', '2026-02-01'),
(3, 'Resultados Primera Fecha - Liga Futbol 5', 'Rapidos y Furiosos se impone 5-3 ante Los Cracks en un partidazo. Team Relampago supero 4-2 a Escuadron 5.', '2026-02-23'),
(4, 'Proxima fecha del Torneo de Basquet', 'Este fin de semana continua el Torneo Basquet Universitario. Condores vs Titanes sera el plato fuerte del sabado.', '2026-03-16'),
(5, 'Handball Clausura: Finales a la vista', 'Quedan dos fechas para definir los clasificados. Handball Elite lidera con solida campana.', '2026-03-18'),
(6, 'Nueva funcionalidad: Invitaciones por email', 'Ahora podes invitar jugadores a tus equipos directamente por correo electronico. Simplificamos la gestion de tu equipo.', '2026-02-10'),
(7, 'Torneo Relampago F5 - Un solo dia de futbol intenso', 'El 15 de marzo se viene el torneo express. 8 equipos, eliminacion directa. ¿Quien sera el campeon?', '2026-03-01');

SET FOREIGN_KEY_CHECKS = 1;

-- ========================================
-- FIN DEL DUMP
-- ========================================
-- 
-- INSTRUCCIONES DE USO:
-- 1. Asegurarse de que la BD y schema esten creados
-- 2. Ejecutar este archivo: mysql -u usuario -p nombre_bd < dump_datos_demo.sql
--    O desde Docker: docker exec -i gestor-torneos mysql -u dsw -pdsw gestor_torneos < dump_datos_demo.sql
-- 3. Credenciales de acceso (todas con contrasena REAL validada):
--    - Admin: usuario=admin, contrasena=demo123
--    - Usuarios: jperez, mgonzalez, crodriguez, etc. / contrasena=demo123
--    - Torneo privado (Handball Clausura): contrasena=demo123
-- 
-- NOTA: Los hashes bcrypt son reales y validos, generados con bcrypt rounds=10.
