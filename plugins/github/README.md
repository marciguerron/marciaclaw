# GitHub Plugin - MarciaClaw

Plugin para sincronización automatizada con GitHub.

---

## Capacidades

- ✅ Commit automático
- ✅ Push a repositorio
- ✅ Pull requests
- ✅ Branch management
- ✅ Release tags

---

## Configuración

```yaml
github:
  token: ${GITHUB_TOKEN}
  owner: marciguerron
  repo: marciaclaw
  branch: main
  auto_commit: true
  commit_prefix: "chore:"
  push_after_commit: true
```

---

## Uso

```typescript
import { githubPlugin } from './plugins/github';

// Commit y push simple
await githubPlugin.push({
  message: 'feat: Nueva funcionalidad',
  files: ['src/nuevo-archivo.ts']
});

// Pull request
await githubPlugin.createPullRequest({
  title: 'Nueva funcionalidad',
  source: 'feature/nuevo',
  target: 'main'
});

// Release
await githubPlugin.createRelease({
  tag: 'v1.0.0',
  name: 'Versión 1.0.0',
  description: 'Primera release oficial'
});
```

---

## Estado

✅ **Completado**