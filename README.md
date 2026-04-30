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


## Atividade 2.3: Seleção de Servidor Web

### Escolha: Nginx

**Justificativa:**
Para o cenário da ScreenMatch (alto tráfego e conteúdo estático), acredito que o **Nginx** seja a escolha mais adequada pelos seguintes motivos:
* **Arquitetura Event-Driven**: Diferente do Apache, o Nginx não cria um novo processo para cada conexão, permitindo suportar milhares de usuários simultâneos com baixo consumo de memória.
* **Performance de Arquivos Estáticos**: O Nginx é amplamente reconhecido por ser significativamente mais rápido que o Apache ao servir HTML, imagens e vídeos estáticos.
* **Escalabilidade**: Sua capacidade de atuar como balanceador de carga facilita o crescimento futuro da plataforma ScreenMatch.
