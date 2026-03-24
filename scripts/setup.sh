#!/bin/bash

# 🎯 Script de Configuración Inicial - MarciaClaw
# Este script configura el entorno de desarrollo

set -e  # Detener en error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   🚀 MarciaClaw Setup Script${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Función para mostrar progreso
step() {
    echo -e "${YELLOW}➜ $1${NC}"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
}

# 1. Verificar Node.js
step "Verificando Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    success "Node.js instalado: $NODE_VERSION"
else
    error "Node.js no encontrado. Por favor instala Node.js v18+"
    exit 1
fi

# 2. Verificar npm
step "Verificando npm..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    success "npm instalado: $NPM_VERSION"
else
    error "npm no encontrado"
    exit 1
fi

# 3. Instalar dependencias
step "Instalando dependencias de npm..."
npm install
success "Dependencias instaladas"

# 4. Verificar/crear estructura de directorios
step "Verificando estructura de directorios..."
mkdir -p docs config scripts integrations/{youtube,supabase,perplexity,browser,openclaw} services memory templates utils
success "Estructura de directorios verificada"

# 5. Copiar .env.example si no existe
step "Verificando configuración de entorno..."
if [ ! -f .env.local ]; then
    cp .env.example .env.local
    success "Archivo .env.local creado"
    echo -e "${YELLOW}⚠️  Por favor edita .env.local con tus API keys${NC}"
else
    success "Archivo .env.local ya existe"
fi

# 6. Verificar conexión con APIs
step "Verificando configuración de APIs..."

# Verificar YouTube API (opcional)
if [ -n "$YOUTUBE_API_KEY" ]; then
    if curl -s "https://www.googleapis.com/youtube/v3/channels?part=snippet&forHandle=@Google&key=$YOUTUBE_API_KEY" | grep -q "error"; then
        error "YouTube API key inválida"
    else
        success "YouTube API configurada"
    fi
else
    echo -e "${YELLOW}⚠️  YouTube API key no configurada${NC}"
fi

# Verificar Supabase (opcional)
if [ -n "$SUPABASE_URL" ]; then
    if curl -s -o /dev/null -w "%{http_code}" -H "apikey: $SUPABASE_KEY" "$SUPABASE_URL/rest/v1/?limit=1" | grep -q "200"; then
        success "Supabase conectado"
    else
        error "Supabase no conectado"
    fi
else
    echo -e "${YELLOW}⚠️  Supabase no configurado${NC}"
fi

# 7. Compilar TypeScript
step "Compilando TypeScript..."
npx tsc --noEmit
success "TypeScript sin errores"

# 8. Inicializar Git submodules si los hay
if [ -f .gitmodules ]; then
    step "Inicializando submódulos de Git..."
    git submodule update --init --recursive
    success "Submódulos inicializados"
fi

# 9. Crear alias útiles (opcional)
step "Creando alias de shell..."
ALIAS_FILE="$HOME/.marciaclaw_aliases"
if [ ! -f "$ALIAS_FILE" ]; then
    cat > "$ALIAS_FILE" << 'EOF'
# Alias para MarciaClaw
alias mc-research='npm run research'
alias mc-sync='npm run sync'
alias mc-backup='npm run backup'
alias mc-memory='npm run memory'
alias mc-status='npm run status'
EOF
    success "Alias creados en $ALIAS_FILE"
    echo -e "${YELLOW}Agrega 'source $ALIAS_FILE' a tu ~/.bashrc o ~/.zshrc${NC}"
else
    success "Alias ya existen"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   🎉 Configuración completada!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Próximos pasos:"
echo "1. Edita .env.local con tus API keys"
echo "2. Ejecuta: source $ALIAS_FILE"
echo "3. ¡Listo para usar!"
echo ""
echo "Comandos útiles:"
echo "  mc-research  - Ejecutar investigación de YouTube"
echo "  mc-sync      - Sincronizar con GitHub"
echo "  mc-backup    - Crear respaldo"
echo "  mc-memory    - Gestionar memoria"