["Boat start debug."] call DLog;

clicked = false;
_validLocn = false;
  
OnMapSingleClick "ClickedPos = _pos; clicked = true;";
openMap [true, false]; 

hint "Click on the map to select your starting position.  It must be offshore, away from enemy zones.";

while {!_validLocn} do {
    sleep 0.2;
    if (clicked) then 
    {
        hint "";
    
        _height = getTerrainHeightASL ClickedPos;
        _distance = [ClickedPos] call DistToNearestZone;
        [format ["Clicked at: %1, %2 with height %3 and dist %4", ClickedPos select 0, ClickedPos select 1, _height, _distance]] call DLog;

        
        if (_height < MinDepth_BoatInsert && _distance > MinDistance_BoatInsert) then {
                _MarkerName = format["insertino%1%2", _x, _y]; 
                _Marker = createMarker [str(_MarkerName), ClickedPos];
                _Marker setMarkerShape "ICON";        
                _Marker setMarkerType "hd_start";
                _Marker setMarkerColor "ColorBlue";
                _Marker setMarkerText "Boat Insertion";    
                
                _validLocn = true;
        } else {
            if (_height > 0) then {hint "Must select a location offshore."}
            else 
            {       
                if (_distance < MinDistance_BoatInsert) then {hint "Too close to enemy zone."}
                else {
                    if (_height > MinDepth_BoatInsert) then {hint "Water depth too shallow."};
                };
            };
            clicked = false;
        };
    };
};

["Loop complete."] call DLog;
openMap [false, false];

[ClickedPos] execVM "intro\BoatSpawn.sqf";
