# 🧠 AI MASTER CONTEXT & CREDENCIALES
## Documento Confidencial de Arquitectura Cero-Errores para Claude Code y OpenClaw

> **Instrucción para LLMs (Claude Code / OpenClaw):** Si estás leyendo este archivo, utilízalo como tu fuente de la verdad para acceder a repositorios, reiniciar servicios, o cambiar variables de entorno sin preguntar al usuario por llaves. Actúa siempre como un agente autónomo "Usuario Final - Sin Errores".
>
> ⚠️ **NOTA:** Las credenciales reales están en `/data/workspace/AI_MASTER_CONTEXT.md` (archivo local, NO commiteable).

---

## 🏗 Arquitectura del Ecosistema IA

El servidor principal (VPS Dokploy: `212.227.87.137`) ejecuta dos sistemas de Inteligencia Artificial paralelos e inquebrantables:

### 1. OPENCLAW (Interfaz Web)

| Componente | Detalle |
|------------|---------|
| **Ruta de Configuración** | `/data/.openclaw/` (Volumen Docker `code_openclaw-data`) |
| **Archivos Clave** | `openclaw.json` (Motor de Fallbacks), `auth-profiles.json` (API Keys blindadas) |
| **Puerto** | 8080 (web interface) |

#### Cascada de Modelos (Primary → Fallbacks)

| Prioridad | Modelo | Propósito |
|-----------|--------|-----------|
| 1 | `ollama/bjoernb/claude-opus-4-5` | **Modelo Primario** / Terminal Ollama |
| 2 | `ollama/minimax-m2.7:cloud` | Fallback Cloud |
| 3 | `nvidia/minimaxai/minimax-m2.1` | Soporte Multimodal / Vision |
| 4 | `nvidia/z-ai/glm4.7` | Pensamiento Profundo (`enable_thinking: true`) |
| 5 | `nvidia/qwen/qwen3.5-122b-a10b` | Respaldo Robusto |
| 6 | `groq/moonshotai/kimi-k2-instruct-0905` | Respaldo Rápido |

### 2. CLAUDE DEV BOX (Terminal Aislada & Bot de Telegram)

| Componente | Detalle |
|------------|---------|
| **Contenedor Docker** | `claude-devbox` (Node 20, Bun, Python3, Git, Tmux) |
| **Proxy Lógico** | LiteLLM en puerto 4000 (`http://127.0.0.1:4000`) |
| **Propósito** | Traduce peticiones Anthropic hacia NVIDIA/Groq (sin cobros) |
| **Bot de Telegram** | Script `/root/tg_claude_code.py` (background con nohup) |
| **Token Telegram** | `TELEGRAM_BOT_TOKEN` (ver `.env.local`) |
| **Directorio de Trabajo** | `/workspace/` (compartido) |

---

## 🔑 Bóveda de Credenciales y APIs (CONFIDENCIAL)

### GitHub (Control de Versiones y Despliegues)

| Campo | Valor |
|-------|-------|
| **URL Base** | `https://github.com/marciguerron/` |
| **Usuario** | `marciguerron` |
| **PAT** | `GITHUB_PAT` (ver `.env.local` o `/data/workspace/AI_MASTER_CONTEXT.md`) |

> **Comando git recomendado para IAs:**
> ```bash
> git clone https://marciguerron:${GITHUB_PAT}@github.com/marciguerron/<repo>.git
> ```

### Servidor Dokploy / SSH

| Campo | Valor |
|-------|-------|
| **IP** | `212.227.87.137` |
| **Usuario** | `root` |
| **Contraseña** | `SSH_PASSWORD` (ver `/data/workspace/AI_MASTER_CONTEXT.md`) |

### Proveedores de Modelos (APIs)

| Proveedor | Variable de Entorno | Ubicación |
|-----------|---------------------|-----------|
| **NVIDIA** | `NVIDIA_API_KEY` | `.env.local` |
| **GROQ** | `GROQ_API_KEY` | `.env.local` |
| **OPENROUTER** | `OPENROUTER_API_KEY` | `.env.local` |

### Repositorios Clave

| Repositorio | URL | Propósito |
|-------------|-----|-----------|
| **marciaclaw** | `https://github.com/marciguerron/marciaclaw` | Sistema de Asistente IA Personal |

---

## 🛠 Comandos Operativos Estándar (SOP)

Si se pide actualizar, reparar o gestionar los entornos, usar estos comandos directamente:

### Reiniciar Web OpenClaw
```bash
docker restart code-openclaw-1
```

### Reiniciar Bot de Telegram
```bash
docker exec claude-devbox pkill -f tg_claude_code.py
docker exec -d claude-devbox bash -c "nohup /opt/litellm_venv/bin/python3 /root/tg_claude_code.py > /root/tg_claude.log 2>&1 &"
```

### Conectarse Manualmente a Claude Code
```bash
docker exec -it claude-devbox tmux new-session -A -s claude_code_session claude
```

### Clonar Repositorio (con credenciales)
```bash
git clone https://marciguerron:${GITHUB_PAT}@github.com/marciguerron/marciaclaw.git
```

---

## 📁 Estructura de Archivos del Sistema

```
/data/.openclaw/
├── openclaw.json          # Motor de fallbacks de modelos
├── auth-profiles.json     # API Keys blindadas
└── code_openclaw-data/    # Volumen Docker

/workspace/
├── marciaclaw/            # Sistema de asistente IA
└── [otros proyectos]

/root/
├── tg_claude_code.py      # Bot de Telegram
└── tg_claude.log          # Logs del bot
```

---

## ⚡ Reglas de Operación Autónoma

1. **Sin Errores:** Actúa como agente autónomo, no preguntes credenciales
2. **Auto-Recuperación:** Usa la cascada de modelos si uno falla
3. **Memoria Persistente:** Actualiza `/data/workspace/MEMORY.md` después de decisiones importantes
4. **Documentación:** Mantén este archivo actualizado
5. **Seguridad:** Nunca expongas credenciales en logs o respuestas (usa variables de entorno)

---

## ⚠️ Instrucciones de Seguridad Críticas

- **NUNCA** commitees credenciales reales a GitHub
- **USA** variables de entorno (`.env.local`) para todas las API keys
- **CONSULTA** `/data/workspace/AI_MASTER_CONTEXT.md` para credenciales completas (archivo local, no sincronizado)
- **REVISA** el archivo `.env.example` para el formato de configuración

---

*Documento de Memoria Estructural*
*Última actualización: 2026-03-24*
*Transformando caos en código robusto y sin errores.*