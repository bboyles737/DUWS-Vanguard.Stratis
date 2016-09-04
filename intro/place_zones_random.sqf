["Starting random zone script"] call DLog;
_ZonesToCreate = Num_Zones;
_ZoneDebug = false;
Timeout = false;                // Needs to be a global variable for timeout script to work
//[format ["Random Zones to Create: %1", _ZonesToCreate]] call DLog;

_TimeoutScript = [] spawn {
    sleep 90;
    Timeout = true;
};

// Loop to create zones
for [{ _CurrentZoneNum = 1}, { _CurrentZoneNum <= _ZonesToCreate}, { _CurrentZoneNum = _CurrentZoneNum + 1}] do
{
    scopeName "createZones";

    _CreateThisZone = true;
    //[format ["Looking for zone location #%1...", _CurrentZoneNum]] call DLog;
    
    // Min_Zone_Rad and Max_Zone_Rad defined in intro\setup.sqf
    _CurrentZoneRad = [Min_Zone_Rad, Max_Zone_Rad, 0] call RandRange_Round;
    //[format ["Zone size is: %1 (between %2 and %3)", _CurrentZoneRad, Min_Zone_Rad, Max_Zone_Rad]] call DLog;
    
    // Map_Center and Dist_Map_Corner is defined in scripts\BasePlacement\map_size.sqf
    _MinDistNearestObj = 5;
    _WaterMode = 0;             // 0 = cannot be in water, 1 = doesn't matter, 2 = must be in water
    _MaxTerrainGradient = 0.1;  // Average alttiude difference
    _ShoreMode = 0;             // 0 = Doesn't have to be at shore, 1 = must be at shore
    
    
    // BIS_fnc_findSafePos arguments are: [Center, min distance from center, max distance from center, min distance from nearest object 
    _ZoneLocation = [Map_Center, 0, Dist_Map_Corner, _MinDistNearestObj, _WaterMode, _MaxTerrainGradient, _ShoreMode] call BIS_fnc_findSafePos;
    
    if (_ZoneLocation select 0 != 0 && _ZoneLocation select 1 != 0) then {
        if (_ZoneDebug) then {
            [format ["Zone %1 tentative location is centered at %2", _CurrentZoneNum, _ZoneLocation]] call DLog;
        };
    } else {
        [format ["ERROR!  Zone %1 cannot be placed", _CurrentZoneNum]] call DLog;
    };
    
    // Compares location to existing zones to see if it is within the Zone Buffer
    {
        //[format ["DEBUG Zone_Array is %1, size %2", Zone_Array, count Zone_Array]] call DLog;        
        //[format ["_x is %1", _x]] call DLog;
        
        scopeName "compareZones";
        _CompareZoneCenter = _x select 1;
        _CompareZoneRad = _x select 2;
        
        _DistBetween = _CompareZoneCenter distance2D _ZoneLocation;
        _CompDist = _CompareZoneRad + _CurrentZoneRad + Zone_Buffer;
        if (_ZoneDebug) then {
            [format ["DEBUG Comparing Zones %1 to %2, Locn %3 and %4.", _x select 0, _CurrentZoneNum, _CompareZoneCenter, _ZoneLocation]] call DLog;
            [format ["DEBUG %1 + %2 + %3 = %4.  Dist is %5", _CompareZoneRad, _CurrentZoneRad, Zone_Buffer, _CompDist, _DistBetween]] call DLog;        
        };
        
        if (_DistBetween < _CompDist) then {            
            // Insufficient space, do not add to Zone_Array, decrement _CurrentZoneNum so we loop again
            // [format ["Zone %1 doesn't have space with Zone %2.  Breaking loop.  TIMEOUT %3", _CurrentZoneNum, _x select 0, Timeout]] call DLog;
            _CurrentZoneNum = _CurrentZoneNum - 1;
            _CreateThisZone = false;
            breakOut "compareZones";
        };
       
        
    } forEach Zone_Array;
    
    if (_CreateThisZone) then {
        if (_ZoneDebug) then {
            [format ["Zone %1 has enough space and is being created.", _CurrentZoneNum]] call DLog;        
        };
        
        
        // Add to array of zones (zone #, zone location, radius, control with 1 = OPFOR)
        Zone_Array = Zone_Array + [[_CurrentZoneNum, _ZoneLocation, _CurrentZoneRad, SIDE_OPFOR]];
                
        [_CurrentZoneNum, _ZoneLocation, SIDE_OPFOR, _CurrentZoneRad, "Tester Stupod"] call CreateZoneMarkers;
        ["Waiting ten seconds"] call DLog;
        sleep 10;
        ["Wait complete"] call DLog;
        [_CurrentZoneNum] execVM "scripts\spawn\zone_structures\vehicle_repair_zone.sqf";
        
        [Zone_Array select 0, SIDE_BLUFOR] call ChangeZoneControl;
    };
    
    if (Timeout) then {
        ["ERROR!  Timeout during zone creation."] call DLog;
        breakOut "createZones";
    };          
};

Timeout = nil;  // Deletes variable now that it is no longer needed.


