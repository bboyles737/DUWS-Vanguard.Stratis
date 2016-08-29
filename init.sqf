WeatherActive = false;                // Activated after the user chooses environment settings
Player_CP = 1000;                     // Overridden by game settings

DialogWaitFlag = false;               // Used by dialogs to signal completion

call compile preprocessFileLineNumbers "DUWS-V.sqf";                            // Misc. helper functions and variables
call compile preprocessFileLineNumbers "settings\key_bindings.sqf";             // Custom key bindings
call compile preprocessFileLineNumbers "scripts\zones\zone_functions.sqf";      // Zone creation and changing functions
call compile preprocessFileLineNumbers "scripts\spawn\spawn_functions.sqf";     // Spawning functions

_StartupScript = execVM "intro\setup.sqf";      // Does cutscenes, fade-ins, and initial setup
waitUntil {scriptDone _StartupScript};          // Pauses so that date/time are set properly before debug logs are made.

call compile preprocessFileLineNumbers "docs\help.sqf";                         // Loads DUWS:Vanguard manual into the player's journal
execVM "scripts\HUD_Info\HUD_info_updates.sqf";                                 // Initializes HUD and updates


