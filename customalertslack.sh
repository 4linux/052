#!/bin/bash

# Parâmetros enviados pelo Zabbix Server
ALERT_SUBJECT="$1"          # Assunto do alerta
ALERT_MESSAGE="$2"          # Mensagem do alerta
ALERT_SEVERITY="$3"         # Severidade do alerta (informação, aviso, média, alta)
ALERT_HOST="$4"             # Nome do host que gerou o alerta
ALERT_EVENT_ID="$5"         # ID do evento

# Webhook do Slack
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/xxxxxxxxxxxxxxxx"

# Definindo cores e emojis de acordo com a severidade do alerta
case "$ALERT_SEVERITY" in
    "Not classified")
        COLOR="#439FE0"  # Azul
        EMOJI=":information_source:"
        ;;
    "Information")
        COLOR="#439FE0"  # Azul
        EMOJI=":information_source:"
        ;;
    "Warning")
        COLOR="#FFA500"  # Laranja
        EMOJI=":warning:"
        ;;
    "Average")
        COLOR="#FFC107"  # Amarelo
        EMOJI=":exclamation:"
        ;;
    "High")
        COLOR="#FF0000"  # Vermelho
        EMOJI=":fire:"
        ;;
    "Disaster")
        COLOR="#8B0000"  # Vermelho escuro
        EMOJI=":rotating_light:"
        ;;
    *)
        COLOR="#000000"  # Padrão: preto
        EMOJI=""
        ;;
esac

# Construindo a mensagem formatada para o Slack
SLACK_MESSAGE="*Alerta do Zabbix:* $EMOJI\n\n*Host:* $ALERT_HOST\n*Assunto:* $ALERT_SUBJECT\n*Mensagem:* $ALERT_MESSAGE\n*Severidade:* $ALERT_SEVERITY"      

# Logs de depuração
echo "Debug: Enviando alerta ao Slack"
echo "Debug: ALERT_SUBJECT=$ALERT_SUBJECT"
echo "Debug: ALERT_MESSAGE=$ALERT_MESSAGE"
echo "Debug: ALERT_SEVERITY=$ALERT_SEVERITY"
echo "Debug: ALERT_HOST=$ALERT_HOST"
echo "Debug: ALERT_EVENT_ID=$ALERT_EVENT_ID"

# Enviando o alerta para o Slack via webhook
curl -X POST -H "Content-type: application/json" --data "{\"attachments\":[{\"color\":\"$COLOR\",\"text\":\"$SLACK_MESSAGE\"}]}" "$SLACK_WEBHOOK_URL"