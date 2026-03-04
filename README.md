# TP DSW — Gestor de Torneos Deportivos

Repositorio central del Trabajo Práctico de Desarrollo de Software.

Gestor de Torneos es una aplicación web full stack para crear, administrar y participar en torneos deportivos, con gestión de usuarios, equipos, partidos, noticias e invitaciones.

![GestorTorneos](docs/images/GestorTorneos.png)

Este repositorio funciona como punto de entrada para frontend, backend y documentación general.

## Estructura del workspace

- `Frontend_Costamagna_Gil_Lovatti_Martinez/`: aplicación cliente (React + TypeScript).
- `Backend_Costamagna_Gil_Lovatti_Martinez/`: API REST (Express + TypeScript + MikroORM).
- `tp_dsw_com1_Costamagna_Gil_Lovatti_Martinez/docs/`: documentación funcional y de seguimiento.

## Repositorios del proyecto

- Frontend: https://github.com/franlovatti/Frontend_Costamagna_Gil_Lovatti_Martinez
- Backend: https://github.com/lautaromartinezz/Backend_Costamagna_Gil_Lovatti_Martinez

## Aplicación en producción

🚀 **Sitio web:** https://gestor-torneos.up.railway.app/

## Stack y estado actual

### Frontend
- React 19 + TypeScript + Vite
- React Router, Axios, React Hook Form
- Testing: Vitest + Testing Library + Playwright (E2E)

### Backend
- Node.js + Express + TypeScript
- MikroORM + MySQL/Percona
- Autenticación JWT
- Testing: Vitest + Supertest

### Mailing
- Envío de invitaciones por Gmail SMTP (Nodemailer)
- `RESEND_API_KEY` se mantiene como compatibilidad legacy opcional

## Puesta en marcha rápida

### 1) Instalar dependencias

```bash
cd Backend_Costamagna_Gil_Lovatti_Martinez
pnpm install

cd ..\Frontend_Costamagna_Gil_Lovatti_Martinez
pnpm install
```

### 2) Configurar variables de entorno

- Backend: copiar `.env.example` a `.env` y configurar al menos:
  - `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`
  - `JWT_SECRET`
  - `GMAIL_USER`, `GMAIL_APP_PASSWORD`, `EMAIL_FROM` (si se usa envío de mails)
- Frontend: copiar `.env.example` a `.env` y configurar `VITE_GOOGLE_MAPS_API_KEY`.

### 3) Levantar backend y frontend

```bash
# Terminal 1
cd Backend_Costamagna_Gil_Lovatti_Martinez
pnpm run start:dev

# Terminal 2
cd Frontend_Costamagna_Gil_Lovatti_Martinez
pnpm run dev
```

- Backend: http://localhost:3000
- Frontend: http://localhost:5173

## Tests

### Frontend

```bash
cd Frontend_Costamagna_Gil_Lovatti_Martinez
pnpm run test
pnpm run test:coverage
pnpm run test:e2e
```

### Backend

```bash
cd Backend_Costamagna_Gil_Lovatti_Martinez
pnpm run test
pnpm run test:run
```

## Documentación

### Repo central
- Propuesta del TP: [docs/proposal.md](docs/proposal.md)
- Documentación de API: [docs/API.md](docs/API.md)
- Guía de tests: [docs/Test automaticos.md](docs/Test%20automaticos.md)
- Tracking de features/bugs del Back: [docs/Tracking Backend.md](docs/Tracking%20Backend.md)
- Tracking de features/bugs del Front: [docs/Tracking Frontend.md](docs/Tracking%20Frontend.md)
- Video Presentacion: [docs/Video presentacion.md](docs/Video%20presentacion.md)

### Documentación técnica por servicio
- Frontend: [../Frontend_Costamagna_Gil_Lovatti_Martinez/README.md](../Frontend_Costamagna_Gil_Lovatti_Martinez/README.md)
- Backend: [../Backend_Costamagna_Gil_Lovatti_Martinez/README.md](../Backend_Costamagna_Gil_Lovatti_Martinez/README.md)
- Configuración de entorno backend: [../Backend_Costamagna_Gil_Lovatti_Martinez/docs/CONFIGURACION_ENV.md](../Backend_Costamagna_Gil_Lovatti_Martinez/docs/CONFIGURACION_ENV.md)
- Seguridad de credenciales: [../Backend_Costamagna_Gil_Lovatti_Martinez/docs/SECURITY_CREDENTIALS.md](../Backend_Costamagna_Gil_Lovatti_Martinez/docs/SECURITY_CREDENTIALS.md)

## Integrantes

- 52241 - Costamagna Mayol, Ricardo Luis
- 52802 - Gil, Francisco Marcelo
- 52420 - Lovatti, Francisco
- 53192 - Martinez, Lautaro
