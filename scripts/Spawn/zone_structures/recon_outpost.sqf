// Spawning function for OPFOR Base
// Recon Outpost
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Observation tower 
_Watchtower = ["Land_Cargo_Patrol_V1_F", [-0.626, -1.341], 16.653] call spawnCollide;

// Supplies
_Crates = ["Land_CratesWooden_F", [1.677, 0.294], -81.207] call spawnCollide;
_AmmoBox1 = ["Box_East_Ammo_F", [-1.826, -0.507]] call spawnCollide;
_AmmoBox2 = ["Box_East_Grenades_F", [-3.174, -0.235], 108.026] call spawnCollide;

// Barriers
_Barrier1 = ["Land_HBarrier_5_F", [-0.563, 6.643], 15.406] call spawnCollide;
_Barrier2 = ["Land_HBarrier_3_F", [-5.723, 4.806], -36.873] call spawnCollide;
_Barrier3 = ["Land_HBarrier_1_F", [0.313, 1.953], 76.361] call spawnCollide;
_Barrier4 = ["Land_HBarrier_3_F", [-2.206, -5.397], 17.156] call spawnCollide;
_SandBag1 = ["Land_BagFence_Corner_F", [-1.367, -1.180], 106.368] call spawnCollide;
_SandBag2 = ["Land_BagFence_Long_F", [-3.461, -0.678], 193.900] call spawnCollide;
_SandBag3 = ["Land_BagFence_Round_F", [-7.557, 3.923], 106.267] call spawnCollide;
_SandBag4 = ["Land_BagFence_Short_F", [1.227, -7.116], 19.507] call spawnCollide;
_SandBag5 = ["Land_BagFence_Round_F", [3.375, -6.873], -48.301] call spawnCollide;
_SandBag6 = ["Land_BagFence_Long_F", [5.205, -1.240], -72.106] call spawnCollide;
_SandBag7 = ["Land_BagFence_Short_F", [-3.764, -5.519], 16.914] call spawnCollide;
_SandBag8 = ["Land_BagFence_Short_F", [-5.694, -0.162], 193.224] call spawnCollide;
_SandBag9 = ["Land_BagFence_Long_F", [-2.457, 7.961], 20.292] call spawnCollide;
_SandBag10= ["Land_BagFence_Short_F", [5.387, 5.611], 12.876] call spawnCollide;
_SandBag11= ["Land_BagFence_Corner_F", [7.088, 5.218], 11.736] call spawnCollide;

// End of script
