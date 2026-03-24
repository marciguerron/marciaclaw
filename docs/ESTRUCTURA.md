# 📁 Estructura de Directorios

## Visión General

Este documento describe la estructura completa del repositorio `marciaclaw` y el propósito de cada directorio y archivo.

## Árbol de Directorios Completo

```
marciaclaw/
│
├── 📄 .gitignore              # Archivos ignorados por Git
├── 📄 .env.local              # Variables de entorno locales (NO commiteable)
├── 📄 .env.example            # Template de variables de entorno
├── 📄 package.json            # Dependencias y scripts de Node.js
├── 📄 tsconfig.json           # Configuración de TypeScript
│
├── 📁 .git/                   # Metadatos de Git (automático)
│
├── 📁 docs/                   # 📚 Documentación principal
│   ├── 📄 ARQUITECTURA.md     # Arquitectura "Camino de Oro"
│   ├── 📄 ESTRUCTURA.md       # Este archivo
│   ├── 📄 API_INTEGRATIONS.md # Documentación de APIs
│   └── 📄 GUIA_USO.md         # Guía de uso del sistema
│
├── 📁 config/                 # ⚙️ Configuraciones del sistema
│   ├── 📄 services.yaml       # Configuración de servicios externos
│   ├── 📄 keys.yaml           # Referencias a API keys (plantilla)
│   ├── 📄 openclaw.yaml       # Configuración específica de OpenClaw
│   └── 📄 theme.yaml          # Configuración de tema/UI
│
├── 📁 scripts/                # 🔧 Scripts de automatización
│   ├── 📄 setup.sh            # Script de instalación inicial
│   ├── 📄 sync.sh             # Sincronización con GitHub
│   ├── 📄 backup.sh           # Respaldo automático
│   ├── 📄 deploy.sh           # Despliegue de cambios
│   └── 📄 cleanup.sh          # Limpieza de archivos temporales
│
├── 📁 integrations/           # 🔌 Integraciones externas
│   ├── 📁 youtube/
│   │   ├── 📄 youtubeService.ts    # Servicio principal de YouTube
│   │   ├── 📄 youtubeTypes.ts      # Tipos TypeScript
│   │   └── 📄 youtubeUtils.ts      # Utilidades de YouTube
│   │
│   ├── 📁 supabase/
│   │   ├── 📄 supabaseService.ts   # Cliente de Supabase
│   │   ├── 📄 migrations/          # Migraciones de BD
│   │   └── 📄 seeders/             # Datos iniciales
│   │
│   ├── 📁 perplexity/
│   │   └── 📄 perplexityService.ts # Servicio de búsquedas web
│   │
│   ├── 📁 browser/
│   │   ├── 📄 browserService.ts    # Control de navegador
│   │   └── 📄 browserTypes.ts      # Tipos del navegador
│   │
│   └── 📁 openclaw/
│       └── 📄 openclawService.ts   # Integración con OpenClaw
│
├── 📁 services/               # 🎯 Servicios del sistema
│   ├── 📄 openclawService.ts  # Servicio principal de OpenClaw
│   ├── 📄 youtubeService.ts   # Servicio de YouTube
│   ├── 📄 youtubeResearchService.ts # Investigación de Shorts
│   ├── 📄 memoryService.ts    # Gestión de memoria
│   ├── 📄 ttsService.ts       # Text-to-Speech
│   └── 📄 messageService.ts   # Envío de mensajes
│
├── 📁 memory/                 # 🧠 Memoria persistente
│   ├── 📄 MEMORY.md           # Memoria a largo plazo
│   ├── 📄 HEARTBEAT.md        # Configuración de heartbeats
│   ├── 📄 2026-03-24.md       # Notas del día actual
│   └── 📄 TODO.md             # Lista de tareas pendientes
│
├── 📁 templates/              # 📋 Plantillas reutilizables
│   ├── 📄 youtube-research.md     # Plantilla investigación YouTube
│   ├── 📄 channel-analysis.md     # Análisis de canales
│   ├── 📄 shorts-template.md      # Template para Shorts
│   └── 📄 memory-entry.md         # Entradas de memoria
│
└── 📁 utils/                  # 🛠️ Utilidades
    ├── 📄 formatters.ts       # Funciones de formateo
    ├── 📄 validators.ts       # Validadores
    ├── 📄 constants.ts        # Constantes del sistema
    └── 📄 helpers.ts          # Funciones helper
```

## 📁 Detalle por Directorio

### `/docs`

Contiene toda la documentación del proyecto.

| Archivo | Propósito |
|---------|-----------|
| `ARQUITECTURA.md` | Documentación detallada de la arquitectura "Camino de Oro" |
| `ESTRUCTURA.md` | Este archivo - descripción de la estructura |
| `API_INTEGRATIONS.md` | Guía de uso de todas las APIs integradas |
| `GUIA_USO.md` | Guía paso a paso para usar el sistema |

### `/config`

Archivos de configuración sin datos sensibles.

| Archivo | Propósito |
|---------|-----------|
| `services.yaml` | URLs, timeouts, límites de APIs |
| `keys.yaml` | Referencias a variables de entorno |
| `openclaw.yaml` | Configuración de OpenClaw |
| `theme.yaml` | Preferencias de UI/tema |

### `/scripts`

Scripts ejecutables para automatización.

| Script | Uso |
|--------|-----|
| `setup.sh` | `./scripts/setup.sh` - Instala dependencias |
| `sync.sh` | `./scripts/sync.sh` - Commit y push cambios |
| `backup.sh` | `./scripts/backup.sh` - Respalda memoria |

### `/integrations`

Implementaciones específicas de APIs externas.

#### `/integrations/youtube`
- `youtubeService.ts` - Cliente principal de YouTube Data API v3
- `youtubeTypes.ts` - Interfaces TypeScript para YouTube
- `youtubeUtils.ts` - Funciones auxiliares

#### `/integrations/supabase`
- `supabaseService.ts` - Cliente de base de datos Supabase
- `migrations/` - Scripts de migración de esquema
- `seeders/` - Datos iniciales para desarrollo

#### `/integrations/perplexity`
- `perplexityService.ts` - Cliente de Perplexity AI API

#### `/integrations/browser`
- `browserService.ts` - Control de navegador headless
- `browserTypes.ts` - Tipos para automatización

#### `/integrations/openclaw`
- `openclawService.ts` - API client para OpenClaw

### `/services`

Servicios de alto nivel que orquestan múltiples integraciones.

| Servicio | Propósito |
|----------|-----------|
| `openclawService.ts` | Conexión principal con OpenClaw |
| `youtubeService.ts` | Wrapper simplificado de YouTube |
| `youtubeResearchService.ts` | Investigación automatizada de Shorts |
| `memoryService.ts` | Lectura/escritura de memoria |
| `ttsService.ts` | Text-to-Speech (ElevenLabs) |
| `messageService.ts` | Envío multi-canal |

### `/memory`

Sistema de memoria persistente.

| Archivo | Propósito |
|---------|-----------|
| `MEMORY.md` | Memoria a largo plazo - hechos importantes |
| `HEARTBEAT.md` | Configuración de monitoreos periódicos |
| `YYYY-MM-DD.md` | Notas del día - contexto reciente |
| `TODO.md` | Tareas pendientes |

### `/templates`

Plantillas Markdown reutilizables.

| Plantilla | Uso |
|-----------|-----|
| `youtube-research.md` | Estructura para investigaciones de YouTube |
| `channel-analysis.md` | Formato análisis de canales |
| `shorts-template.md` | Template para reportes de Shorts |
| `memory-entry.md` | Formato entradas de memoria |

### `/utils`

Funciones de utilidad general.

| Utilidad | Propósito |
|----------|-----------|
| `formatters.ts` | FormatDate, formatNumber, formatCurrency |
| `validators.ts` | validateEmail, validateURL, validateAPIKey |
| `constants.ts` | Constantes globales (países, idiomas) |
| `helpers.ts` | Funciones helper genéricas |

## 📄 Archivos de Configuración Especiales

### `.gitignore`

```git
# Entornos
.env
.env.local
.env.*.local

# Dependencias
node_modules/
.pnp/
.pnp.js

# Build outputs
dist/
build/
*.tsbuildinfo

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Testing
coverage/
.nyc_output/

# Misc
*.pem
.cache/
temp/
tmp/
```

### `.env.example`

Template para variables de entorno:

```bash
# OpenClaw
OPENCLAW_API_KEY=
OPENCLAW_URL=http://localhost:8080

# YouTube
YOUTUBE_API_KEY=
YOUTUBE_CLIENT_ID=
YOUTUBE_CLIENT_SECRET=

# Supabase
SUPABASE_URL=
SUPABASE_KEY=

# Perplexity
PERPLEXITY_API_KEY=

# GitHub
GITHUB_TOKEN=

# Browser
BROWSER_PROFILE_PATH=
```

## 🔄 Flujo de Trabajo Típico

```
1. Usuario envía solicitud
    ↓
2. MemoryService carga contexto
    ↓
3. YoutubeResearchService investiga
    ↓
4. SupabaseService guarda resultados
    ↓
5. OpenclawService responde al usuario
    ↓
6. MemoryService actualiza memoria
    ↓
7. Git sync automática (opcional)
```

## 📊 convenciones de Nombrado

### Archivos TypeScript
- `PascalCase` para archivos: `youtubeService.ts`
- `kebab-case` para funciones: `getChannelInfo()`
- Interfaces en `PascalCase`: `interface YouTubeChannel`

### Archivos Markdown
- `SCREAMING_SNAKE_CASE` para docs: `ARQUITECTURA.md`
- Plantillas en `kebab-case`: `youtube-research.md`

### Commits
- Formato: `<tipo>(<archivo>): <descripción>`
- Tipos: `feat`, `fix`, `docs`, `refactor`, `test`

---

*Documento generado automáticamente*