#!/bin/bash

echo "🔍 Cricket Trading Platform - File Validation"
echo "=============================================="
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0

# Check Node.js
echo "📦 Checking Node.js installation..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✓${NC} Node.js installed: $NODE_VERSION"
else
    echo -e "${RED}✗${NC} Node.js not found. Install from https://nodejs.org/"
    ERRORS=$((ERRORS+1))
fi

# Check npm
echo "📦 Checking npm installation..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo -e "${GREEN}✓${NC} npm installed: $NPM_VERSION"
else
    echo -e "${RED}✗${NC} npm not found"
    ERRORS=$((ERRORS+1))
fi

echo ""
echo "🔍 Checking JavaScript files for syntax errors..."

# Check all JS files
JS_FILES=(
    "server.js"
    "frontend-server.js"
    "config/database.js"
    "middleware/auth.js"
    "routes/auth.js"
    "routes/bets.js"
    "routes/wallet.js"
    "routes/admin.js"
    "routes/matches.js"
    "services/cricketData.js"
)

for file in "${JS_FILES[@]}"; do
    if [ -f "$file" ]; then
        if node -c "$file" 2>/dev/null; then
            echo -e "${GREEN}✓${NC} $file"
        else
            echo -e "${RED}✗${NC} $file - Syntax error!"
            ERRORS=$((ERRORS+1))
        fi
    else
        echo -e "${RED}✗${NC} $file - File missing!"
        ERRORS=$((ERRORS+1))
    fi
done

echo ""
echo "🔍 Checking required files..."

REQUIRED_FILES=(
    ".env"
    "package.json"
    "schema.sql"
    "public/index.html"
    "public/admin.html"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${RED}✗${NC} $file - Missing!"
        ERRORS=$((ERRORS+1))
    fi
done

echo ""
echo "🔍 Checking package.json configuration..."

if [ -f "package.json" ]; then
    if grep -q "express" package.json; then
        echo -e "${GREEN}✓${NC} Express dependency found"
    else
        echo -e "${RED}✗${NC} Express dependency missing"
        ERRORS=$((ERRORS+1))
    fi
    
    if grep -q "\"start\":" package.json; then
        echo -e "${GREEN}✓${NC} Start script configured"
    else
        echo -e "${RED}✗${NC} Start script missing"
        ERRORS=$((ERRORS+1))
    fi
fi

echo ""
echo "🔍 Checking environment configuration..."

if [ -f ".env" ]; then
    if grep -q "DATABASE_URL" .env; then
        echo -e "${GREEN}✓${NC} DATABASE_URL configured"
    else
        echo -e "${RED}✗${NC} DATABASE_URL missing in .env"
        ERRORS=$((ERRORS+1))
    fi
    
    if grep -q "JWT_SECRET" .env; then
        echo -e "${GREEN}✓${NC} JWT_SECRET configured"
    else
        echo -e "${YELLOW}⚠${NC} JWT_SECRET missing (will use default)"
    fi
fi

echo ""
echo "=============================================="

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! No errors found.${NC}"
    echo ""
    echo "🚀 Ready to start:"
    echo "   1. npm install"
    echo "   2. npm start"
    echo "   3. npm run frontend (in new terminal)"
    echo ""
    exit 0
else
    echo -e "${RED}❌ Found $ERRORS error(s). Please fix before running.${NC}"
    echo ""
    exit 1
fi
