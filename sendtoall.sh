#!/bin/bash

# Replace <YourBotToken> with your actual Telegram bot token
TOKEN="YOUR BOT TOKEN HERE"

# Replace <YourMessage> with the message you want to send
MESSAGE="test bulk message"

# Iterate over the list of user IDs and send the message to each user
for USER_ID in $(cat users.txt); do
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$USER_ID&text=$MESSAGE" > /dev/null
    sleep 1  # Add a delay to avoid rate limiting
done
