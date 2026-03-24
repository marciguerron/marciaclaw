# Skill: Document Generator

**Versión:** 1.0.0
**Autor:** Marcia Bot
**Categoría:** Tools

---

## Descripción

Skill para generación automática de documentos profesionales en múltiples formatos: Word (.docx), PDF, HTML, y Markdown. Ideal para reportes de investigación, presentaciones y documentación técnica.

---

## Cuándo Usar Este Skill

Usa este skill cuando:

- El usuario pida generar un documento Word o PDF
- El usuario necesite formatear reportes profesionalmente
- El usuario solicite exportar datos a documento estructurado
- El usuario quiera compartir información profesionalmente

---

## Capacidades

### 1. Generación de Markdown (`.md`)

```typescript
function generateMarkdown(data: any, template: string): string {
  // Convierte datos a Markdown
  // Aplica plantilla específica
  // Incluye Headers, listas, tablas
}
```

### 2. Generación de HTML (`.html`)

```typescript
function generateHTML(data: any, template: string): string {
  // Convierte datos a HTML5
  // Aplica estilos CSS profesionales
  // Incluye meta tags para SEO
  // Listo para conversión a Word/PDF
}
```

### 3. Generación de JSON (`.json`)

```typescript
function generateJSON(data: any): string {
  // Serializa datos como JSON
  // Minificado o pretty-print
  // Para uso programático
}
```

### 4. Generación de Documento Word (`.docx`)

```typescript
function generateDocx(data: any): Buffer {
  // Crea documento Word
  // Incluye: headers, estilos, tablas
  // Soporta imágenes y formato rico
}
```

### 5. Generación de PDF (`.pdf`)

```typescript
function generatePDF(data: any): Buffer {
  // Crea documento PDF
  // Incluye: headers, footers, TOC
  // Formato profesional listo para impresión
}
```

---

## Estructura de Documentos

### Plantillas Disponibles

| Plantilla | Uso | Formato |
|-----------|-----|---------|
| `youtube-research` | Investigación de canales/Shorts | MD, HTML, DOCX |
| `channel-analysis` | Análisis detallado de canal | MD, HTML, DOCX |
| `generic-report` | Reporte genérico | MD, HTML, DOCX, PDF |
| `memory-entry` | Entradas de memoria | MD |

---

## Ejemplo de Uso

### Generar Documento Markdown

```
Usuario: "Genera documento de la investigación"

Bot:
1. Cargar datos de la investigación
2. Aplicar plantilla youtube-research.md
3. Generar Markdown formateado
4. Guardar en /data/workspace/
5. Enviar documento como mensaje
```

### Generar Documento HTML (para Word)

```
Usuario: "Necesito un documento Word del reporte"

Bot:
1. Cargar datos
2. Generar HTML con estilos compatibles con Word
3. Guardar como reporte.html
4 Instrucciones: "Abrir en Word > Guardar como .docx"
5. Enviar archivo HTML
```

### Generar Documento PDF

```
Usuario: "Exporta esto a PDF profesional"

Bot:
1. Cargar datos
2. Generar PDF con formato profesional
3. Incluir: headers, page numbers, firma
4. Enviar archivo PDF
```

---

## Formato HTML Profesional

### Estilos CSS para Conversión a Word

```css
/* Estilos compatibles con Word */
body {
  font-family: Arial, sans-serif;
  line-height: 1.6;
  max-width: 800px;
  margin: 0 auto;
  padding: 40px;
}

h1 { color: #2c3e50; border-bottom: 3px solid #3498db; }
h2 { color: #34495e; border-bottom: 2px solid #95a5a6; }

table {
  width: 100%;
  border-collapse: collapse;
  margin: 20px 0;
}

th, td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}

th { background-color: #3498db; color: white; }
```

---

## Generación de Documento Word

### Método 1: HTML con Estilos Word

1. Generar HTML con estilos compatibles
2. Abrir en Microsoft Word
3. Guardar como `.docx`

### Método 2: Python python-docx

```python
from docx import Document

doc = Document()
doc.add_heading('Investigación YouTube Shorts', level=1)

# Agregar tabla
table = doc.add_table(rows=1, cols=3)
table.style = 'Table Grid'

# Guardar
doc.save('investigacion.docx')
```

### Método 3: LibreOffice Convert

```bash
libreoffice --headless --convert-to docx investigacion.html
```

---

## Generación de PDF

### Método 1: WeasyPrint

```python
from weasyprint import HTML

HTML('reporte.html').write_pdf('reporte.pdf')
```

### Método 2: Pandoc

```bash
pandoc reporte.md -o reporte.pdf --pdf-engine=weasyprint
```

### Método 3: wkhtmltopdf

```bash
wkhtmltopdf reporte.html reporte.pdf
```

---

## Estructura del Documento Generado

### Portada

```
TÍTULO DEL DOCUMENTO
====================
Subtítulo: Descripción
Fecha: 2026-03-24
Autor: Marcia Bot
Versión: 1.0
```

### Contenido

1. Resumen Ejecutivo
2. Introducción
3. Metodología
4. Resultados
5. Análisis
6. Conclusiones
7. Recomendaciones
8. Apéndices

### Apéndices

A. Datos Crudos
B. Referencias
C. Glosario

---

## Ejemplo de Salida

### Documento Markdown Generado

```markdown
# 📊 Investigación YouTube Shorts

## Resumen Ejecutivo

Se analizaron 10 canales en el nicho de finanzas...

## Canales Analizados

| # | Canal | Shorts | Vistas |
|---|-------|--------|--------|
| 1 | Mindvalley | 10 | 5.2M |
| 2 | Diana Caro | 10 | 3.1M |

## Conclusiones

Los hooks más efectivos son promesas rápidas ("sin esfuerzo")...
```

---

## Barras de Progreso

### Navegador Visual

Para grandes documentos, usar barra de progreso:

```
📊 Generando documento...
[████████████░░] 80% completado

- Exportando datos: ✅
- Aplicando plantilla: ✅
- Generando HTML: ⏳
- Enviando archivo: ⏳
```

### Terminal

```bash
[▓▓▓▓▓▓▓▓░░░] 80% - Generando documento...
```

---

## Recursos

- Plantillas: `marciaclaw/templates/`
- Scripts: `marciaclaw/scripts/`
- Estilos CSS: Referencia profesional

---

## Notas de Implementación

- HTML es el mejor formato para conversión a Word
- PDF requiere tiempo de proceso más largo
- JSON para API y uso programático
- Markdown para documentación y version control

---

## Status

⚠️ **En Progreso**

- Markdown: ✅ Completado
- HTML: ✅ Completado
- JSON: ✅ Completado
- Word: ⏳ Requiere python-docx o LibreOffice
- PDF: ⏳ Requiere WeasyPrint o Pandoc

---

*Skill creado para MarciaClaw v1.0.0*
*Generación automática de documentos profesionales*