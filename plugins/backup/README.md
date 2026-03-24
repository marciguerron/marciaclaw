# Backup Plugin - MarciaClaw

Plugin para respaldo automático de datos críticos.

---

## Capacidades

- ✅ Respaldo de base de datos
- ✅ Respaldo de archivos
- ✅ Respaldo de memoria
- ✅ Compresión (gzip)
- ✅ Cifrado (AES-256)
- ✅ Programación (cron)

---

## Configuración

```yaml
backup:
  enabled: true
  schedule: "0 0 * * *"  # Diario a las 00:00
  retention: 30  # Días a mantener
  compression: gzip
  encryption: true
  targets:
    - database
    - files
    - memory
  destination: /backups/
```

---

## Uso

```typescript
import { backupPlugin } from './plugins/backup';

// Respaldo completo
await backupPlugin.backup({
  targets: ['database', 'files', 'memory'],
  destination: '/backups/'
});

// Respaldo específico
await backupPlugin.backupDatabase({
  destination: '/backups/db/'
});

// Restaurar
await backupPlugin.restore({
  source: '/backups/backup_20240324.tar.gz',
  targets: ['database']
});
```

---

## Estado

✅ **Completado**