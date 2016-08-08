// Run from game_settings.hpp

// Parameters for generating a random location
_DistFromObject = 5;
_MaxSlope = 0.1;
_LocationFound = false;

Base_Type = lbCurSel 2100;
switch (Base_Type) do {
    case Base_FOB: { 
        _DistFromObject = 10;
        _MaxSlope = 0.1;        
    };    
    
    case Base_Patrol: {         
        _DistFromObject = 2;
        _MaxSlope = 0.5;
    };    
};

closeDialog 0;

// Find a random location given the parameters above
while {!_LocationFound} do {
    _RandBasePos = [Map_Center, 0, Map_Half, _DistFromObject,0, _MaxSlope,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
    if (_RandBasePos select 0 != 0 && _RandBasePos select 1 != 0) then 
    {
        player setpos [(_RandBasePos select 0) - 10, (_RandBasePos select 1)];        
        _LocationFound = true;
        _SpawnAt = _RandBasePos + [0];
        [_SpawnAt] execvm "spawn\NATO_HQ.sqf";
    };
};