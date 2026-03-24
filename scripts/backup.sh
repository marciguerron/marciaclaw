#!/bin/bash

# 💾 Script de Respaldo - MarciaClaw
# Este script crea un respaldo de memoria y configuraciones

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}💾 Creando respaldo...${NC}"

# Configuración
BACKUP_DIR="backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="marciaclaw_backup_$DATE"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Crear directorio de respaldos si no existe
mkdir -p "$BACKUP_PATH"

echo -e "${YELLOW}📦 Empaquetando archivos...${NC}"

# Empaquetar directorios importantes
tar -czf "$BACKUP_PATH/memory.tar.gz" memory/
tar -czf "$BACKUP_PATH/config.tar.gz" config/
tar -czf "$BACKUP_PATH/docs.tar.gz" docs/

# Copiar archivos importantes
cp .env.example "$BACKUP_PATH/" 2>/dev/null || true
cp package.json "$BACKUP_PATH/" 2>/dev/null || true
cp README.md "$BACKUP_PATH/" 2>/dev/null || true

# Crear archivo de metadatos
cat > "$BACKUP_PATH/info.json" << EOF
{
  "date": "$DATE",
  "version": "1.0.0",
  "directories_backed_up": ["memory", "config", "docs"]
}
EOF

# Crear archivo de suma de verificación
cd "$BACKUP_PATH"
echo "$(date +%s)" > .timestamp
cd ../..

echo -e "${GREEN}📁 Respaldo creado: $BACKUP_PATH${NC}"

# Listar contenido
echo ""
echo -e "${YELLOW}📋 Contenido del respaldo:${NC}"
ls -lh "$BACKUP_PATH"

# Preguntar si desea eliminar respaldos antiguos
echo ""
read -p "¿Deseas eliminar respaldos anteriores a 7 días? (s/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${GREEN}🧹 Eliminando respaldos antiguos...${NC}"
    find "$BACKUP_DIR" -name "marciaclaw_backup_*" -mtime +7 -exec rm -rf {} \;
    success "Respaldo completado!"
fi

echo ""
echo -e "${GREEN}✅ Respaldo creado exitosamente!${NC}"
echo "Ubicación: $BACKUP_PATH"