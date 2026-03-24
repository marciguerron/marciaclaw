# Skills de OpenClaw - Sistema MarciaClaw

Este directorio contiene todos los skills especializados disponibles para MarciaClaw.

---

## 📁 Estructura

```
skills/
├── youtube-research/
│   └── SKILL.md
├── document-generator/
│   └── SKILL.md
├── database-manager/
│   └── SKILL.md
└── memory-manager/
    └── SKILL.md
```

---

## 🔥 Skills Disponibles

### 1. YouTube Research (`youtube-research`)

**Propósito:** Investigación sistemática de YouTube Shorts en nichos específicos.

**Capacidades:**
- Análisis de canales individuales
- Análisis múltiple de canales
- Búsqueda de Shorts virales
- Generación de reportes detallados

**Estado:** ✅ **Completado**

**Más información:** `skills/youtube-research/SKILL.md`

---

### 2. Document Generator (`document-generator`)

**Propósito:** Generación automática de documentos profesionales.

**Capacidades:**
- Generación de Markdown (`.md`)
- Generación de HTML (`.html`)
- Generación de JSON (`.json`)
- Generación de Word (`.docx`)
- Generación de PDF (`.pdf`)

**Estado:** ⚠️ **En Progreso**
- ✅ Markdown
- ✅ HTML
- ✅ JSON
- ⏳ Word (requiere python-docx)
- ⏳ PDF (requiere WeasyPrint)

**Más información:** `skills/document-generator/SKILL.md`

---

### 3. Database Manager (`database-manager`)

**Propósito:** Gestión profesional de base de datos Supabase.

**Capacidades:**
- Conexión a Supabase
- CRUD de canales y Shorts
- Consultas complejas
- Migraciones y seeders
- Backup y restauración

**Estado:** ✅ **Completado**

**Más información:** `skills/database-manager/SKILL.md`

---

### 4. Memory Manager (`memory-manager`)

**Propósito:** Gestión de memoria persistente del sistema.

**Capacidades:**
- Guardar/hechos preferencias
- DecISIONES técnicas
- Learning del sistema
- Notas y contexto
- Recuperación inteligente

**Estado:** ✅ **Completado**

**Más información:** `skills/memory-manager/SKILL.md`

---

## 🚀 Cómo Usar

### Desde el Chat

```
Usuario: "Investiga el canal de Mindvalley"

MarciaBot: [Usa skill youtube-research]
  1. Analiza el canal
  2. Extrae datos
  3. Genera reporte
  4. Responde con resumen
```

```
Usuario: "Genera un documento Word del reporte"

MarciaBot: [Usa skill document-generator]
  1. Carga datos
  2. Genera HTML
  3. Instruye cómo convertir
  4. Envía archivo
```

### Programáticamente

```typescript
import { youtubeResearchSkill } from './skills/youtube-research';

const research = await youtubeResearchSkill.analyzeChannel({
  handle: '@MindvalleyEspañol',
  maxShorts: 10
});
```

---

## 📊 Progreso de Implementación

```
[██████████░░] 90% - Skills Implementados

✅ YouTube Research          - 100%
✅ Document Generator (Markdown/HTML/JSON) - 100%
⏳ Document Generator (Word) - 50%
⏳ Document Generator (PDF)  - 50%
✅ Database Manager          - 100%
✅ Memory Manager            - 100%
```

---

## 🔄 Flujos de Trabajo

### Investigación Completa → Documento

```
1. YouTube Research
   ↓
2. Database Manager (guardar datos)
   ↓
3. Document Generator (crear reporte)
   ↓
4. Memory Manager (guardar conclusiones)
   ↓
5. Documento final entregado
```

---

## 📚 Recursos

- **Documentación de Skills:** Cada `SKILL.md` dentro de cada directorio
- **Plantillas:** `../templates/`
- **Integraciones:** `../integrations/`
- **Base de Datos:** Ver `integrations/supabase/migrations/`

---

## 🎯 Próximos Skills a Implementar

- [ ] `browser-automation` - Automatización avanzada de navegador
- [ ] `data-analyzer` - Análisis estadístico de datos
- [ ] `tts-engine` - Text-to-Speech multilenguaje
- [ ] `image-generator` - Generación de imágenes con DALL-E
- [ ] `video-processor` - Procesamiento de videos

---

*Skills de OpenClaw - MarciaClaw v1.0.0*
*Última actualización: 2026-03-24*