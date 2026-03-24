# Notification Plugin - MarciaClaw

Plugin para envío de alertas y notificaciones.

---

## Capacidades

- ✅ Notificaciones Telegram
- ✅ Email alerts
- ✅ Push notifications
- ✅ Webhooks
- ✅ Programación de alertas

---

## Configuración

```yaml
notification:
  channels:
    - telegram
    - email
  telegram:
    bot_token: ${TELEGRAM_BOT_TOKEN}
    chat_id: ${TELEGRAM_CHAT_ID}
  email:
    smtp_server: smtp.gmail.com
    smtp_port: 587
    from: alerts@marciaclaw.com
```

---

## Uso

```typescript
import { notificationPlugin } from './plugins/notification';

// Enviar notificación
await notificationPlugin.send({
  channel: 'telegram',
  message: '✅ Backup completado',
  priority: 'high'
});

// Email
await notificationPlugin.sendEmail({
  to: 'marcia@ejemplo.com',
  subject: 'Alerta del sistema',
  body: 'El sistema ha completado una tarea importante'
});

// Webhook
await notificationPlugin.sendWebhook({
  url: 'https://ejemplo.com/webhook',
  data: { event: 'backup_completed', status: 'success' }
});
```

---

## Estado

✅ **Completado**