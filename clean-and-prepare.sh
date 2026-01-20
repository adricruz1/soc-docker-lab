#!/bin/bash
echo "🧹 GIT CLEANUP & PROJECT PREPARATION"
echo "===================================="

# Backup das configurações Git
echo "1. 📋 Backup das configurações atuais..."
git config --global user.name > /tmp/git-name.backup 2>/dev/null
git config --global user.email > /tmp/git-email.backup 2>/dev/null
echo "   Backup salvo em /tmp/git-*.backup"

# Remove repositórios locais
echo "2. 🗑️ Removendo repositórios Git locais..."
for dir in ~/soc-* ~/projects ~/zabbix-*; do
    if [ -d "$dir/.git" ]; then
        echo "   Removendo .git de: $dir"
        rm -rf "$dir/.git"
    fi
done

# Cria novo projeto
echo "3. 🚀 Criando novo projeto limpo..."
NEW_DIR="$HOME/soc-portfolio-$(date +%Y%m%d)"
mkdir -p "$NEW_DIR"
cd "$NEW_DIR"

echo "4. 📁 Estrutura básica..."
mkdir -p {docker,scripts,docs,screenshots,examples,assets}

echo "✅ Concluído!"
echo "📁 Novo projeto em: $NEW_DIR"
echo "🔗 Configure seu GitHub e use: git init, git add ., git commit, git remote add, git push"
