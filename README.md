# 🦁 MarciaClaw - Sistema de Asistente IA Personal

## 📋 Descripción General

Este repositorio contiene la estructura completa del sistema de asistente IA personal de Marcia, incluyendo documentación, configuraciones, integraciones de servicios y herramientas de automatización.

## 🏗️ Estructura del Proyecto

```
marciaclaw/
├── 📁 docs/              # Documentación principal
│   ├── ARQUITECTURA.md   # Documentación del Camino de Oro
│   ├── API_INTEGRATIONS.md
│   ├── ESTRUCTURA.md
│   └── GUIA_USO.md
├── 📁 config/            # Configuraciones
│   ├── services.yaml     # Configuración de servicios externos
│   ├── keys.yaml         # Referencias a API keys (sin valores)
│   └── openclaw.yaml     # Configuración de OpenClaw
├── 📁 scripts/           # Scripts de automatización
│   ├── setup.sh          # Script de instalación
│   ├── sync.sh           # Sincronización con GitHub
│   └── backup.sh         # Respaldo automático
├── 📁 integrations/      # Integraciones externas
│   ├── youtube/
│   ├── supabase/
│   ├── perplexity/
│   └── browser/
├── 📁 services/          # Servicios del sistema
│   ├── openclawService.ts
│   ├── youtubeService.ts
│   └── youtubeResearchService.ts
├── 📁 memory/            # Memoria persistente
│   ├── MEMORY.md         # Memoria a largo plazo
│   ├── 2026-03-24.md     # Notas del día
│   └── HEARTBEAT.md      # Configuración de heartbeats
├── 📁 templates/         # Plantillas
│   ├── youtube-research.md
│   └── channel-analysis.md
└── 📁 utils/             # Utilidades
    ├── formatters.ts
    └── validators.ts
```

## 🚀 Inicio Rápido

### Prerrequisitos

- Node.js v18+ 
- Git
- Cuenta de GitHub
- Acceso a OpenClaw (opcional)

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/marciguerron/marciaclaw.git
cd marciaclaw

# Ejecutar script de instalación
chmod +x scripts/setup.sh
./scripts/setup.sh
```

## 🔑 Configuración de Credenciales

**⚠️ IMPORTANTE:** Nunca almacenes credenciales reales en este repositorio.

### API Keys y Tokens

Crea un archivo `.env.local` en la raíz del proyecto:

```bash
# OpenClaw
OPENCLAW_API_KEY=tu_api_key_openclaw
OPENCLAW_URL=http://localhost:8080

# YouTube Data API
YOUTUBE_API_KEY=tu_youtube_api_key
YOUTUBE_CLIENT_ID=tu_client_id
YOUTUBE_CLIENT_SECRET=tu_client_secret

# Supabase
SUPABASE_URL=tu_supabase_url
SUPABASE_KEY=tu_supabase_key

# Perplexity (para búsquedas web)
PERPLEXITY_API_KEY=tu_perplexity_key

# GitHub
GITHUB_TOKEN=tu_github_token
```

### Configuración de Servicios

Edita `config/services.yaml` para configurar los servicios externos:

```yaml
youtube:
  api_key: ${YOUTUBE_API_KEY}
  max_results: 50
  region_codes:
    - MX  # México
    - ES  # España
    - US  # Estados Unidos

supabase:
  url: ${SUPABASE_URL}
  key: ${SUPABASE_KEY}
  table_prefix: marcia_

openclaw:
  url: ${OPENCLAW_URL}
  api_key: ${OPENCLAW_API_KEY}
```

## 📚 Documentación Principal

### Documentación del Sistema

- **[ARQUITECTURA.md](docs/ARQUITECTURA.md)** - Arquitectura "Camino de Oro"
- **[ESTRUCTURA.md](docs/ESTRUCTURA.md)** - Estructura detallada de carpetas
- **[API_INTEGRATIONS.md](docs/API_INTEGRATIONS.md)** - Integraciones con APIs
- **[GUIA_USO.md](docs/GUIA_USO.md)** - Guía de uso del sistema

### Documentación de Memoria

- **memory/MEMORY.md** - Memoria a largo plazo
- **memory/2026-03-24.md** - Notas actuales del día

## 🔧 Herramientas y Scripts

### Scripts Disponibles

| Script | Descripción |
|--------|-------------|
| `scripts/setup.sh` | Configuración inicial del proyecto |
| `scripts/sync.sh` | Sincroniza cambios con GitHub |
| `scripts/backup.sh` | Crea respaldo de memoria y configs |

### Servicios del Sistema

- **openclawService.ts** - Conexión con OpenClaw
- **youtubeService.ts** - API de YouTube
- **youtubeResearchService.ts** - Investigación de YouTube Shorts
- **supabaseService.ts** - Base de datos Supabase

## 🎯 Características Principales

### 1. Investigación de YouTube Shorts

Sistema automatizado para analizar canales y Shorts virales en el nicho de finanzas/abundancia:

```typescript
import { youtubeResearchService } from './services/youtubeResearchService';

const research = await youtubeResearchService.analyzeChannel({
  channelUrl: 'https://youtube.com/@CanalEjemplo',
  country: 'MX',
  niche: 'finanzas'
});
```

### 2. Memoria Persistente

Sistema de memoria que aprende de cada sesión:

- **短期记忆:** `memory/YYYY-MM-DD.md`
- **长期记忆:** `memory/MEMORY.md`
- **心跳监控:** `memory/HEARTBEAT.md`

### 3. Integración con OpenClaw

Conexión directa con el sistema OpenClaw para:

- Envío de mensajes a múltiples canales
- Ejecución de comandos
- Gestión de sesiones

## 📊 Métricas y Monitoreo

### Heartbeats

El sistema monitorea periódicamente:

- Emails
- Calendario
- Menciones en redes sociales
- Clima

Configurar en `memory/HEARTBEAT.md`.

## 🤝 Contribución

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/NuevaFeature`)
3. Commit tus cambios (`git commit -m 'Agrega NuevaFeature'`)
4. Push a la rama (`git push origin feature/NuevaFeature`)
5. Abre un Pull Request

## 📝 Notas de Seguridad

- **Nunca** commitees archivos con credenciales reales
- Usa `.gitignore` para archivos sensibles
- Rotate tus API keys periódicamente
- Usa variables de entorno para configuración sensible

## 📅 Historial de Versiones

- **v1.0.0** (2026-03-24) - Versión inicial con estructura completa

## 📞 Contacto

- **Propietario:** Marcia Guerrero
- **GitHub:** [@marciguerron](https://github.com/marciguerron)
- **Repositorio:** https://github.com/marciguerron/marciaclaw

---

*Generado automáticamente por MarciaBot*