#!/usr/bin/env bash

# ==============================================================================
# NOME: file_manager.sh
# DESCRIÇÃO: Script multifuncional para manipulação de arquivos em lote.
# AUTOR: Ryan Haiala
# USO: ./utils/file_manager.sh
# HISTÓRICO: 2026-04-29: v1.0 - Versão inicial com menu interativo.
# ==============================================================================

# --- VARIABLES ---
LOG_FILE="logs/file_manager.log"

# --- FUNCTIONS ---
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

show_menu() {
    clear
    echo "=== GERENCIADOR DE ARQUIVOS DEVOPS ==="
    echo "1) Renomear arquivos (adicionar prefixo)"
    echo "2) Alterar permissões (chmod)"
    echo "3) Compactar arquivos (.tar.gz)"
    echo "4) Descompactar arquivo"
    echo "5) Sair"
    echo "======================================"
    echo -n "Escolha uma opção: "
}

# --- CODE ---
while true; do
    show_menu
    read -r opcao

    case $opcao in
        1)
            echo "Digite o prefixo desejado:"
            read -r prefixo
            for file in *; do
                if [ -f "$file" ]; then
                    mv "$file" "${prefixo}_${file}"
                    log_action "Arquivo $file renomeado para ${prefixo}_${file}"
                fi
            done
            echo "Operação concluída!" ; sleep 2
            ;;
        2)
            echo "Digite o código da permissão (ex: 755):"
            read -r perm
            echo "Digite o nome do arquivo ou padrão (ex: *.sh):"
            read -r pattern
            chmod "$perm" $pattern
            log_action "Permissões de $pattern alteradas para $perm"
            echo "Permissões atualizadas!" ; sleep 2
            ;;
        3)
            echo "Nome do arquivo de saída (ex: backup.tar.gz):"
            read -r output
            echo "Arquivos para compactar (ex: *.txt):"
            read -r targets
            tar -czvf "$output" $targets
            log_action "Arquivos $targets compactados em $output"
            echo "Compactação concluída!" ; sleep 2
            ;;
        4)
            echo "Nome do arquivo para descompactar:"
            read -r target
            tar -xzvf "$target"
            log_action "Arquivo $target descompactado"
            echo "Extração concluída!" ; sleep 2
            ;;
        5)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida!" ; sleep 1
            ;;
    esac
done

# --- END ---
