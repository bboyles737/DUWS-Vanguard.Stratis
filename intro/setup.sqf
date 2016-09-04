//cutText ["", "BLACK FADED", 5];
//0 fadeSound 0;

Num_Zones = 5;
Min_Zone_Rad = 250;
Max_Zone_Rad = 500;
Zone_Buffer = 500;
Zone_Array = [];

call compile preprocessFileLineNumbers "scripts\BasePlacement\map_size.sqf";    // Finds the center coordinates of the given map

_EnvScript = execVM "settings\environment_settings.sqf";
waitUntil {scriptDone _EnvScript};



call compile preprocessFileLineNumbers "scripts\DisableMapTextures\mapSwitchTextures.sqf";  
[] execVM "scripts\ShowOSD\SITREP_Info.sqf";

_ZoneScript = execVM "intro\place_zones_random.sqf";
waitUntil {scriptDone _ZoneScript};

//cutText ["", "BLACK IN", 2];
//2 fadeSound 1;
