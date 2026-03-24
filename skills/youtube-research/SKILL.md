# Skill: YouTube Shorts Research

**Versión:** 1.0.0
**Autor:** Marcia Bot
**Categoría:** Research

---

## Descripción

Skill especializado para investigación sistemática de YouTube Shorts en el nicho de finanzas, abundancia y prosperidad. Analiza canales, extrae datos de contenido viral, y genera reportes detallados.

---

## Cuándo Usar Este Skill

Usa este skill cuando:

- El usuario pida investigar canales de YouTube
- El usuario necesite análisis de contenido viral
- El usuario quiera identificar patrones de hooks
- El usuario requeste reportes de investigación de Shorts

---

## Capacidades

### 1. Análisis de Canales

```typescript
async function analyzeChannel(handle: string, options: {
  maxShorts?: number
  country?: string
  niche?: string
}) {
  // Extrae datos del canal
  // Obtiene los Shorts más populares
  // Identifica patrones en títulos y hooks
}
```

### 2. Análisis Múltiple de Canales

```typescript
async function analyzeMultipleChannels(handles: string[], options) {
  // Analiza múltiples canales en paralelo
  // Genera reportes comparativos
  // Identifica tendencias globales
}
```

### 3. Búsqueda de Shorts Virales

```typescript
async function searchViralShorts(query: string, options) {
  // Busca Shorts por término
  // Filtra por país y lenguaje
  // Identifica contenido viral
}
```

### 4. Generación de Reportes

```typescript
async function generateReport(data, format: 'md' | 'html' | 'json') {
  // Genera reporte en el formato especificado
  // Incluye: canales, hooks, patrones, insights
}
```

---

## Metodología

### Fase 1: Búsqueda de Canales

1. Buscar términos clave: "finanzas", "abundancia", "prosperidad", "dinero"
2. Filtrar por país (MX, ES, US)
3. Identificar canales con alto engagement

### Fase 2: Extracción de Data

1. Obtener top 10 Shorts más populares por canal
2. Extraer: título, hook, descripción, vistas, likes
3. Crear archivo por canal analizado

### Fase 3: Análisis de Patrones

1. Identificar hooks recurrentes (frases de apertura virales)
2. Detectar temas principales (deudas, mentalidad, creencias)
3. Extraer CTAs (call-to-actions) efectivos

### Fase 4: Generación de Insights

1. Comparativo entre canales
2. Recomendaciones de contenido
3. Estrategias para replicar éxito

---

## Herramientas Necesarias

- `youtubeService.ts` - Cliente de YouTube Data API v3
- `supabaseService.ts` - Almacenamiento de resultados
- `browserService.ts` - Extracción de datos dinámicos
- Navegador con soporte para `/shorts`

---

## Salidas Esperadas

### 1. Archivo de Investigación

```
investigacion-youtube-shorts-completa.md
├── 10 canales analizados
├── Top 10 Shorts por canal
├── Patrones de hooks
├── Insights y recomendaciones
└── Estructura profesional
```

### 2. Base de Datos

```sql
INSERT INTO marcia_shorts (
  youtube_id, title, hook, view_count, like_count, 
  is_viral, viral_score
) VALUES (...);
```

### 3. Reportes

- Markdown: `investigacion-youtube-shorts-completa.md`
- HTML: Para conversión a Word/PDF
- JSON: Para uso programático

---

## Ejemplo de Uso

### Canal Individual

```
Usuario: "Investiga el canal de Mindvalley Español"

Bot:
1. Navegar a/@MindvalleyEspañol/shorts
2. Extraer top 10 Shorts más populares
3. Identificar hooks y patrones
4. Guardar en Supabase
5. Generar reporte Markdown
6. Responder con resumen
```

### Búsqueda General

```
Usuario: "Encuentra los mejores canales de finanzas en México"

Bot:
1. Buscar en YouTube: "finanzas abundancia prosperity money shorts"
2. Filtrar por país: MX
3. Analizar top 10 canales
4. Extraer datos de Shorts virales
5. Generar reporte completo
6. Enviar documento
```

---

## Patrones de Hooks Identificados

| Tipo de Hook | Ejemplo | Frecuencia |
|--------------|---------|------------|
| Promesa Rápida | "sin esfuerzo", "al instante" | 80% |
| Revelación | "DESCUBRE", "El secreto" | 60% |
| Pregunta | "¿Por qué siempre...?" | 70% |
| Número + Lista | "4 mitos", "7 cosas" | 50% |
| Contradicción | "dinero sin esfuerzo" | 40% |

---

## Recursos

- Documento de investigación: `/data/workspace/INVESTIGACION_FINAL_YOUTUBE_SHORTS.md`
- Plantilla: `marciaclaw/templates/youtube-research.md`
- API: YouTube Data API v3
- Base de datos: Supabase

---

## Notas de Implementación

- La API de YouTube tiene límites de cuota (10,000/día)
- Para evitar límites, usar caché en Supabase
- Los videos más virales tienen >1M de vistas
- Hooks con mayúsculas y emojis tienen más impacto

---

## Status

✅ **Completado**

---

*Skill creado para MarciaClaw v1.0.0*
*Investigación y análisis de YouTube Shorts especializado en el nicho de finanzas y abundancia*