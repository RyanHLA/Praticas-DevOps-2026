# Práticas DevOps 2026 - Laboratório de Programação

**Aluno:** Ryan Haiala  
**Disciplina:** Laboratório de programação para operação de infraestrutura de redes de computadores  
**Professor:** Eder Pereira dos Santos

## Descrição do Projeto
Este repositório contém as atividades práticas de automação, monitoramento e provisionamento de infraestrutura.

## Atividade 2.1: Analisador de Logs
Script Bash que automatiza a análise de logs do Apache no formato CLF, extraindo IPs únicos, métodos HTTP e detectando acessos suspeitos.

### Como executar:
1. Garanta que o script tenha permissão de execução: `chmod +x logs/regex_log_analyzer.sh`
2. Execute passando o arquivo de log: `./logs/regex_log_analyzer.sh logs/apache.log`
