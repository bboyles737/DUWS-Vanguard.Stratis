// Spawning function for OPFOR Base
// Comm Station
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Comm Tower
_Tower = ["Land_TTowerBig_2_F", [0.103, -0.081], 19.369] call spawnCollide;

// Barriers
_Barrier1 = ["Land_HBarrier_3_F", [-3.697, -0.844], -69.174] call spawnCollide;
_Barrier2 = ["Land_HBarrier_3_F", [-0.848, -3.424], -157.858] call spawnCollide;
_Barrier3 = ["Land_HBarrier_5_F", [-4.384, -7.191], 14.733] call spawnCollide;
_Barrier4 = ["Land_HBarrier_3_F", [5.279, -3.344], -74.491] call spawnCollide;
_Barrier5 = ["Land_HBarrier_5_F", [-6.265, 5.218], -160.217] call spawnCollide;

// Sandbags
_Sandbag1 = ["Land_BagFence_Corner_F", [5.074, -7.143], 100.939] call spawnCollide;
_SandBag2 = ["Land_BagFence_Long_F", [5.366, -5.425], -78.044] call spawnCollide;
_SandBag3 = ["Land_BagFence_Round_F", [6.550, 3.670], -120.682] call spawnCollide;
_SandBag4 = ["Land_BagFence_Short_F", [-0.781, 6.368], -16.659] call spawnCollide;
_SandBag5 = ["Land_BagFence_Round_F", [-8.589, -5.700], 41.089] call spawnCollide;
_SandBag6 = ["Land_BagFence_Short_F", [-8.789, -3.587], -74.245] call spawnCollide;
_SandBag7 = ["Land_BagFence_Long_F", [-7.217, 1.389], -71.332] call spawnCollide;
_SandBag8 = ["Land_BagFence_Short_F", [1.178, -9.196], 10.132] call spawnCollide;
_SandBag9 = ["Land_BagFence_End_F", [0.991, 6.735], -10.316] call spawnCollide;
_SandBag10= ["Land_BagFence_End_F", [-8.013, -0.916], 109.465] call spawnCollide;

// Other Objects
_Crates1 = ["Land_CratesWooden_F", [-1.587, -1.247], 25.020] call spawnCollide;
_Crates2 = ["Land_CratesWooden_F", [4.541, -5.160], 104.695] call spawnCollide;

// End of script
