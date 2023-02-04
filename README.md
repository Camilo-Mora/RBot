# RBot
Designed by Camilo Mora and developed by Mohammed Ibrahim 

A safety Discord bot to monitor that R codes are operational.

## Problem
Say you are running a very sensitive code in R, and you want to know when R has stopped for any reason. You can have R send you an email saying everything is fine, but you will know everything is fine as far as R is fine. If R crashes, R cannot send you an email saying I stopped working. 

Worse how is R going to send you a warning that something went wrong with your code, if say the electricity is out?. 

The solution is an external/remote device that monitors R periodically, and send you a warning when R fails to transmit. That functionality is provided in this Rbot.


The logic is like this:

Have R send constant messages to Discord, have a Discord Bot monitor the time interval between messages, and if the time interval exceeds a set time limit, have the bot send you an email saying “Something is wrong with your code”.

The bot is hosted is the cloud, so the monitoring system is always on. The Bot can send another email saying "Things are back to normal with your code", when R starts transmiting again.

# Prerequisites
1. You need to create an account in Discord, and create a bot to work on it.
2. You need a virtual server. There are several for free, but here we use the cheap option from [Digital Ocean](https://www.digitalocean.com/pricing)
3. You need to install WinSCP (To transfer the file in this repository to your cloud server).
4. You need to install Putty (To check and activate the bot).

# Installation

## Download files
Dowonload and unzip the files from this repository in your local computer.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Files2.png" width=50% >

## Create Discord server
We assume you have already created an account in Discord and have a sever, if not sign up for one [HERE](https://discord.com/).

1. To create the server, click on the + bottom, see image below.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Server.png" width=50% >

2. click on "Create my own"
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Server2.png" width=50% >

3. click on "For me and friends"
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Server3.png" width=50% >

4. click on "Create"



## Create Discord Bot
1. Go to the Discord Developer Portal (https://discord.com/developers/applications) and sign in. 


2. Click on the "New Application" button to create a new bot.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DiscordCreateNewApplication1.png" width=50% >

3. Give your bot a name and click on the "Create" button.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DiscordCreateNewApplication2.png" width=50% >

4. It'll now take you to a page in which you can enter details such as your app's description, add tags, an app icon, and more. Once done, hit the Save Changes button to proceed

5. Click on the "Bot" section on the left sidebar and then click on "Add Bot."
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DiscordCreateNewApplication3.png" width=50% >

6. You'll now see a security token for your bot on the next page. If the token hasn't been generated, simply tap on the Reset button to create a new token. Copy this token ID as we'll need it

7. Navigate to intents section and enable all of them
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DiscordCreateNewApplication4.png" width=50% >

8. Now, look for the OAuth2 option in the menu on the left sidebar and click on it to find your CLIENT ID. It's a long string of numbers.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DiscordCreateNewApplication5.png" width=50% >

9. Paste to this URL below -- replace the word CLIENTID with the actual CLIENT ID that you just copied -https://discordapp.com/oauth2/authorize?&client_id=CLIENTID&scope=bot&permissions=8

10. Simply paste this particular URL into your web browser and hit enter. It'll open a page in which you can tell Discord where to send your bot. Select the server to which you want to add your new bot from the dropdown menu

## Create virtual server.
There is actually a brief video how to do this.
[Install droplet in Digital Ocean](https://www.youtube.com/watch?v=g1-nQ9pvbxc)

All you will need from this sever are the credential to join remotely with WinSCP. Let see how.

Go the Digital Ocean, and click on "Droplets", then select the droplet you just created following the video above. You should then see a window like the one below. The vertical arrow shows the IP where the files will be loaded (hover the mouse), and click copy. This will become the IP, which you will need later. Click on reset password (if you lost the password you got when you created the droplet).

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/DropleetInfo.png" width=50% >

## Edit the ".Env" file
The .Env file you downloaded from this repository contains all the credetials the bot needs to operate. Lets you how you find them.

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/ENV.png" width=50% >

### BOT_TOKEN
You should have this token when you created the Bot. If not, you may need to create a new one. This is how. Go to the developer portal of [Discord] (https://discord.com/developers/applications). and click on the bot you created earlier, "TD" in my case.

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Bot1.png" width=50% >

Go Bot, then click on "Reset token"., and copy it. That becomes the token you paste in the .ENV file
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Bot2.png" width=50% >

### BOT_CHANNEL_ID
Go to your Discord channel, right click on the #name, and scroll down to Copy ID. That is your channel ID
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Bot3.png" width=50% >


### EMAIL_SENDER
This is the email address the Rbot uses to send messages to.

### EMAIL_PASSWORD
This is the password for Rbot to acess the email account above. This is done via .ssh. [Here](https://support.google.com/accounts/answer/185833?hl=en) are the isntruction to get that password.



### EMAIL_RECEIVER
This is the email address to which RBot will send notifications that things are going wrong.

Now that the .Env file is configurated save it in the same folder with all other files.

## Transfer files to virtual server
Open WinSCP, in the HostName enter the IP, and in password, the one you got from Digital Ocean when creating the Droplet, then click Login. If you "Reset Root Password",  when you created the virtual server, you need to reset your password using Putty, as shown below under section "Reset password of droplet", this happens because when you resetted the password in the droplet that was a temporary password. You will need to get a permanent one, as shown below.

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/TransferToWinSCP.png" width=50% >

On the left hand side, browse to the folder where you unzipped the files from this repository. On the right, create a folder Name it "Rbot". Simply select all files from the left, and drag them in the folder to the right.

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Files.png" width=50% >

### Resseting password of droplet
Open Putty, enter the IP (Provided in the droplet secction), into the “Host Name” field and click on “Open" 

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Putty0.png" width=50% >

A black screen like the one below should appear. In loging as: type "root", hit Enter.

In your email acount you should have recieved a temporary password from Digital Ocean, copy that password, then go to Putty, right  click on the green square only ONCE and then hit Enter…. Do the same in the next screen.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/ChangePass2.png" width=50% >

You will be asked for a new password, and to retype it. That password will become the one you need to login in WinSCP above.

<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/ChangePass3.png" width=50% >

## Now lets run Rbot
1. Open Putty, and type "cd Rbot", then hit enter (Rbot, is the name of the folder we created in Droplet.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Putty.png" width=50% >

2. Type “python3 main.py” and then hit enter. If all works. You should get a message saying so.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Putty2.png" width=50% >

3. Run the demo R code provided in this repository. This demo will send messages to Discord evry 50 secs. and if all is working your recipient email account should get a message saying all is working.

4. Now that we confirm Rbot is working, we need to reset it. Go back to Putty and type “ctrl” + “z”,  this should stop the bot. To run the bot for good type “nohup python3 main.py &” and then hit Enter. Your screen should loook like the one below. and That is. you now have a live Bot checking messages that you send from R to the Discord Channel.
<img src="https://github.com/Camilo-Mora/RBot/blob/main/Images/Putty3.png" width=50% >
