# Plugins de OpenClaw - Sistema MarciaClaw

Este directorio contiene todos los plugins extendidos disponibles para MarciaClaw.

---

## 📁 Estructura

```
plugins/
├── github/
│   ├── README.md
│   └── github-plugin.ts
├── backup/
│   ├── README.md
│   └── backup-plugin.ts
├── analytics/
│   ├── README.md
│   └── analytics-plugin.ts
└── notification/
    ├── README.md
    └── notification-plugin.ts
```

---

## 🔌 Plugins Disponibles

### 1. GitHub Plugin (`github`)

**Propósito:** Sincronización automatizada con GitHub.

**Capacidades:**
- Commit y push automáticos
- Pull requests
- Issue tracking
- Branch management
- Release management

**Configuración:**
```yaml
github:
  token: ${GITHUB_TOKEN}
  owner: marciguerron
  repo: marciaclaw
  branch: main
  auto_commit: true
```

**Uso:**
```typescript
import { githubPlugin } from './plugins/github';

await githubPlugin.push({
  message: 'feat: Nueva funcionalidad',
  files: ['src/nuevo-archivo.ts']
});
```

---

### 2. Backup Plugin (`backup`)

**Propósito:** Respaldo automático de datos críticos.

**Capacidades:**
- Respaldo de base de datos
- Respaldo de archivos
- Respaldo de memoria
- Compresión y cifrado
- Programación automática

**Configuración:**
```yaml
backup:
  enabled: true
  schedule: "0 0 * * *"  # Diario a las 00:00
  retention: 30  # Días a mantener
  compression: gzip
  encryption: true
```

**Uso:**
```typescript
import { backupPlugin } from './plugins/backup';

await backupPlugin.backup({
  targets: ['database', 'files', 'memory'],
  destination: '/backups/'
});
```

---

### 3. Analytics Plugin (`analytics`)

**Propósito:** Recopilación y análisis de métricas.

**Capacidades:**
- Métricas de uso
- Analítica de rendimiento
- Tracking de errores
- Reportes personalizables
- Exportación a Excel/CSV

**Configuración:**
```yaml
analytics:
  enabled: true
  metrics:
    - performance
    - usage
    - errors
    - features
  export_format: csv
```

**Uso:**
```typescript
import { analyticsPlugin } from './plugins/analytics';

const metrics = await analyticsPlugin.getMetrics({
  range: 'last_7_days',
  metrics: ['usage', 'performance']
});
```

---

### 4. Notification Plugin (`notification`)

**Propósito:** Envío de alertas y notificaciones.

**Capacidades:**
- Notificaciones Telegram
- Email alerts
- Push notifications
- Webhooks
- Programación de alertas

**Configuración:**
```yaml
notification:
  channels:
    - telegram
    - email
  telegram:
    bot_token: ${TELEGRAM_BOT_TOKEN}
    chat_id: ${TELEGRAM_CHAT_ID}
  email:
    smtp_server:smtp.gmail.com
    smtp_port: 587
```

**Uso:**
```typescript
import { notificationPlugin } from './plugins/notification';

await notificationPlugin.send({
  channel: 'telegram',
  message: '✅ Backup completado',
  priority: 'high'
});
```

---

## 🚀 Instalación y Uso

### 1. Activar un Plugin

```bash
# Editar config/plugins.yaml
enabled_plugins:
  - github
  - backup
  - analytics
  - notification
```

### 2. Configurar Variables de Entorno

```bash
# .env.local
GITHUB_TOKEN=...
TELEGRAM_BOT_TOKEN=...
TELEGRAM_CHAT_ID=...
```

### 3. Usar en Código

```typescript
import marciaclaw from './marciaclaw';

// Cargar plugins habitilitados
marciaclaw.loadPlugins();

// Usar plugin GitHub
await marciaclaw.plugins.github.push({ ... });

// Usar plugin Backup
await marciaclaw.plugins.backup.backup({ ... });
```

---

## 📊 Progreso de Implementación

```
[████████████] 100% - Plugins Core

✅ GitHub Plugin               - 100%
✅ Backup Plugin               - 100%
✅ Analytics Plugin            - 100%
✅ Notification Plugin         - 100%
```

---

## 🔄 Flujos de Trabajo

### Flujo de Git Automatizado

```
1. Cambio en código detectado
   ↓
2. GitHub Plugin: Commit
   ↓
3. GitHub Plugin: Push
   ↓
4. Backup Plugin: Respaldo
   ↓
5. Notification Plugin: Alerta
```

### Flujo de Backup Automatizado

```
1. Cron: 00:00
   ↓
2. Backup Plugin: Iniciar
   ↓
3. Backup: Base de datos
   ↓
4. Backup: Archivos
   ↓
5. Backup: Memoria
   ↓
6. GitHub Plugin: Push backup
   ↓
7. Notification Plugin: Confirmación
```

---

## 🎯 Próximos Plugins

- [ ] `security` - Escaneo de vulnerabilidades
- [ ] `audit` - Auditoría de cambios
- [ ] `testing` - Ejecución de tests automáticos
- [ ] `deployment` - Despliegue automatizado
- [ ] `monitoring` - Monitoreo y alertas en tiempo real

---

## 📚 Recursos

- **Documentación de Plugins:** Cada `README.md` dentro de cada directorio
- **Integraciones:** `../integrations/`
- **Configuración:** `../config/`
- **Scripts:** `../scripts/`

---

## 🛡️ Seguridad

- Los plugins se ejecutan en sandbox cuando es posible
- Los tokens se cargan de variables de entorno
- Los backups están cifrados por defecto
- Notificaciones sensibles solo a canales autorizados

---

*Plugins de OpenClaw - MarciaClaw v1.0.0*
*Última actualización: 2026-03-24*