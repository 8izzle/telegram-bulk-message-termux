# Bulk Telegram Message Sender for Termux

This script sends a bulk message to multiple Telegram users using a bot. It iterates over a list of user IDs stored in a `users.txt` file and sends a specified message to each user.

## Prerequisites

- A Telegram bot token. You can get one by creating a bot through [BotFather](https://core.telegram.org/bots#botfather).
- A list of user IDs saved in a file named `users.txt`, with each ID on a new line.
- Termux app installed on your Android device.

## Installation

1. **Install Termux**:
   Download and install Termux from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).

2. **Install required packages**:
   Open Termux and install `curl` if it's not already installed:
   ```sh
   pkg update && pkg upgrade
   pkg install curl
   ```

## Usage

1. **Prepare your environment**:
    - Make sure you have `curl` installed (as per the above installation step).
    - Create a file named `users.txt` in the same directory as the script. Add the Telegram user IDs, one per line.

2. **Configure the script**:
    - Open the script file and replace `YOUR BOT TOKEN HERE` with your actual Telegram bot token.
    - Replace `test bulk message` with the message you want to send.

3. **Run the script**:
    - Open Termux and navigate to the directory containing the script:
      ```sh
      cd /path/to/your/script
      ```
    - Make the script executable (if it’s not already):
      ```sh
      chmod +x bulk_message_sender.sh
      ```
    - Execute the script:
      ```sh
      ./bulk_message_sender.sh
      ```

## Script

```bash
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
```

## Notes

- **Rate Limiting**: The script includes a `sleep 1` command to add a delay of 1 second between each message to avoid hitting Telegram's rate limits.
- **Error Handling**: Currently, the script does not include error handling. If you need more robust error handling, you might consider adding checks for the HTTP response status and logging errors appropriately.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## Contact

If you have any questions or need further assistance, please open an issue in the repository or contact the maintainer.
