# Documentación de API

## Información General

Esta API REST está desarrollada con Node.js, Express y TypeScript, utilizando MikroORM como ORM y MySQL como base de datos.

El sistema implementa un **Gestor de Torneos Deportivos** con módulos de usuarios, eventos, equipos, partidos, noticias, participaciones, localidades, deportes, establecimientos, panel admin e invitaciones por email.

El frontend (React + Vite) consume esta API desde `src/helpers/api.tsx` usando Axios.

### Base URL

```text
http://localhost:3000/api
https://<tu-backend-en-produccion>/api
```

### Autenticación

La API utiliza JWT (JSON Web Tokens) para autenticación y autorización por roles.

Incluye el token en el header de autorización:

```text
Authorization: Bearer <your-jwt-token>
```

Además, el sistema soporta cookie `recuerdame` para restaurar sesión (`/api/usuarios/restaurar`).

### Formato de Respuesta

La mayoría de endpoints responden con esta estructura:

```json
{
  "message": "Descripción del resultado",
  "data": "Datos solicitados o creados",
  "error": "Mensaje de error (solo si aplica)"
}
```

## Endpoints Principales

### Deportes

Gestión de deportes disponibles para los torneos.

**Base URL:** `/api/deportes`

| Método    | Endpoint  | Descripción                           |
| --------- | --------- | ------------------------------------- |
| GET       | `/`       | Obtener todos los deportes            |
| GET       | `/filter` | Filtrar deportes por criterios        |
| GET       | `/:id`    | Obtener un deporte específico         |
| POST      | `/`       | Crear deporte (**admin + auth**)      |
| PUT/PATCH | `/:id`    | Actualizar deporte (**admin + auth**) |
| DELETE    | `/:id`    | Eliminar deporte (**admin + auth**)   |

### Localidades

Gestión de localidades geográficas.

**Base URL:** `/api/localidades`

| Método    | Endpoint | Descripción                             |
| --------- | -------- | --------------------------------------- |
| GET       | `/`      | Obtener todas las localidades           |
| GET       | `/:id`   | Obtener una localidad específica        |
| POST      | `/`      | Crear localidad (**admin + auth**)      |
| PUT/PATCH | `/:id`   | Actualizar localidad (**admin + auth**) |
| DELETE    | `/:id`   | Eliminar localidad (**admin + auth**)   |

### Establecimientos

Gestión de sedes/canchas donde se juegan eventos y partidos.

**Base URL:** `/api/establecimientos`

| Método    | Endpoint           | Descripción                          |
| --------- | ------------------ | ------------------------------------ |
| GET       | `/`                | Obtener todos los establecimientos   |
| GET       | `/evento/:eventoId`| Obtener establecimientos de un evento|
| GET       | `/:id`             | Obtener establecimiento específico   |
| POST      | `/`                | Crear establecimiento                |
| PUT/PATCH | `/:id`             | Actualizar establecimiento           |
| DELETE    | `/:id`             | Eliminar establecimiento             |

### Noticias

Gestión de noticias del sistema.

**Base URL:** `/api/noticias`

| Método    | Endpoint  | Descripción                           |
| --------- | --------- | ------------------------------------- |
| GET       | `/`       | Obtener todas las noticias            |
| GET       | `/filter` | Filtrar noticias por fecha            |
| GET       | `/:id`    | Obtener una noticia específica        |
| POST      | `/`       | Crear noticia (**admin + auth**)      |
| PUT/PATCH | `/:id`    | Actualizar noticia (**admin + auth**) |
| DELETE    | `/:id`    | Eliminar noticia (**admin + auth**)   |

### Eventos (Torneos)

Gestión principal de torneos/eventos.

**Base URL:** `/api/eventos`

| Método    | Endpoint                 | Descripción                                  |
| --------- | ------------------------ | -------------------------------------------- |
| GET       | `/`                      | Obtener todos los eventos                    |
| GET       | `/filter`                | Filtrar eventos (fecha, deporte, localidad…) |
| GET       | `/:id`                   | Obtener un evento específico                 |
| GET       | `/creador/:idCreador`    | Obtener eventos por creador                  |
| GET       | `/participacion/:idUsuario` | Obtener eventos donde participa un usuario |
| GET       | `/codigo/:codigo`        | Buscar evento por código                     |
| POST      | `/`                      | Crear evento (**auth**)                      |
| PUT/PATCH | `/:id`                   | Actualizar evento (**auth**)                 |
| DELETE    | `/:id`                   | Eliminar evento (**auth**)                   |

#### Modelo de Datos - Evento

```json
{
  "id": "number",
  "nombre": "string",
  "descripcion": "string",
  "esPublico": "boolean",
  "contraseña": "string?",
  "cantEquiposMax": "number",
  "fechaInicioInscripcion": "date",
  "fechaFinInscripcion": "date",
  "fechaInicioEvento": "date?",
  "fechaFinEvento": "date?",
  "codigo": "string",
  "deporte": "Deporte",
  "localidad": "Localidad",
  "creador": "Usuario",
  "equipos": "Equipo[]",
  "partidos": "Partido[]"
}
```

#### Ejemplos de Uso

**Crear Evento:**

```bash
POST /api/eventos
Authorization: Bearer <jwt>
Content-Type: application/json

{
  "nombre": "Copa Apertura",
  "descripcion": "Torneo de fútbol 8",
  "esPublico": true,
  "cantEquiposMax": 16,
  "fechaInicioInscripcion": "2026-03-01",
  "fechaFinInscripcion": "2026-03-10",
  "fechaInicioEvento": "2026-03-15",
  "fechaFinEvento": "2026-04-10",
  "deporte": 1,
  "localidad": 2
}
```

**Filtrar Eventos:**

```bash
GET /api/eventos/filter?deporte=1&localidad=2&fechaDesde=2026-03-01&fechaHasta=2026-04-30
```

Parámetros de filtro disponibles (principales):

- `deporte`: id de deporte
- `localidad`: id de localidad
- `equiposDesde` / `equiposHasta`: rango por cantidad de equipos
- `fechaDesde` / `fechaHasta`: rango de fecha de inicio

### Partidos

Gestión de partidos de un torneo.

**Base URL:** `/api/partidos`

| Método    | Endpoint           | Descripción                        |
| --------- | ------------------ | ---------------------------------- |
| GET       | `/`                | Obtener todos los partidos         |
| GET       | `/evento/:eventoId`| Obtener partidos por evento        |
| GET       | `/:id`             | Obtener partido específico         |
| POST      | `/`                | Crear partido                      |
| PUT/PATCH | `/:id`             | Actualizar partido                 |
| DELETE    | `/:id`             | Eliminar partido                   |

### Equipos

Gestión de equipos participantes.

**Base URL:** `/api/equipos`

| Método    | Endpoint         | Descripción                         |
| --------- | ---------------- | ----------------------------------- |
| GET       | `/`              | Obtener todos los equipos           |
| GET       | `/evento/:eventoId` | Obtener equipos por evento       |
| GET       | `/usuario/:id`   | Obtener equipos por usuario         |
| GET       | `/:id`           | Obtener equipo específico           |
| POST      | `/`              | Crear equipo                        |
| PUT/PATCH | `/:id`           | Actualizar equipo                   |
| POST      | `/:id/miembros`  | Agregar miembro a equipo            |
| PATCH     | `/:id/miembros`  | Salirse del equipo (**auth**)       |
| DELETE    | `/:id`           | Eliminar equipo                     |

### Participaciones

Estadísticas y participación de usuarios en partidos/torneos.

**Base URL:** `/api/participaciones`

| Método    | Endpoint                               | Descripción                                |
| --------- | -------------------------------------- | ------------------------------------------ |
| GET       | `/`                                    | Obtener todas las participaciones          |
| GET       | `/participacionesxequipo`              | Participaciones por equipo                 |
| GET       | `/participacionesportorneo`            | Participaciones por torneo                 |
| GET       | `/participacionesTotalesPorTorneo`     | Totales de participaciones por torneo      |
| GET       | `/participacionesPorUsuarioEnTorneo`   | Participaciones por usuario en un torneo   |
| GET       | `/participacionesPorUsuario`           | Participaciones por usuario                |
| GET       | `/:id`                                 | Obtener participación específica           |
| POST      | `/`                                    | Crear participación                        |
| PUT/PATCH | `/:id`                                 | Actualizar participación                   |
| DELETE    | `/:id`                                 | Eliminar participación                     |

### Usuarios

Autenticación y gestión de usuarios.

**Base URL:** `/api/usuarios`

| Método    | Endpoint             | Descripción                                         |
| --------- | -------------------- | --------------------------------------------------- |
| POST      | `/`                  | Registrar usuario                                   |
| POST      | `/login`             | Iniciar sesión (retorna JWT)                        |
| POST      | `/logout`            | Cerrar sesión (cookie recuerdame)                   |
| POST      | `/restaurar`         | Restaurar sesión por cookie                         |
| GET       | `/usuariosPorEvento` | Participantes de un evento                          |
| GET       | `/`                  | Listar usuarios (**admin + auth**)                  |
| GET       | `/filter`            | Filtrar usuarios (**admin + auth**)                 |
| GET       | `/perfil/:id`        | Obtener perfil (**auth**)                           |
| POST      | `/baja/:id`          | Baja/reactivación de usuario (**admin + auth**)     |
| GET       | `/:id`               | Obtener usuario por id (**admin + auth**)           |
| PUT/PATCH | `/:id`               | Actualizar usuario (**admin + auth**)               |
| DELETE    | `/:id`               | Eliminar usuario (**admin + auth**)                 |

### Administración

Métricas y estadísticas para panel administrativo.

**Base URL:** `/api/admin`

| Método | Endpoint               | Descripción                                 |
| ------ | ---------------------- | ------------------------------------------- |
| GET    | `/stats`               | Estadísticas generales (**admin + auth**)   |
| GET    | `/stats/deportesStats` | Estadísticas por deporte (**admin + auth**) |

### Invitaciones

Invitaciones por email para unirse a equipos.

**Base URL:** `/api/invitaciones`

| Método | Endpoint    | Descripción                                         |
| ------ | ----------- | --------------------------------------------------- |
| POST   | `/enviar`   | Enviar invitación por email (**auth**)              |
| POST   | `/aceptar`  | Aceptar invitación por token (**auth**)             |
| GET    | `/:token`   | Obtener detalle de invitación (público)             |

## Códigos de Estado HTTP

| Código | Descripción                                               |
| ------ | --------------------------------------------------------- |
| 200    | OK - Solicitud exitosa                                    |
| 201    | Created - Recurso creado exitosamente                     |
| 400    | Bad Request - Datos inválidos                             |
| 401    | Unauthorized - Token inválido, expirado o faltante        |
| 403    | Forbidden - Sin permisos (por ejemplo, ruta de admin)     |
| 404    | Not Found - Recurso no encontrado                         |
| 409    | Conflict - Duplicados o restricciones de negocio          |
| 500    | Internal Server Error - Error del servidor                |

## Características Adicionales

### CORS

La API permite solicitudes desde el frontend configurado en `FRONTEND_URL` y envía credenciales (`credentials: true`).

### Envío de Emails

Integración de invitaciones por email (Gmail SMTP y compatibilidad con Resend).

### Encriptación

Se utiliza `bcrypt` para hash de contraseñas de usuarios.

### Manejo de roles

Rutas protegidas por middleware `authMiddleware` y `requireAdmin`.

## Middleware de Validación/Sanitización

Cada módulo incluye middleware de sanitización que:

- arma `sanitizedInput` con los campos permitidos
- elimina campos `undefined`
- aplica validaciones de negocio en controladores (fechas, duplicados, permisos, etc.)

## Población de Relaciones

Varios endpoints GET incluyen relaciones relevantes usando `populate` de MikroORM (por ejemplo, eventos con deporte/equipos/partidos/localidad y usuarios con relaciones de participación).

## Manejo de Errores

Los endpoints manejan errores con:

- mensajes descriptivos en `message`
- códigos HTTP apropiados según el caso
- información adicional `error` cuando corresponde
- control de permisos y autenticación por middleware
