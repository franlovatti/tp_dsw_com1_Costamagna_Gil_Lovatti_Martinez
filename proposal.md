# Propuesta TP DSW

## Grupo Gestor de torneos deportivos
### Integrantes
* 52241 - Costamagna Mayol, Ricardo Luis
* 52802 - Gil, Francisco Marcelo
* 52420 - Lovatti, Francisco
* 53192 - Martinez, Lautaro

### Repositorios
* [frontend app]()
* [backend app]()

## Tema
### Descripción
*En la pagina los usuarios podrán crear o participar de diferentes eventos deportivos. Los eventos pueden tener el formato de una copa o una liga, pueden ser públicos o privados y corresponden a un unico deporte que determinara si el evento se jugara en equipos o individualmente. Cada torneo cuenta con el seguimiento de sus partidos.*

### Modelo

![GestorTorneos drawio (3)](https://github.com/user-attachments/assets/38c2778a-b625-4f30-a798-d854ae8f1787)

## Alcance Funcional 

### Alcance Mínimo

Regularidad:
|Req|Detalle|
|:-|:-|
|CRUD simple|1. CRUD Participante<br>2. CRUD Deporte<br>3. CRUD Establecimiento|
|CRUD dependiente|1. CRUD Partido {depende de Evento} <br>2. CRUD Equipo {depende de Evento} <br>3. CRUD Participacion {depende de Partido}4. CRUD Evento {depende de Deporte}|
|Listado<br>+<br>detalle| 1. Listado de Participantes de un evento filtrado por equipo o cantidad de puntos <br> 2. Listado de eventos filtrado por rango de fecha, deporte, modalidad o cantidad de participantes |
|CUU/Epic|1. Inscribirse a evento <br>2. Crear un evento|


Adicionales para Aprobación
|Req|Detalle|
|:-|:-|
|CRUD |1. CRUD Participante<br>2. CRUD Deporte<br>3. CRUD Establecimiento<br>4. CRUD Evento<br>5. CRUD Partido<br>6. CRUD Equipo<br>7. CRUD Participacion|
|CUU/Epic|1. Inscribirse a evento<br>2. Crear Evento<br>3. Ingresar a equipo <br>4. Buscar evento|


### Alcance Adicional Voluntario

|Req|Detalle|
|:-|:-|
|Listados |1. Participaciones listadas por evento o por deporte|
|CUU/Epic|1. Gestionar perfil de usuario|
|Otros|1. Envío de solicitud de equipo por email|

