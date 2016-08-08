for [{_x=0},{_x<1000},{_x=_x+1}] do
{
    // Distance from objects: 5
    // Terrain gradient: 0.1
    _foundSafePos = [Map_Center, 0, Map_Half,5,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
    if (_foundSafePos select 0 != 0 && _foundSafePos select 1 !=0) then 
    {
        _MarkerName = format["potential%1%2",round(_foundSafePos select 0),round(_foundSafePos select 1)]; 
        _Marker = createMarker [str(_MarkerName), _foundSafePos];
        _Marker setMarkerShape "ICON";        
        _Marker setMarkerType "mil_destroy";
        _Marker setMarkerColor "ColorBlue";            
    } else { 
        player globalchat "Could not find a safe position.";
    };
    
    // Distance from objects: 2
    // Terrain gradient: 0.5
    _foundSafePos = [Map_Center, 0, Map_Half,2,0,0.5,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;    
    if (_foundSafePos select 0 != 0 && _foundSafePos select 1 !=0) then 
    {
        _MarkerName = format["potential%1%2",round(_foundSafePos select 0),round(_foundSafePos select 1)]; 
        _Marker = createMarker [str(_MarkerName), _foundSafePos];
        _Marker setMarkerShape "ICON";        
        _Marker setMarkerType "mil_destroy";
        _Marker setMarkerColor "ColorRed";            
    } else { 
        player globalchat "Could not find a safe position.";
    };
}; 

player globalchat "Script complete.";