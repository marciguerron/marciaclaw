# 🔌 Integraciones con APIs

## Resumen

Este documento describe todas las integraciones con APIs externas disponibles en el sistema `marciaclaw`.

## Tabla de Contenidos

1. [YouTube Data API v3](#youtube-data-api-v3)
2. [Supabase](#supabase)
3. [Perplexity AI](#perplexity-ai)
4. [OpenClaw](#openclaw)
5. [Browser Automation](#browser-automation)
6. [Text-to-Speech (ElevenLabs)](#text-to-speech)

---

## YouTube Data API v3

### Descripción

API oficial de Google para acceder a datos de YouTube: canales, videos, playlists, comentarios.

### Configuración

```yaml
youtube:
  api_key: ${YOUTUBE_API_KEY}
  client_id: ${YOUTUBE_CLIENT_ID}
  client_secret: ${YOUTUBE_CLIENT_SECRET}
  quota_limit: 10000  # Unidades de cuota por día
  max_results: 50
  region_codes:
    - MX  # México
    - ES  # España
    - US  # Estados Unidos
```

### Endpoints Utilizados

| Endpoint | Uso | Cuota |
|----------|-----|-------|
| `search.list` | Buscar canales/videos | 100 |
| `channels.list` | Info del canal | 1 |
| `videos.list` | Info de videos | 1 |
| `commentThreads.list` | Comentarios | 1 |

### Ejemplo de Uso

```typescript
import { youtubeService } from '../integrations/youtube/youtubeService';

const channel = await youtubeService.getChannelByHandle('@MindvalleyEspañol');

const shorts = await youtubeService.getChannelShorts(channel.id, {
  maxResults: 10,
  order: 'VIEW_COUNT'  // Más populares
});
```

### Métodos Disponibles

```typescript
// Obtener canal por handle
getChannelByHandle(handle: string): Promise<YouTubeChannel>

// Obtener Shorts de un canal
getChannelShorts(channelId: string, options?: {
  maxResults?: number
  order?: 'DATE' | 'VIEW_COUNT' | 'RATING'
}): Promise<YouTubeVideo[]>

// Buscar videos por palabra clave
searchVideos(query: string, options?: {
  maxResults?: number
  regionCode?: string
  relevanceLanguage?: string
}): Promise<YouTubeVideo[]>

// Obtener métricas de un video
getVideoMetrics(videoId: string): Promise<{
  viewCount: number
  likeCount: number
  commentCount: number
}>
```

---

## Supabase

### Descripción

Plataforma de base de datos PostgreSQL con APIs automáticas.

### Configuración

```yaml
supabase:
  url: ${SUPABASE_URL}
  key: ${SUPABASE_KEY}
  table_prefix: marcia_
  # Tablas:
  # - marcia_channels
  # - marcia_shorts
  # - marcia_research
  # - marcia_memory
```

### Esquema de Base de Datos

```sql
-- Tabla de canales
CREATE TABLE marcia_channels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  youtube_id VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  handle VARCHAR(100),
  url VARCHAR(500),
  description TEXT,
  subscriber_count INTEGER,
  video_count INTEGER,
  location VARCHAR(100),
  niche VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabla de Shorts
CREATE TABLE marcia_shorts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  channel_id UUID REFERENCES marcia_channels(id),
  youtube_id VARCHAR(255) UNIQUE NOT NULL,
  title VARCHAR(500) NOT NULL,
  description TEXT,
  view_count BIGINT,
  like_count BIGINT,
  published_at TIMESTAMP WITH TIME ZONE,
  url VARCHAR(500),
  hook TEXT,
  is_viral BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabla de investigaciones
CREATE TABLE marcia_research (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title VARCHAR(500),
  niche VARCHAR(100),
  country VARCHAR(10),
  status VARCHAR(50) DEFAULT 'pending',
  result JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar RLS
ALTER TABLE marcia_channels ENABLE ROW LEVEL SECURITY;
ALTER TABLE marcia_shorts ENABLE ROW LEVEL SECURITY;
ALTER TABLE marcia_research ENABLE ROW LEVEL SECURITY;
```

### Ejemplo de Uso

```typescript
import { supabaseService } from '../integrations/supabase/supabaseService';

// Guardar canal
const channel = await supabaseService.insertChannel({
  youtube_id: 'UC123456',
  name: 'Canal Ejemplo',
  handle: '@canalejemplo',
  niche: 'finanzas',
  location: 'MX'
});

// Obtener Shorts virales
const shorts = await supabaseService.getShorts({
  channel_id: channel.id,
  min_views: 10000,
  limit: 10
});
```

---

## Perplexity AI

### Descripción

API de búsqueda web con capacidades de IA para investigación.

### Configuración

```yaml
perplexity:
  api_key: ${PERPLEXITY_API_KEY}
  max_tokens: 8000
  timeout: 30000  # ms
  models:
    - sonar
    - sonar-pro
    - llama-3.1-sonar-small-128k-online
    - llama-3.1-sonar-large-128k-online
```

### Ejemplo de Uso

```typescript
import { perplexityService } from '../integrations/perplexity/perplexityService';

// Búsqueda simple
const results = await perplexityService.search({
  query: 'top finance youtube channels mexico 2024',
  options: {
    freshness: 'year',
    country: 'MX',
    language: 'es'
  }
});

// Investigación detallada
const research = await perplexityService.research({
  topic: 'estrategias de marketing para coaches financieros',
  sources: 10,
  max_tokens: 15000
});
```

---

## OpenClaw

### Descripción

Sistema de automatización de mensajería y asistentes IA.

### Configuración

```yaml
openclaw:
  url: ${OPENCLAW_URL}  # http://localhost:8080
  api_key: ${OPENCLAW_API_KEY}
  session_id: ${OPENCLAW_SESSION_ID}
  default_channel: telegram
```

### Ejemplo de Uso

```typescript
import { openclawService } from '../integrations/openclaw/openclawService';

// Enviar mensaje
await openclawService.sendMessage({
  channel: 'telegram',
  message: 'Investigación completada ✅',
  to: '1082167939'  // ID de Marcia
});

// Enviar con botones
await openclawService.sendButtons({
  channel: 'telegram',
  message: '¿Qué acción deseas realizar?',
  buttons: [
    { text: 'Ver resultados', callback_data: 'show_results' },
    { text: 'Nueva investigación', callback_data: 'new_research' }
  ]
});

// Obtener estado de sesión
const status = await openclawService.getSessionStatus();
```

---

## Browser Automation

### Descripción

Control de navegador headless para extracción de datos dinámicos.

### Configuración

```yaml
browser:
  headless: true
  timeout: 30000  # ms
  viewport:
    width: 1280
    height: 720
  profiles:
    default: ~/.cache/openclaw/browser
    user: ~/.config/google-chrome
```

### Ejemplo de Uso

```typescript
import { browserService } from '../integrations/browser/browserService';

// Navegar a página
await browserService.navigate('https://youtube.com/@Canal/shorts');

// Hacer snapshot del DOM
const snapshot = await browserService.snapshot({
  format: 'aria',
  depth: 5
});

// Click en elemento
await browserService.click('aria-ref=e123');

// Extraer texto
const title = await browserService.text('aria-ref=e456');
```

---

## Text-to-Speech (ElevenLabs)

### Descripción

API de síntesis de voz de alta calidad.

### Configuración

```yaml
elevenlabs:
  api_key: ${ELEVENLABS_API_KEY}
  default_voice: 'Nova'  # Voz cálida, ligeramente británica
  default_model: 'eleven_multilingual_v2'
  stability: 0.5
  similarity_boost: 0.75
```

### Ejemplo de Uso

```typescript
import { ttsService } from '../services/ttsService';

// Sintetizar texto
await ttsService.synthesize({
  text: 'Hola Marcia, tu investigación está lista.',
  voice: 'Nova',
  language: 'es'
});

// Con opciones personalizadas
await ttsService.synthesize({
  text: 'Resultados: 10 canales analizados',
  voice: 'Adam',
  stability: 0.3,
  similarity_boost: 0.8
});
```

---

## Variables de Entorno Requeridas

```bash
# YouTube
YOUTUBE_API_KEY=AIza...
YOUTUBE_CLIENT_ID=123...
YOUTUBE_CLIENT_SECRET=GOC...

# Supabase
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_KEY=eyJhbGci...

# Perplexity
PERPLEXITY_API_KEY=pplx-...

# OpenClaw
OPENCLAW_URL=http://localhost:8080
OPENCLAW_API_KEY=oc_...

# ElevenLabs
ELEVENLABS_API_KEY=xi_...

# Browser
BROWSER_PROFILE_PATH=/path/to/profile

# GitHub
GITHUB_TOKEN=ghp_...
```

## Límites y Cuotas

| API | Límite | Reset |
|-----|--------|-------|
| YouTube | 10,000 unidades/día | Diario |
| Supabase | Consultas ilimitadas | - |
| Perplexity | Según plan | - |
| ElevenLabs | Según plan | Mensual |
| OpenClaw | Sin límite | - |

---

*Documento generado automáticamente*