# ARK Configuration

Set of configuration, scripts and tools for the configuration of the Exilers ARK Server Cluster.

Effort has been invested to ensure the standardisation of configuration changes across all servers. For example, mods added to one server should also appear on another server.

**NOTE**: This has been rebased and filtered from my private repository to strip out usernames, passwords and sensitive information etc. I am currently in the process of cleaning up for public use, documenting and releasing the companion tools.

## Repo Structure

 - **Args/**: Folder containing the server command line arguments. JSON files are for an incomplete server management software.
 - **AdditionalItems/**: Additional files which have thier own home, included here for reference.
 - **DataProcessorConfigs/**: Configuration for the ARK Data processing tools which periodically process and produce output from each of the ARK Save files, as well as some other functions.
 - **Reference/**: Notes and documentation for the ARK Server
 - **Scripts/**: Contains scripts for starting the servers, backing up save files and general management of the server.
 - **Settings/**: Contains the Game.ini and GameUserSettings.ini as well as a templating system for the management of said settings.
 - **dynamicconfig.ini**: Contains the dyanmic settings which can be reloaded by the server at runtime
 - **DefaultOverloads.json**: Another runtime configuration, but not used.
 - **maplist.txt**: List of "maps", referring to the filenames for the argument files in the ```Args/``` folder. Often used by various scripts which work across all the maps/servers.
 - **PrintMapSettings.cmd**: Displays all the port settings for all of the maps (helps make sure there are no port conflicts).
 
```
Map             | SessionName               | Port | PortRawUDP | QueryPort | RCONPort | AltSaveDirectoryName
--------------- | ------------------------- | ---- | ---------- | --------- | -------- | --------------------
TheIsland       | Exilers on The Island     | 7777 | 7778       | 27015     | 27080    | Island
ScorchedEarth_P | Exilers on Scorched Earth | 7779 | 7780       | 27016     | 27081    | Scorched
Aberration_P    | Exilers on Aberration     | 7787 | 7788       | 27051     | 27085    | Aberration
Extinction      | Exilers on Extinction     | 7789 | 7790       | 27052     | 27086    | Extinction
Genesis         | Exilers on Genesis 1      | 7791 | 7792       | 27053     | 27087    | Genesis1
Gen2            | Exilers on Genesis 2      | 7793 | 7794       | 27054     | 27088    | Genesis2
TheCenter       | Exilers on The Center     | 7783 | 7784       | 27018     | 27083    | TheCenter
Ragnarok        | Exilers on Ragnarok       | 7781 | 7782       | 27017     | 27082    | Ragnarok
Valguero_P      | Exilers on Valguero       | 7795 | 7796       | 27055     | 27089    | Valguero
CrystalIsles    | Exilers on Crystal Isles  | 7797 | 7798       | 27056     | 27090    | CrystalIsles
LostIsland      | Exilers on Lost Island    | 7785 | 7786       | 27019     | 27084    | LostIsland
Fjordur         | Exilers on Fjordur        | 7799 | 7800       | 27057     | 27091    | Fjordur
Press any key to continue . . .
```

## Important Paths

 - **C:\Games\GAME_ID**: Folder where games are installed to (using steamcmd). GAME_ID is an alphanumeric reference to the game (e.g. ark, arkse, arkab etc).
 - **C:\Data\_backups\GAME_ID**: Folder where various data or backups are stored for each game.
 - **C:\Data\ark-clusters**: Folder where cluster data is stored.
 - **C:\Software**: Folder where software and tools are kept.
 
## Companion Apps

 - **Data Processor**: <https://github.com/abaitken/ark-data-tools> See below for details.
 - **ARKon**: A remote console app for ARK servers.
 - **ConsoleTable**: <https://github.com/abaitken/console-table> A tool app which prints a nice table in the console from CSV data
 - **merge-ini**: <https://github.com/abaitken/merge-ini> A tool app which merges .ini files, like the ARK settings files.
 - **SteamCMD**: A console app provided by Steam/Valve to perform scripted actions for game libraries.
 - **ARK Smart Breeding (custom)**: <https://github.com/abaitken/ARKStatsExtractor> A customised version of the ARK Smart Breeding app, providing an automated output of the creature library.
 - **7-zip**: Used to compress files into archives.
 - **rsync**: Planned for the mod update script.
 - **ark-dino-tracker**: <https://github.com/abaitken/ark-dino-tracker> Website serving the location data uploaded by the data processing tools.
 - **ark-completionist**: <https://github.com/abaitken/ark-completionist> Website providing notes and dossiers locations and checklist
 - **ark-breeding-data**: <https://github.com/abaitken/ark-breeding-data> Website providing the uploaded Smart Breeding Creature libraries.

### Data Processor

A .NET service, which is configured through the json files in the ```DataProcessorConfigs``` folder, checking for newly saved ARK files, providing output data from the maps.

There is a configuration for each map/save game, which has a number of outputs and targets.

 - **tamed_creature_locations_chunked**: "Chunked" data (creature class per file) output of Tamed creature locations and levels. Which is then uploaded to the Dino Tracker data folder on a website.
 - **wild_creature_locations_chunked**: Similar to the above, but instead Wild creatures are selected. (NOTE: Certain creatures are excluded due to thier volume).
 - **structure_locations**: Structure locations by class (in a single file), as per the ```structure_locations``` filter. Again, uploaded to a website.
 - **rolling_backup**: A backup copy of the save game, and some associated files. Copied to a location on the server which maintains the previous 20 copies (roughly 5 hours).
 - **import_smart_breeding_library**: Executes the customised Smart Breeding app to generate a creature library, which is then uploaded to a website and made available through a simple web page.
 
Another configuration is available which dumps all of the creature, structure and item classes to a file, useful when looking for the name of a class to add to a filter.

## Initial Setup

 - Create the ```C:\Games``` folder
 - Create folders for the desired ARK games following the ```GameFolder``` value in the args files. (e.g. ark for The Island, arkse for Scorched Earth etc.).
 - If using the companion tools:
   - Download tools and setup into these folders:

```  
C:\Software\ConsoleTable.cmd
C:\Software\merge-ini.cmd
C:\Software\ArkDataProcessor-Release\Release\ArkDataProcessor.exe
C:\Software\ARKon\ARKon.exe
C:\Software\ARKStatsExtractor-Debug\Debug\ARK Smart Breeding.exe
C:\Software\ConsoleTable\ConsoleTable.exe
C:\Software\DeltaCopyRaw\rsync.exe
C:\Software\merge-ini-Release\Release\net6.0\merge-ini.exe
```
   - Add ```C:\Software``` to your ```PATH``` environment
   - Create Data folders as required too. (```C:\Data\_backups\%GameFolder%```, ```C:\Data\_backups\%GameFolder%\rolling```)
 - Create the cluster folder ```C:\Data\ark-clusters```
 - Run the ```scripts/update-all.cmd``` script or use ```steamcmd``` to install 

## Altering settings

The settings folder contains three scripts:

 - **generate_settings.cmd**: Re-creates settings from the templates and writes them to the Staging folder.
 - **get_settings.cmd**: Copies the settings from the game folders into the Staging folder. Useful when using source control to check for mismatch or changes.
 - **restore_settings.cmd**: Copies settings from Staging to the game folders.
 
To change a setting:

 - Edit the relevant shared or game specific file.
   - Files are generally seperated based on functional area.
 - Files with patterns like ```_mergelist-.*\.txt``` are the order in which the files are applied. 
  - If a seperate template file is desired, the filename must be added to one (or both) of these to have the settings merge correctly.
 - Run the ```generate_settings.cmd``` script to merge the settings.
 - Run the ```restore_settings.cmd``` script to copy the new settings to thier game folders.
 - To add a mod edit ```Settings/Template/Shared/_list-Mods.txt```. Add a line in the format of ```NAME;MODID```. (Name is just for human reference).
 - To disable a mod edit ```Settings/Template/Shared/_list-Mods.txt``` and use ```#``` character at the start of the line as a comment
 - To remove a mod edit ```Settings/Template/Shared/_list-Mods.txt``` and remove the line

## Starting a server

 - Run the ```scripts/update-all.cmd``` to ensure all the servers are up to date
 - Open the Scripts/start folder.
 - Execute the relevant start script (e.g. ```start-island.cmd```).
 - Execute the ```start-tools.cmd``` to start the ARKon and DataProcessor service if required.

## Stopping a server

 - Using ARKon, connect to the relevant server and from the Admin tab, click ```Save and Exit server```
 - Or, log on to the server in-game, and use the in game commands (e.g. from ```ShowMyAdminManager```)
 - Or, use your favourite rcon server and run the commands

## General advice

 - It can take anywhere between 7 - 15 minutes for some maps to start and ready for players. Restarting oddly would take anywhere between 3 - 5 minutes.
 - I would allocate roughly 6Gb of RAM for each map, except for Genesis Part 2, which takes up to 15 Gb.
 - I did seperate install folders for each server/map due to shared logs and the automatic mod updating. I wanted to avoid possible issues when launching a second server altering files in use or finding write locked files.
 - I have a game folder just for generic tasks. When setting up a new server, I would copy this folder (saves downloading everything again). But also useful to startup manually for testing/recovering data etc.
 
## Incomplete features

 - Mod update scripts; using steamcmd to download mods to the generic game folder, to be sync'd to other game folders to skip the mod downloader step when starting the servers.
