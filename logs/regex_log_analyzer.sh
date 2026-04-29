#!/usr/bin/env bash

# ==============================================================================
# NOME: regex_log_analyzer.sh
# DESCRIÇÃO: Analisa logs do Apache e gera relatórios de segurança e tráfego.
# AUTOR: [Seu Nome Aqui]
# USO: ./logs/regex_log_analyzer.sh logs/apache.log
# HISTÓRICO: 2026-04-29: v1.0 - Criação do script inicial.
# ==============================================================================

# --- VARIABLES ---
LOG_FILE=$1
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_DIR="log_analysis_${TIMESTAMP}"
REPORT_FILE="${OUTPUT_DIR}/report.txt"

# --- FUNCTIONS ---
log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - [INFO] - $1"
}

check_errors() {
    if [ $? -ne 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - [ERRO] - Falha em: $1"
        exit 1
    fi
}

# --- CODE ---
# Validação do arquivo de entrada
if [[ -z "$LOG_FILE" || ! -f "$LOG_FILE" ]]; then
    echo "Erro: Forneça um arquivo de log válido."
    exit 1
fi

# Criando o diretório de saída obrigatório
mkdir -p "$OUTPUT_DIR"
log_info "Iniciando análise. Resultados em: $OUTPUT_DIR"

# 1. Lista de IPs únicos
awk '{print $1}' "$LOG_FILE" | sort -u > "${OUTPUT_DIR}/1_unique_ips.txt"
check_errors "Extração de IPs únicos"

# 2. Métodos HTTP e quantidade
awk '{print $6}' "$LOG_FILE" | tr -d '"' | sort | uniq -c > "${OUTPUT_DIR}/2_http_methods.txt"

# 3. Métodos perigosos (DELETE e PUT)
grep -E "\"DELETE|\"PUT" "$LOG_FILE" > "${OUTPUT_DIR}/3_dangerous_methods.txt"

# 4. URLs requisitadas e contagem
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr > "${OUTPUT_DIR}/4_urls.txt"

# 5. IPs que mais fizeram requisições (top 10)
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10 > "${OUTPUT_DIR}/5_top_ips.txt"

# Geração do relatório consolidado
{
    echo "=== RELATÓRIO DE ANÁLISE DE LOG ==="
    echo "Gerado em: $(date)"
    echo "Arquivo fonte: $LOG_FILE"
    echo "-----------------------------------"
    echo "Total de IPs únicos: $(wc -l < "${OUTPUT_DIR}/1_unique_ips.txt")"
    echo "Total de Métodos Perigosos: $(wc -l < "${OUTPUT_DIR}/3_dangerous_methods.txt")"
    echo "-----------------------------------"
    echo "Top 5 IPs com maior atividade:"
    head -n 5 "${OUTPUT_DIR}/5_top_ips.txt"
} > "$REPORT_FILE"

# --- END ---
log_info "Análise finalizada com sucesso!"
exit 0
