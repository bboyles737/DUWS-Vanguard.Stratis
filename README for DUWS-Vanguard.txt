DUWS: Vanguard

Version 0.251 (9AUG16):
- Fixed bug: Overlapping zones was caused by using distance function instead of distance2D function and comparing a 2D to 3D coord.
- Readme file updated

Version 0.25 (7AUG16):
- Renamed to DUWS-Vanguard, since DUWS-Resistance can be confused with the existing DUWS-Rebirth mod.
- Changed purpose of mod to first establish a fully-working, albeit bare-bones refactoring and update of original DUWS, and then to add additional functinoality.
- Retains the dynamic weather / environment settings from DUWS-R 0.24
- Retains the default map texture off script from DUWS-R 0.24
- Refactored kibot's DUWS zone creation script for random zone creation.
- Bug: Some zones are partially overlapping, even though in theory that should not happen.

Version 0.24 (7AUG16):
- Updated to 3den Editor settings
- Removed LxOPS script due to 3den support

Version 0.23 (14JUN15):
- Modified LxOPS script to alphabetize lists and fixed the "Goto" function so it works properly
- Modified construction dialog box so you can move objects
- Modified construction dialog box so height no longer resets to 0 when switching objects
- Limited implementation of dragging ammo containers

Version 0.22 (09-10JUN15):
- Added construction dialog box and config settings
- Added Squad Manager dialog box, displaying members of a player's group, their integer skill levels, and rank abbreviation and created a Rank_Abbrev function to support this
- Randomly generated AI skill is now rounded to two decimal places and created the RandRange_Round function to support this
- Startup: Now starts with two teams of five to simplify boat command and control
- Fixed bug: Boat squad spawn mechanics adjusted again to keep boat standing bug from happening

Version 0.21 (04-05JUN15):
- Added boat unbeaching script and keybinding from Whole Lotta Altis
- Map defaults to topographic representation
- Startup: Fireteams of initial squad set to appropriate team colors
- Startup: Boat insertion mode: boat spawning locations switched so the boats start in proper formation
- Equipment: Class loadouts modified so everyone will generally wear the same uniform, will carry more ammo (especially 40mm HE grenades) and less diversity of smoke colors.
- Equipment: Created spawn functions for modified soldier classes
- Fixed bug: Debug logging now takes place in a separate diary entry to prevent dupliate and confusing entries.
- Fixed bug: Soldiers will not spawn standing up in the boat
- Fixed bug: Keybindings were becoming unbound within a minute of setting

Version 0.20 (03JUN15):
- Logging: Added three functions to both display on screen and write to a log (debug, mission, or chat)
- Refactored: Old setup routines so it now uses the new logging methods
- Zones: Now all helipads in a given zone are displayed.  Previously was only displaying one.
- Startup: Script now sets up initial zones and the environment settings
- Startup: Screen starts black and fades in after environment is set
- Startup: Can now select boat insertion mode and starting location.  Will start with two boats containing a full rifle squad and medic.
- Moved config settings to a global file.
- Bug: Multiple logs of the same name are being produced
- Fixed bug: Dynamic weather generation did not properly account for weather type selection

Version 0.14 (04JUN14):
- Equipment: Created menu to select various items and display the cost from the configuration files
- Equipment: Purchased equipment appears in an ammo crate at your current base
- Equipment: Created 14 of 19 Soldier class spawning scripts
- Incorporated command point HUD status (modifying HUD code from Whole Lotta Altis by SaOk)
- Created error message display format for HUD
- Adjusted base layout to keep objects from spawning incorrectly (in particular, adding a delay between spawning the base building and other objects)
- Created data structure for base information (friendly base ID, location, and associated ammo crate)

Version 0.13 (03JUN14):
- Zones: Modified zone spawning to give priority to helipad locations over other named localities
- Zones: Single road connector (road ends) will not be used for spwaning zones, but will instead be reserved for mission sites
- Zones: Start as CSAT/AAF zones by default (randomly split); initial BLUFOR zone is converted based on startup location
- Zones: Tied spawning of BLUFOR base (manual placement) to occupying an existing zone.
- Zones: Entry/exit triggers and notifications implemented
- Resting and saving at the base is now impemented (skips random amount between 5-7 hours)
- Equipment: Added rough cost values for NATO equipment - will need adjustment.
- Consolidated environment script and dialog settings into a single script
- Bug: Tried to update game settings dialog but was experiencing unexpected crashes.  Temporarily hard-coding zone setup


Version 0.12 (02JUN14):
- Created "ArrayAdd" and "ArraySub" functions to add or subtract similarly-sized arrays from eahc other
- Modified LxOPS script to include a handle to call ArraySub on a user-defined base location
- Modified LxOPS script to copy list of all objects into the clipboard for more efficient searching
- BLUFOR FOB HQ spawning function now takes a position argument for its spawn location
- Mission/Base Creation: Wrote functions which identify all non-standard road connections (!= 2 connections, so a crossroads or end point) and named locations on a map
- Zones: Can create zones based on map named locations with size scaled by significance (capital > city > village > location)
- Zones: Zones no longer overlap
- Zones: Created functions to set/change zone ownership
- Map: Adds icons for airports, helipads, and ports within a zone.
- Startup: Can specify the number of zones out of the total possible named zones on a map
- BLUFOR HQ will now occupy a zone (instead of being in a non-zone area as in original DUWS), or alternatively in forced-entry mode, the player doesn't start with a HQ and needs to secure a zone to expand

Version 0.11 (15MAY14):
- Created spawn functions for BLUFOR FOB HQ at a random or user-positioned start
- Created startup menu to specify number of zones, AI skill levels, and starting AP/CP
- Incorporated third-party mod LxOPS 3D position editor for content creation
- Improved dynamic weather to include minimum transition times/cycle duration and minimum fog altitudes

Version 0.10 (14MAY14):
- Project name: DUWS-Resistance
- Added startup option to set season and approximate time of day for the mission start.  The exact times are somewhat randomized, but are adjusted to fit the dawn and dusk timeframes of the given season.
- Imported and refactored the dynamic weather system from the original DUWS
- Added placeholder to implement AAF integration, but this has not been implemented
- Fixed bug: ShowOSD, which displays the current date time and location, was misrepresenting "Southwest" as "Northwest"

CREDITS:

Original DUWS by kibot
Mapsize script by Kempco
HUD code adapted from Whole Lotta Altis by SaOk
Boat unbeaching and keybinding from Whole Lotta Altis by SaOk
Switch map textures adapted from script by DnA
AI skill tiers adapted from ASR AI3 mod by Robalo
