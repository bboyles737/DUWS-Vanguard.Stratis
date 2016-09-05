// Spawning function for OPFOR Base
// Barracks
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// HQ
_HQ = ["Land_Cargo_HQ_V2_F", [0.663, 0.667], 16.174] call spawnCollide;

// Barriers
_Barrier1 = ["Land_HBarrier_3_F", [-6.456, -2.243], 106.229] call spawnCollide;
_Barrier2 = ["Land_HBarrier_5_F", [-5.944, -5.914], 17.772] call spawnCollide;
_Barrier3 = ["Land_HBarrier_1_F", [8.293, -0.867], 109.194] call spawnCollide;
_Barrier4 = ["Land_HBarrier_5_F", [0.297, -6.432], 16.171] call spawnCollide;
_Barrier5 = ["Land_HBarrier_5_F", [8.306, 5.434], 196.556] call spawnCollide;
_Barrier6 = ["Land_HBarrier_3_F", [-3.948, 6.276], 106.229] call spawnCollide;
_Barrier7 = ["Land_HBarrier_3_F", [9.688, 4.885], 99.777] call spawnCollide;
_Barrier8 = ["Land_HBarrier_3_F", [6.925, -5.699], 106.884] call spawnCollide;
_Barrier9 = ["Land_HBarrier_1_F", [7.958, -1.953], 105.162] call spawnCollide;
_Barrier10= ["Land_HBarrier_1_F", [9.515, 0.227], 193.590] call spawnCollide;

// End of script
