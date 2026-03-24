#!/bin/bash

# 🔄 Script de Sincronización con GitHub - MarciaClaw
# Este script hace commit y push de cambios

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🔄 Sincronizando con GitHub...${NC}"

# Verificar que estamos en el directorio del proyecto
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: No estás en el directorio de MarciaClaw${NC}"
    exit 1
fi

# Mensaje de commit (argumento o automático)
if [ -z "$1" ]; then
    MESSAGE=$(date +"%Y-%m-%d %H:%M")
else
    MESSAGE="$1"
fi

echo -e "${YELLOW}📝 Mensaje: $MESSAGE${NC}"

# Verificar cambios
CHANGES=$(git status --porcelain)
if [ -z "$CHANGES" ]; then
    echo -e "${YELLOW}⚠️  No hay cambios para sincronizar${NC}"
    exit 0
fi

echo -e "${GREEN}📂 Archivos modificados:${NC}"
git status --short

echo ""
read -p "¿Deseas continuar con la sincronización? (s/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${YELLOW}Sincronización cancelada${NC}"
    exit 0
fi

# Añadir cambios
echo -e "${GREEN}➕ Añadiendo archivos...${NC}"
git add -A

# Commit
echo -e "${GREEN}📝 Haciendo commit...${NC}"
git commit -m "$MESSAGE"

# Push
echo -e "${GREEN}🚀 Haciendo push...${NC}"
git push origin main

echo ""
echo -e "${GREEN}✅ Sincronización completada!${NC}"