#!/bin/bash
echo "🔍 SOC LAB - TESTE"
echo "================="
echo "Data: $(date)"
echo ""

echo "📦 CONTAINERS:"
docker ps --format "• {{.Names}} ({{.Status}})" | grep -E "zabbix|wazuh|log"

echo ""
echo "🌐 PORTAS:"
for port in 8080 55000; do
    status=$(nc -z localhost $port 2>/dev/null && echo "✅" || echo "❌")
    echo "Porta $port: $status"
done

echo ""
echo "✅ FIM DO TESTE"

//teste
