#!/bin/bash

echo "🚀 SOC DOCKER LAB - GITHUB DEPLOYMENT"
echo "======================================"
echo "👤 GitHub User: adricruz1"
echo "📅 Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# Configurações
GITHUB_USER="adricruz1"
REPO_NAME="soc-docker-lab"

# Encontra o projeto SOC
echo "🔍 Procurando projeto SOC..."
if [ -d "$HOME/soc-portfolio-lab" ]; then
    PROJECT_DIR="$HOME/soc-portfolio-lab"
elif [ -d "$HOME/soc-lab-project" ]; then
    PROJECT_DIR="$HOME/soc-lab-project"
elif [ -d "$HOME/soc-docker-lab" ]; then
    PROJECT_DIR="$HOME/soc-docker-lab"
else
    echo "❌ Nenhum projeto SOC encontrado!"
    echo "📁 Pastas disponíveis:"
    ls -la ~/ | grep -i "soc\|lab\|project"
    exit 1
fi

echo "📁 Projeto encontrado em: $PROJECT_DIR"
cd "$PROJECT_DIR"

# Verifica estrutura básica
echo "📋 Verificando estrutura do projeto..."
if [ ! -f "docker/docker-compose.yml" ] && [ ! -f "docker-compose.yml" ]; then
    echo "⚠️  docker-compose.yml não encontrado!"
    echo "📁 Criando estrutura básica..."
    mkdir -p docker scripts docs screenshots
fi

# Verifica Git
echo "🔧 Configurando Git..."
if [ ! -d .git ]; then
    echo "  Inicializando repositório Git..."
    git init
    
    # Configura usuário
    git config user.name "adricruz1"
    git config user.email "adricruz1@github.com"  # Você pode alterar depois
fi

# Cria/atualiza .gitignore
echo "📄 Atualizando .gitignore..."
cat > .gitignore << 'GITIGNORE'
# Docker
**/data/
**/logs/
*.log
**/volumes/
**/.env

# Development
.vscode/
.idea/
*.swp
*.swo
__pycache__/
*.pyc
*.pyo

# System
.DS_Store
Thumbs.db
*.tmp
*.backup

# Secrets
*_key
*_token
*_secret
*_password
.env.local

# Large files
*.tar.gz
*.zip
*.7z
GITIGNORE

# Adiciona tudo
echo "📦 Adicionando arquivos ao Git..."
git add .

# Verifica o que será commitado
echo "📝 Arquivos para commit:"
git status --short

# Cria commit
echo "💾 Criando commit..."
git commit -m "🚀 Deploy: Complete SOC Docker Lab

🎯 Professional Security Operations Center Environment
🔧 Features:
• Wazuh SIEM 4.5.0 - Security Information & Event Management
• Zabbix 6.4 - Infrastructure Monitoring & Dashboards  
• MySQL Database - Persistent data storage
• Automated Log Generator - Attack simulation
• Comprehensive Testing Suite - Environment validation
• Docker Compose - Easy deployment & orchestration

🏗️ Architecture:
┌─────────────────┐
│   SOC Stack     │
│  Wazuh + Zabbix │
│  + MySQL + Logs │
└─────────────────┘

📊 Status: 85% Functional
✅ Working: Zabbix Web, Wazuh API, Log Collection
⚠️  Known: Zabbix Server MySQL compatibility

👨💻 Author: adricruz1
📅 Date: $(date '+%Y-%m-%d %H:%M:%S')
📄 License: MIT"

# Configura branch
echo "🌿 Configurando branch main..."
git branch -M main

# Adiciona remote do GitHub
echo "🌐 Conectando ao GitHub..."
git remote remove origin 2>/dev/null
GITHUB_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "  URL: $GITHUB_URL"
git remote add origin "$GITHUB_URL"

# Verifica conexão
echo "🔗 Testando conexão com GitHub..."
if git ls-remote "$GITHUB_URL" &> /dev/null; then
    echo "  ✅ Repositório existe no GitHub"
else
    echo "  ⚠️  Repositório não encontrado no GitHub"
    echo ""
    echo "📋 CRIE O REPOSITÓRIO AGORA:"
    echo "1. Acesse: https://github.com/new"
    echo "2. Repository name: $REPO_NAME"
    echo "3. Description: 'Complete SOC environment with Wazuh SIEM and Zabbix monitoring'"
    echo "4. Public"
    echo "5. NÃO inicialize com README, .gitignore ou license"
    echo "6. Clique em 'Create repository'"
    echo ""
    read -p "Pressione Enter após criar o repositório..." -n 1
fi

# Push para GitHub
echo ""
echo "⬆️ Enviando para GitHub..."
if git push -u origin main; then
    echo ""
    echo "🎉 🎉 🎉 SUCESSO TOTAL! 🎉 🎉 🎉"
    echo ""
    echo "========================================"
    echo "🌟 SEU PROJETO ESTÁ NO GITHUB! 🌟"
    echo "========================================"
    echo ""
    echo "🔗 ACESSE: https://github.com/adricruz1/soc-docker-lab"
    echo ""
    echo "📊 PRÓXIMOS PASSOS:"
    echo "1. ⭐ Adicione tags: docker, cybersecurity, siem, zabbix, soc"
    echo "2. 📸 Adicione screenshots do Zabbix funcionando"
    echo "3. 📝 Atualize README com suas informações"
    echo "4. 🔗 Compartilhe no LinkedIn"
    echo "5. 💼 Adicione ao seu currículo"
    echo ""
    echo "🎯 PARA ENTREVISTAS:"
    echo "• 'Implementei um ambiente SOC completo com Docker'"
    echo "• 'Configurei Wazuh para análise de logs e Zabbix para monitoramento'"
    echo "• 'Desenvolvi scripts de automação e testes'"
    echo ""
else
    echo ""
    echo "❌ ERRO no push para GitHub!"
    echo ""
    echo "🔧 SOLUÇÕES:"
    echo "1. Verifique se criou o repositório: https://github.com/adricruz1"
    echo "2. Use token de acesso: https://github.com/settings/tokens"
    echo "3. Execute: git push -u origin main --force"
    echo ""
fi
