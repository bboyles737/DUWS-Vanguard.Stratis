// Center of Map Script
// Original script by Kempco
// Refactored by Victor Troska

// Methodology: Zooms out the map as far as possible, convert the center of the map into world coordinates

disableserialization;
openMap [true, false];
WaitUntil {visibleMap};
//_Map_Size = [-2, -2];

_Map_Display = findDisplay 12;
_Map_Control = _Map_Display displayCtrl 51;
// Temporarily zoom out as much as possible and measure the screen.  [time, zoom, position]
_Map_Control ctrlMapAnimAdd [0, 1000, [9999999999, 9999999999]];
ctrlMapAnimCommit _Map_Control;
waitUntil {ctrlMapAnimDone _Map_Control};
_Map_Size = _Map_Control ctrlMapScreenToWorld [0.5, 0.5];    // Converts screen coordinates to world coordinates    
Map_Center = [(_Map_Size select 0) / 2, (_Map_Size select 1) / 2];

if (Map_Center select 0 > Map_Center select 1) then
    {Map_Half = Map_Center select 0;}
else {Map_Half = Map_Center select 1;};

_Dist_Map_CornerX = (Map_Center select 0) ^ 2;
_Dist_Map_CornerY = (Map_Center select 1) ^ 2;
Dist_Map_Corner = sqrt (_Dist_Map_CornerX + _Dist_Map_CornerY);

[format ["Map size script: Center is %1, Dist to Map Corner is %2", Map_Center, Dist_Map_Corner]] call DLog; 

// Return map to the center of the map and closes it.
_Map_Control ctrlmapAnimAdd [0, 1000, [Map_Center select 0, Map_Center select 1]];
ctrlMapAnimCommit _Map_Control;
waitUntil {ctrlMapAnimDone _Map_Control};
openMap [false, false];
