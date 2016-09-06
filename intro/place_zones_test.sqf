["Starting random zone script"] call DLog;
_ZonesToCreate = Num_Zones;
_ZoneDebug = false;
Timeout = false;                // Needs to be a global variable for timeout script to work
["Creating test zones"] call DLog;

// Creates two zones next to each other on Stratis Air Base
// One zone will use the original DUWS configs, the other the refactored files

_ZoneOriginal = [1500.0, 5200.0];
_ZoneVanguard = [1510.0, 5250.0]; 

Zone_Array = Zone_Array + [[1, _ZoneOriginal, 250, SIDE_OPFOR]];
Zone_Array = Zone_Array + [[2, _ZoneVanguard, 250, SIDE_BLUFOR]];

["Spawning zones in 10 seconds"] call DLog;
sleep 10;
[1] execVM "scripts\spawn\zone_structures\research_station.sqf";
[2] execVM "scripts\spawn\old_structures\research_station.sqf";

Timeout = nil;  // Deletes variable now that it is no longer needed.
