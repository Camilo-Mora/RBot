#Simple demo of R pinging Discord every 50sec...if you were to run this code, after you have RBot up and running, you should get a message saying the PC5 is working. If you wer to stop the code, the bot will send you  an email saying PC5 stpped working.
library(discordr)

WebHook="" # place here between bracked the webhook from the Discord channel where R will be transmitting messages
conn_obj <- create_discord_connection(webhook_string = WebHook,  username ="User1", set_default = TRUE,channel_name ="scalper")


i=1
while (i==1) {
  send_webhook_message("pc5 is working")
  Sys.sleep(50)
}

