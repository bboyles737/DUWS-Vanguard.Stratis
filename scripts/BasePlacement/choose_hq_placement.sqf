// Run from game_settings.hpp

// Parameters for generating a random location
_DistFromObject = 20;
_MaxSlope = 0.1;
_SearchDistance = 300;       // Will look for a suitable spot within this distance from the picked point
_LocationFound = false;
Clicked = false;


Base_Type = lbCurSel 2100;
switch (Base_Type) do {
    case Base_FOB: { 
        _DistFromObject = 5;
        _MaxSlope = 0.1; 
        _SearchDistance = 50;
    };    
    
    case Base_Patrol: {         
        _DistFromObject = 2;
        _MaxSlope = 0.5;
        _SearchDistance = 10;
    };    
};

closeDialog 0;

player globalchat format ["Random Params %1, %2, %3", _DistFromObject, _MaxSlope, _SearchDistance];

openMap [true, false]; 
hint "Click on the zone where you want your base to be.";

// Find a random location given the parameters above
while {!_LocationFound} do {
    onMapSingleClick "ClickedPos = _pos; Clicked = true;";
    
    if (Clicked) then {
        // Find the closest zone to the mouse click.
        player globalchat format ["Choosing base location."];

        ClosesetZone = 99999;  
        ClosestPos = [];
        _ClosestDistance = 99999;        
        _Counter = 0;
        {            
            _ZonePos = _x select 0;           
            _Distance = ClickedPos distance _ZonePos;            
            if (_Distance < _ClosestDistance) then {
                _ClosestDistance = _Distance;
                ClosestZone = _Counter;
                ClosestPos = _ZonePos;
            };
            _Counter = _Counter + 1;            
        } forEach Zone_Array;
                       
        player globalchat format ["ClosestPos is %1", ClosestPos];
        
        // Place base near the center of the zone.
        _PickedBasePos = [ClosestPos, 0,_SearchDistance, _DistFromObject,0, _MaxSlope,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
        if (_PickedBasePos select 0 != 0 && _PickedBasePos select 1 != 0) then 
        {
            _Marker = str(format ["CenterZone%1", ClosestZone]);               
            [_Marker, SIDE_BLUE] call ZoneTextColor;
            _ZoneMarker = str(format ["Zone%1", ClosestZone]);
            [_ZoneMarker, SIDE_BLUE] call ZoneAreaColor;
        
            player setpos [(_PickedBasePos select 0) - 10, (_PickedBasePos select 1)];
            openMap [false, false];
            _LocationFound = true;                                           
            _SpawnAt = _PickedBasePos + [0];            
            [_SpawnAt] execvm "spawn\NATO_HQ.sqf";
        }
        else {
            player globalchat format ["Cannot find a suitable base location here!"];
            Clicked = false;
        };                 
    };   

    sleep 0.2;
};

hintSilent "";