# Analytics Plugin - MarciaClaw

Plugin para recopilación y análisis de métricas.

---

## Capacidades

- ✅ Métricas de uso
- ✅ Analítica de rendimiento
- ✅ Tracking de errores
- ✅ Reportes personalizados
- ✅ Exportación (Excel/CSV)

---

## Configuración

```yaml
analytics:
  enabled: true
  metrics:
    - performance
    - usage
    - errors
    - features
  export_format: csv
  retention_days: 90
```

---

## Uso

```typescript
import { analyticsPlugin } from './plugins/analytics';

// Obtener métricas
const metrics = await analyticsPlugin.getMetrics({
  range: 'last_7_days',
  metrics: ['usage', 'performance']
});

// Exportar a CSV
await analyticsPlugin.export({
  format: 'csv',
  metrics: ['usage']
});

// Reporte personalizado
const report = await analyticsPlugin.generateReport({
  type: 'weekly',
  include: ['performance', 'features']
});
```

---

## Estado

✅ **Completado**