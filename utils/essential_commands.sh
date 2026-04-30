#!/usr/bin/env bash

# ==============================================================================
# NOME: essential_commands.sh
# DESCRIÇÃO: Guia interativo de comandos essenciais para DevOps (grep, curl, etc).
# AUTOR: Ryan Haiala
# USO: ./utils/essential_commands.sh
# HISTÓRICO: 2026-04-29: v1.0 - Implementação inicial conforme Atividade 1.1.
# ==============================================================================

# --- VARIABLES ---
LOG_FILE="logs/essential_commands.log"
USER_NAME="Ryan Haiala"

# --- FUNCTIONS ---
log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - [INFO] - $1" | tee -a "$LOG_FILE"
}

# Função para exibir a documentação e demonstração de cada comando
explain_cmd() {
    local cmd=$1
    local desc=$2
    local example=$3
    local demo=$4

    echo "------------------------------------------------------------"
    echo "COMANDO: $cmd"
    echo "DESCRIÇÃO: $desc"
    echo "COMO ACESSAR HELP: $cmd --help ou man $cmd"
    echo "EXEMPLO DE USO: $example"
    echo "DEMONSTRAÇÃO PRÁTICA NO SISTEMA:"
    eval "$demo"
    echo "------------------------------------------------------------"
    echo ""
    log_info "Demonstração do comando $cmd concluída."
}

# --- CODE ---
log_info "Iniciando guia de comandos essenciais por $USER_NAME."

# Lista de comandos conforme Atividade 1.1

explain_cmd "pwd" "Exibe o diretório atual." "pwd" "pwd"

explain_cmd "date" "Exibe a data e hora do sistema." "date '+%d/%m/%Y'" "date"

explain_cmd "touch" "Cria um arquivo vazio ou atualiza a data de modificação." "touch arquivo.txt" "touch test_cmd.txt && ls test_cmd.txt"

explain_cmd "cat" "Concatena e exibe o conteúdo de arquivos." "cat /etc/hostname" "echo 'DevOps 2026' > temp.txt && cat temp.txt"

explain_cmd "grep" "Busca padrões de texto em arquivos ou strings." "grep 'erro' logs.txt" "echo -e 'sucesso\nerro\nalerta' | grep 'erro'"

explain_cmd "curl" "Transfere dados de ou para um servidor via URLs." "curl http://google.com" "curl -I https://www.google.com | head -n 1"

explain_cmd "chmod" "Altera as permissões de acesso de arquivos/diretórios." "chmod 755 script.sh" "ls -l temp.txt"

explain_cmd "gzip" "Comprime ou expande arquivos (.gz)." "gzip arquivo.txt" "gzip -v temp.txt && ls temp.txt.gz"

explain_cmd "ps" "Informa o status dos processos atuais." "ps aux" "ps | head -n 5"

explain_cmd "pgrep" "Lista processos baseados no nome." "pgrep bash" "pgrep -l bash"

explain_cmd "df" "Exibe o uso de espaço em disco do sistema de arquivos." "df -h" "df -h ."

explain_cmd "du" "Estima o uso de espaço de arquivos e diretórios." "du -sh /var/log" "du -sh logs/"

# Limpeza de arquivos de demonstração
rm -f test_cmd.txt temp.txt.gz

# --- END ---
log_info "Guia de comandos finalizado com sucesso."
exit 0
