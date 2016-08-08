// Creates zones from largest to smallest on the map.
_CapitalCityZoneSize = CapitalCity_ZoneSize;
_CityZoneSize = City_ZoneSize;
_VillageZoneSize = Village_ZoneSize;
_LocalZoneSize = Local_ZoneSize;
_MinDistBuffer = MinDistBuffer_ZoneSize;

_delay = 0;

Num_Zones = 0;
Zone_Array = [];

// Sets the color of a zone text given:
// [MarkerObj, Side] 
// Side is SIDE_BLUE (0), SIDE_OPFOR (1), SIDE_AAF (2), or SIDE_NONE (10).  Defined in DUWS-R.sqf.
ZoneTextColor = {
    _Marker = _this select 0;
    _side = _this select 1;
    
    switch (_side) do {
        case SIDE_BLUE: { _Marker setMarkerColor "ColorBlue"; };        
        case SIDE_OPFOR: { _Marker setMarkerColor "ColorRed"; };        
        case SIDE_AAF: { _Marker setMarkerColor "ColorGreen"; };        
        case SIDE_NONE: { _Marker setMarkerColor "ColorWhite"; };
    };
};

// Sets the color of a zone elliptical area given:
// [MarkerObj, Side] 
// Side is SIDE_BLUE (0), SIDE_OPFOR (1), SIDE_AAF (2), or SIDE_NONE (10).  Defined in DUWS-R.sqf.
ZoneAreaColor = {
    _Marker = _this select 0;
    _side = _this select 1;
    
    switch (_side) do {
        case SIDE_BLUE: {   _Marker setMarkerColor "ColorBlue"; 
                            _Marker setMarkerAlpha 0.2; };        
                            
        case SIDE_OPFOR: {  _Marker setMarkerColor "ColorRed"; 
                            _Marker setMarkerAlpha 0.2; };        
                            
        case SIDE_AAF: {    _Marker setMarkerColor "ColorGreen"; 
                            _Marker setMarkerAlpha 0.2; };        
                            
        case SIDE_NONE: {   _Marker setMarkerColor "ColorGrey"; 
                            _Marker setMarkerAlpha 0.4; };
    };
};

// Create_Zone - creates a zone given the following arguments:
// [Position, Side, Size, Name]
// Side is SIDE_BLUE (0), SIDE_OPFOR (1), SIDE_AAF (2), or SIDE_NONE (10).  Defined in DUWS-R.sqf.
// Size is radius of zone in meters
Create_Zone = {
    _thisLoc = _this select 0;
    _thisSide = _this select 1;
    _zoneSize = _this select 2;
    _zoneName = _this select 3;
    
    // Zone name
    _MarkerName = format ["CenterZone%1", Num_Zones];
    _Marker = createMarker [str(_MarkerName), _thisLoc];    
    _Marker setMarkerShape "ICON";
    _Marker setMarkerType "hd_objective"; 
    _Marker setMarkerSize [0, 0];
    //_Marker setMarkerText _MarkerName;
    _Marker setMarkerText _thisName;
    [_Marker, _thisSide] call ZoneTextColor;
    
    // Elliptical zone coloring
    _MarkerName = format["Zone%1", Num_Zones];
    _ZoneMarker = createMarker [str(_MarkerName), _thisLoc];
    _ZoneMarker setMarkerShape "ELLIPSE";
    _ZoneMarker setMarkerBrush "SolidBorder";    
    _ZoneMarker setMarkerSize [_zoneSize, _zoneSize];
    [_ZoneMarker, _thisSide] call ZoneAreaColor;
    
    // Trigger for entry/departure notifications
    _ZoneEntryTrigger = createTrigger["EmptyDetector", _thisLoc];
    _ZoneEntryTrigger triggerAttachVehicle [player];
    _ZoneEntryTrigger setTriggerArea [_zoneSize, _zoneSize, 0, false];
    _ZoneEntryTrigger setTriggerActivation ["VEHICLE", "PRESENT", true];           
    _ZoneEntryTrigger setTriggerStatements ["this", format ["[""%1"", thislist] execvm 'zones\enter_zone.sqf'", _thisName], ""];    
    
    // Determines if there are any piers within the zone
    _objList = nearestObjects [_thisLoc, Pier_Capability, _zoneSize];
    _numPiers = count _objList;
    _pierLoc = [];
    {    
        _pierLoc = getPosASL _x;    
        _elevation = _pierLoc select 2;
            
        if (_elevation > 10) then {
            _numPiers = _numPiers - 1;
        };                       
    } forEach _objList;
    
    if (_numPiers > 0) then {        
        _MarkerName = format ["Zone%1Pier", Num_Zones];
        _PierMarker = createMarker [str(_MarkerName), _pierLoc]; 
        _PierMarker setMarkerShape "ICON";
        _PierMarker setMarkerType "loc_Quay";        
        [_PierMarker, _thisSide] call ZoneTextColor;
    
        [format ["Zone %3 (%1) has %2 piers.", Num_Zones, _numPiers, _zoneName]] call DLog;
    };


    // Determines if there are any helipads within the zone
    _objList = nearestObjects [_thisLoc, Helo_Capability, _zoneSize];
    _numHelo = count _objList;
    _HeloLoc = [];
    _HeloNum = 0;
    {        
        _HeloLoc = getPos _x;    
        _MarkerName = format ["Zone%1Helo%2", Num_Zones, _HeloNum];
        _HeloMarker = createMarker [str(_MarkerName), _HeloLoc]; 
        _HeloMarker setMarkerShape "ICON";
        _HeloMarker setMarkerType "c_air";        
        [_HeloMarker, _thisSide] call ZoneTextColor;
        _HeloNum = _HeloNum + 1;
    } forEach _objList;
    
    if (_numHelo > 0) then {            
        [format ["Zone %3 (%1) has %2 helipads.", Num_Zones, _numHelo, _zoneName]] call DLog;
    };
    
    
    // Determines if there is an airfield within the zone
    _objList = _thisLoc nearRoads _zoneSize;
    _numAirfield = 0;
    _AirfieldLoc = [];
    
    
    {
        _connections = roadsConnectedTo _x;
        _numConnections = count _connections;
        if ( _numConnections == 0) then 
        {
            _numAirfield = _numAirfield + 1;
            _AirfieldLoc = getPos _x;
        };
    } forEach _objList;
    
    if (_numAirfield > 0) then {
        _MarkerName = format ["Zone%1Airfield", Num_Zones];
        _AirfieldMarker = createMarker [str(_MarkerName), _AirfieldLoc]; 
        _AirfieldMarker setMarkerShape "ICON";
        _AirfieldMarker setMarkerType "c_plane";        
        [_AirfieldMarker, _thisSide] call ZoneTextColor; 

        [format ["Zone %2 (%1) has an airfield.", Num_Zones, _zoneName]] call DLog;
    };
    
    _ThisZoneArray = [_thisLoc, _zoneSize];
    
    Zone_Array = Zone_Array + [_ThisZoneArray];
    Num_Zones = Num_Zones + 1;
};





_locnList = nearestLocations [Map_Center, ["NameCityCapital"], Map_Half];
[format ["Forming %1 capital city zones on the map", count _locnList]] call DLog;
{
    _thisLoc = getPos _x;
    _thisName = text _x;
    _validLoc = true;
    
    // Checks to see if there are zones already covering this one
    {            
        _neighborLoc = _x select 0;        
        _distance = _thisLoc distance _neighborLoc; 
        _minDist = (_x select 1) min _CapitalCityZoneSize;
        _minDist = _minDist + _MinDistBuffer;
              
        if ( _distance <= _minDist) then {        
            _validLoc = false;
        };     
    } forEach Zone_Array;
      
    if (random 1 > Zone_Creation_Chance) then {_validLoc = false; };

    if (_validLoc) then {
        if (random 1 <= CSAT_Zone_Chance) then {
            [_thisLoc, SIDE_OPFOR, _CapitalCityZoneSize, _thisName] call Create_Zone;            
        } else {
            [_thisLoc, SIDE_AAF, _CapitalCityZoneSize, _thisName] call Create_Zone;        
        };
    }; 
} forEach _locnList;
sleep _delay;


_locnList = nearestLocations [Map_Center, ["NameCity"], Map_Half];
[format ["Forming %1 city zones on the map", count _locnList]] call DLog;
{
    _thisLoc = getPos _x;
    _thisName = text _x;
    _validLoc = true;
    
    // Checks to see if there are zones already covering this one
    {            
        _neighborLoc = _x select 0;        
        _distance = _thisLoc distance _neighborLoc;    
        _minDist = (_x select 1) min _CapitalCityZoneSize;
        _minDist = _minDist + _MinDistBuffer;
              
        if ( _distance <= _minDist) then {        
            _validLoc = false;
        };     
    } forEach Zone_Array;
        
    if (random 1 > Zone_Creation_Chance) then {_validLoc = false; };

    if (_validLoc) then {
        if (random 1 <= CSAT_Zone_Chance) then {
            [_thisLoc, SIDE_OPFOR, _CityZoneSize, _thisName] call Create_Zone;            
        } else {
            [_thisLoc, SIDE_AAF, _CityZoneSize, _thisName] call Create_Zone;        
        };
    }; 
} forEach _locnList;
sleep _delay;


_locnList = nearestLocations [Map_Center, ["NameVillage"], Map_Half];
[format ["Forming %1 village zones on the map", count _locnList]] call DLog;
{
    _thisLoc = getPos _x;
    _thisName = text _x;
    _validLoc = true;
    
    // Checks to see if there are zones already covering this one
    {            
        _neighborLoc = _x select 0;        
        _distance = _thisLoc distance _neighborLoc;        
        _minDist = (_x select 1) min _CapitalCityZoneSize;
        _minDist = _minDist + _MinDistBuffer;
              
        if ( _distance <= _minDist) then {        
            _validLoc = false;
        };     
    } forEach Zone_Array;
        
    if (random 1 > Zone_Creation_Chance) then {_validLoc = false; };

    if (_validLoc) then {
        if (random 1 <= CSAT_Zone_Chance) then {
            [_thisLoc, SIDE_OPFOR, _VillageZoneSize, _thisName] call Create_Zone;            
        } else {
            [_thisLoc, SIDE_AAF, _VillageZoneSize, _thisName] call Create_Zone;        
        };
    }; 
} forEach _locnList;
sleep _delay;


// Counts helipad locations as local zones if not already included
_objList = nearestObjects [Map_Center, Helo_Capability, Map_Half];
_numHelo = count _objList;
_HeloLoc = [];
[format ["Checking %1 helipads on the map", count _objList]] call DLog;

{    
    _thisLoc = getPos _x;
    
    // Slightly randomizes position to keep zone marker from appearing directly on top of the helipad icon
    _randomness = _LocalZoneSize * 0.2;
    _newX = _thisLoc select 0;
    _newY = _thisLoc select 1;
    _newX = [_newX - _randomness, _newX + _randomness] call RandRange;
    _newY = [_newY - _randomness, _newY + _randomness] call RandRange;
    
    _thisLoc set [0, _newX];
    _thisLoc set [1, _newY];
    
    // Finds nearest location and uses the name for that
    _nearestLoc = nearestLocation [_thisLoc, "NameLocal"];
    _thisName = text _nearestLoc;
    _validLoc = true;
    
    // Checks to see if there are zones already covering this one
    {            
        _neighborLoc = _x select 0;        
        _neighborSize = _x select 1;
        _distance = _thisLoc distance _neighborLoc;      
        _minDist = _neighborSize min _CapitalCityZoneSize;
        _minDist = _minDist + _MinDistBuffer;
        
        if ( _distance <= _minDist) then {                
            _validLoc = false;
        };                     
    } forEach Zone_Array;   
    
    if (random 1 > Zone_Creation_Chance) then {_validLoc = false; };

    if (_validLoc) then {
        if (random 1 <= CSAT_Zone_Chance) then {
            [_thisLoc, SIDE_OPFOR, _LocalZoneSize, _thisName] call Create_Zone;            
        } else {
            [_thisLoc, SIDE_AAF, _LocalZoneSize, _thisName] call Create_Zone;        
        };
    };     
} forEach _objList;
sleep _delay;

_locnList = nearestLocations [Map_Center, ["NameLocal"], Map_Half];
[format ["Forming %1 local zones on the map", count _locnList]] call DLog;
{
    _thisLoc = getPos _x;
    _thisName = text _x;
    _validLoc = true;
    
    
    // Checks to see if there are zones already covering this one
    {            
        _neighborLoc = _x select 0;        
        _neighborSize = _x select 1;
        _distance = _thisLoc distance _neighborLoc;      
        _minDist = _neighborSize min _CapitalCityZoneSize;
        _minDist = _minDist + _MinDistBuffer;
        
        if ( _distance <= _minDist) then {                
            _validLoc = false;
        };     
        
        
    } forEach Zone_Array;   
        
    if (random 1 > Zone_Creation_Chance) then {_validLoc = false; };

    if (_validLoc) then {
        if (random 1 <= CSAT_Zone_Chance) then {
            [_thisLoc, SIDE_OPFOR, _LocalZoneSize, _thisName] call Create_Zone;            
        } else {
            [_thisLoc, SIDE_AAF, _LocalZoneSize, _thisName] call Create_Zone;        
        };
    };   
} forEach _locnList;
sleep _delay;

["All zones formed."] call DLog;