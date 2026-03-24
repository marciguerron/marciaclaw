# 📖 Guía de Uso del Sistema

## Tabla de Contenidos

1. [Inicio Rápido](#inicio-rápido)
2. [Configuración Inicial](#configuración-inicial)
3. [Investigación de YouTube Shorts](#investigación-de-youtube-shorts)
4. [Gestión de Memoria](#gestión-de-memoria)
5. [Envío de Mensajes](#envío-de-mensajes)
6. [Automatización](#automatización)
7. [Solución de Problemas](#solución-de-problemas)

---

## Inicio Rápido

### Requisitos Previos

- Node.js v18 o superior
- Git
- Cuenta de GitHub
- API Keys de los servicios que deseas usar

### Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/marciguerron/marciaclaw.git
cd marciaclaw

# 2. Instalar dependencias
npm install

# 3. Configurar variables de entorno
cp .env.example .env.local
# Editar .env.local con tus API keys

# 4. Ejecutar script de setup
chmod +x scripts/setup.sh
./scripts/setup.sh
```

---

## Configuración Inicial

### 1. Obtener API Keys

#### YouTube Data API v3

1. Ve a [Google Cloud Console](https://console.cloud.google.com/)
2. Crea un nuevo proyecto
3. Habilita "YouTube Data API v3"
4. Crea credenciales (API Key)

#### Supabase

1. Ve a [Supabase](https://supabase.com/)
2. Crea un nuevo proyecto
3. Ve a Settings > API
4. Copia URL y anon key

#### Perplexity AI

1. Ve a [Perplexity AI](https://www.perplexity.ai/)
2. Crea cuenta y suscríbete al plan necesario
3. Genera API key en Settings

#### OpenClaw

1. Instala OpenClaw según documentación oficial
2. Obtén tu API key de la configuración

#### ElevenLabs (Opcional)

1. Ve a [ElevenLabs](https://elevenlabs.io/)
2. Crea cuenta gratuita
3. Genera API key en Profile > API

### 2. Configurar Variables de Entorno

Edita el archivo `.env.local`:

```bash
# OpenClaw (requerido)
OPENCLAW_API_KEY=tu_api_key_openclaw
OPENCLAW_URL=http://localhost:8080

# YouTube (requerido para investigación)
YOUTUBE_API_KEY=tu_youtube_api_key

# Supabase (requerido para persistencia)
SUPABASE_URL=tu_supabase_url
SUPABASE_KEY=tu_supabase_key

# Perplexity (requerido para búsquedas web)
PERPLEXITY_API_KEY=tu_perplexity_key

# ElevenLabs (opcional - para voz)
ELEVENLABS_API_KEY=tu_elevenlabs_key

# GitHub (opcional - para sincronización)
GITHUB_TOKEN=tu_github_token
```

---

## Investigación de YouTube Shorts

### Uso Básico

```typescript
import { youtubeResearchService } from './services/youtubeResearchService';

// Investigar un canal específico
const research = await youtubeResearchService.analyzeChannel({
  channelHandle: '@MindvalleyEspañol',
  country: 'MX',
  niche: 'finanzas',
  maxShorts: 10
});

console.log(research);
```

### Investigar Múltiples Canales

```typescript
const channels = [
  '@MindvalleyEspañol',
  '@SebastianBeja',
  '@DianaCaroOficial'
];

const results = await youtubeResearchService.analyzeMultipleChannels({
  channels,
  country: 'MX',
  niche: 'finanzas',
  maxShortsPerChannel: 10
});
```

### Buscar Shorts por Nicho

```typescript
// Buscar Shorts virales en el nicho de finanzas
const shorts = await youtubeResearchService.searchViralShorts({
  query: 'finanzas abundancia prosperidad dinero',
  country: 'MX',
  maxResults: 50,
  minViews: 10000  // Solo virales
});

console.log(shorts);
```

### Guardar Resultados en Base de Datos

```typescript
const research = await youtubeResearchService.analyzeChannel({
  channelHandle: '@CanalEjemplo',
  country: 'MX',
  niche: 'finanzas',
  saveToDatabase: true
});

console.log(`Guardados ${research.savedCount} shorts en la base de datos`);
```

---

## Gestión de Memoria

### Cargar Memoria al Iniciar

```typescript
import { memoryService } from './services/memoryService';

// Cargar memoria de largo plazo
const longTermMemory = await memoryService.loadLongTermMemory();

// Cargar notas del día
const todayNotes = await memoryService.loadTodayNotes();

// Combinar para contexto completo
const context = {
  ...longTermMemory,
  ...todayNotes
};
```

### Guardar Nuevo Recuerdo

```typescript
// Guardar hecho importante
await memoryService.saveLongTermMemory({
  type: 'preference',
  content: 'Marcia prefiere respuestas concisas y directas',
  category: 'user_preferences'
});

// Guardar decisión
await memoryService.saveLongTermMemory({
  type: 'decision',
  content: 'Usar YouTube Data API en lugar de web scraping',
  reason: 'Más estable y cumple ToS',
  category: 'technical_decisions'
});
```

### Heartbeats

Configura monitoreos periódicos en `memory/HEARTBEAT.md`:

```markdown
# Heartbeat Configuration

## Check Frequency (minutes)
- email: 60
- calendar: 120
- mentions: 30
- weather: 180

## Active Hours
- start: 08:00
- end: 23:00

## Notifications Channel
- telegram
```

---

## Envío de Mensajes

### Mensaje Simple

```typescript
import { messageService } from './services/messageService';

await messageService.send({
  channel: 'telegram',
  to: '1082167939',  // ID de Marcia
  message: 'Tu investigación está lista ✅'
});
```

### Mensaje con Botones

```typescript
await messageService.sendButtons({
  channel: 'telegram',
  to: '1082167939',
  message: '¿Qué deseas hacer ahora?',
  buttons: [
    { text: '📊 Ver resultados', callback_data: 'view_results' },
    { text: '🔍 Nueva investigación', callback_data: 'new_research' },
    { text: '❌ Cancelar', callback_data: 'cancel' }
  ]
});
```

### Mensaje con Archivo

```typescript
await messageService.sendFile({
  channel: 'telegram',
  to: '1082167939',
  message: 'Aquí está el reporte de investigación',
  filePath: './investigacion-youtube-shorts-completa.md'
});
```

### Respuesta con Voz

```typescript
// Envía el texto y lo convierte a voz automáticamente
await messageService.sendWithVoice({
  channel: 'telegram',
  to: '1082167939',
  text: 'Hola Marcia, tu investigación está lista.',
  voice: 'Nova'  // Voz específica
});
```

---

## Automatización

### Sincronización con GitHub

```bash
# Sincronizar cambios manualmente
./scripts/sync.sh "Actualización de investigación de YouTube"

# O desde código
import { gitService } from './services/gitService';

await gitService.commitAndPush({
  message: 'feat: Actualizar investigación de Shorts',
  files: ['memory/2026-03-24.md', 'docs/investigacion.md']
});
```

### Respaldo Automático

```bash
# Ejecutar respaldo
./scripts/backup.sh

# Esto creará un archivo backup_YYYY-MM-DD.zip con:
# - memory/
# - config/
# - docs/
```

### Programar Heartbeats

```typescript
import { heartbeatService } from './services/heartbeatService';

heartbeatService.start({
  intervalMinutes: 30,
  checks: ['email', 'calendar', 'mentions']
});
```

---

## Solución de Problemas

### Error: "YouTube API quota exceeded"

**Causa:** Se alcanzó el límite diario de cuota.

**Solución:**
```bash
# Verificar cuota restante
npm run youtube:quota

# Si está agotado:
# - Esperar hasta mañana (se renueva)
# - Solicitar aumento de cuota en Google Cloud Console
```

### Error: "Supabase connection failed"

**Causa:** URL o key incorrectos, o problemas de red.

**Solución:**
```bash
# Verificar configuración
cat .env.local | grep SUPABASE

# Probar conexión manualmente
curl -H "apikey: $SUPABASE_KEY" \
  "$SUPABASE_URL/rest/v1/?select=*&limit=1"
```

### Error: "Perplexity API error"

**Causa:** Credenciales inválidas o créditos agotados.

**Solución:**
```bash
# Verificar créditos en Perplexity
# Si créditos = 0:
# - Esperar renovación o
# - Actualizar plan
```

### Error: "Browser timeout"

**Causa:** La página no cargó en el tiempo esperado.

**Solución:**
```yaml
# Aumentar timeout en config/browser.yaml
browser:
  timeout: 60000  # 60 segundos
```

### Mejores Prácticas

1. **Siempre usa variables de entorno** - Nunca hardcodees API keys
2. **Haz respaldos frecuentes** - Especialmente antes de cambios grandes
3. **Monitorea cuotas de API** - Evita interrupciones inesperadas
4. **Documenta decisiones** - Usa memory/MEMORY.md
5. **Prueba en desarrollo** - Nunca en producción primero

---

## Comandos Útiles

| Comando | Descripción |
|---------|-------------|
| `npm run setup` | Configuración inicial |
| `npm run sync` | Sincronizar con GitHub |
| `npm run backup` | Crear respaldo |
| `npm run research -- --channel=@Canal` | Investigar canal |
| `npm run research -- --niche=finanzas --country=MX` | Buscar por nicho |
| `npm run memory:load` | Cargar memoria |
| `npm run memory:save` | Guardar memoria |
| `npm run test` | Ejecutar pruebas |
| `npm run lint` | Verificar código |

---

*Documento generado automáticamente*