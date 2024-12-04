🍃 Leaf Bot V2 - Fully Extended Script with Enhanced Features

Overview

Leaf Bot V2 is a fully extended Roblox script that offers a variety of commands and features for controlling a player's in-game experience. It includes capabilities like orbiting around players, following players at a specified distance, spamming chat messages, and sitting down. Additionally, the script includes real-time player status monitoring, enhanced error handling, and debug logs for developers. The script also integrates a user-friendly GUI powered by Rayfield for configuration and command execution.

Features

Orbit Command: Make your character orbit around a target player.

Follow Command: Follow a target player within a specific distance.

Spam Command: Automatically spam a customizable message in the chat.

Sit Command: Make your character sit down.

Debug Logs: Detailed logs for tracking errors and script actions.

Player Status Monitoring: Real-time tracking of player activity in the game.

Rayfield GUI: A user-friendly interface for interacting with the bot’s features.


Installation

1. Download the script.


2. Insert it into StarterPlayer -> StarterPlayerScripts.


3. Run the game and open the Rayfield GUI.



Commands

Orbit Command

Description: Makes your character orbit around a target player at a specified speed and radius.

Parameters:

Speed: The speed at which the orbiting occurs.

Radius: The distance around the target player that your character will orbit.



Follow Command

Description: Makes your character follow a target player at a specified distance.

Parameters:

Distance: The distance at which your character follows the target.



Spam Command

Description: Automatically sends a message in the chat at a specified rate.

Parameters:

Message: The message to spam.

Rate: The time interval between each message sent.



Sit Command

Description: Makes your character sit down.

Parameters: None.


Configuration

Leaf Bot V2 comes with a configurable settings system:

Orbit Speed: Set the speed at which the orbit command operates.

Orbit Radius: Set the radius at which the orbit command occurs.

Follow Distance: Set the distance at which the follow command operates.

Spam Message: Set the message to be used in the spam command.

Spam Rate: Set the rate (time interval) at which the spam command sends messages.

Sit Enabled: Enable or disable the sit command.

Debug Mode: Enable or disable debug logs.


Player Status Monitoring

The bot continuously monitors player activity:

Tracks whether a player's character is active or disconnected.

Displays a real-time status of all players in the game.


Debug Logs

When DebugMode is enabled, the script logs detailed information about its actions:

Logs when commands are executed.

Logs any errors or issues encountered.


Rayfield GUI

The script uses Rayfield to create a GUI for real-time interaction with the bot:

Main Commands Tab: Provides buttons for executing the core commands (Orbit, Follow, Spam, Sit).

Player Status Tab: Displays the current status of all players.

Command Settings Tab: Allows adjusting settings for commands (speed, radius, message, etc.).

Information Tabs: Displays version information, credits, and help for using the bot.


Example Usage

1. Orbiting: Press the "Orbit Command" button in the GUI to start orbiting a target player at a specified speed and radius.


2. Following: Press the "Follow Command" button in the GUI to start following a target player at a specified distance.


3. Spamming: Press the "Spam Command" button in the GUI to start spamming a message in the chat.


4. Sitting: Press the "Sit Command" button in the GUI to make your character sit.



Version and Credits

Version: V2

Developed by: LeafCorp

For help, Contact Discord: leafcorp


Error Handling and Debugging

safeExecute: A helper function ensures safe execution of commands, capturing and logging errors if they occur.

debugLog: Logs detailed debug messages when DebugMode is enabled.
