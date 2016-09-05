// Spawning function for OPFOR Base
// Research Bunker
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Bunker and associated structures
_ResearchBunker = ["Land_Bunker_F", [-0.809, -2.743], 13.849] call spawnCollide;
_Cargo1 = ["Land_CargoBox_V1_F", [-1.289, 4.064]] call spawnCollide;

// Sand Bags
_SandBag1 = ["Land_BagFence_Long_F", [4.265, 5.231], 18.730] call spawnCollide;
_SandBag2 = ["Land_BagFence_Long_F", [-0.889, 6.603], 11.164] call spawnCollide;
_SandBag3 = ["Land_BagFence_Short_F", [-3.673, -2.216], 191.129] call spawnCollide;
_SandBag4 = ["Land_BagFence_Short_F", [2.085, -3.635], 13.330] call spawnCollide;
_SandBag5 = ["Land_BagFence_Corner_F", [8.035, 3.450], 15.327] call spawnCollide;
_SandBag6 = ["Land_BagFence_Corner_F", [7.054, -1.255], 101.859] call spawnCollide;
_SandBag7 = ["Land_BagFence_End_F", [-7.165, 2.020], -76.518] call spawnCollide;
_SandBag8 = ["Land_BagFence_Round_F", [-5.390, -5.192], 12.319] call spawnCollide;
_SandBag9 = ["Land_BagFence_Round_F", [1.179, -7.902], 12.319] call spawnCollide;

// Barriers and Walls
_Barrier1 = ["Land_HBarrier_1_F", [3.467, 2.749], 12.526] call spawnCollide;
_Barrier2 = ["Land_HBarrier_3_F", [0.099, 3.295], 14.263] call spawnCollide;
_Wall1 = ["Land_Mil_WallBig_4m_F", [5.797, -4.751], 106.182] call spawnCollide;
_Wall2 = ["Land_Mil_WallBig_4m_F", [7.734, 1.592], 108.103] call spawnCollide;
_Wall3 = ["Land_Mil_WallBig_4m_F", [-6.001, 4.906], 286.122] call spawnCollide;
_Wall4 = ["Land_Mil_WallBig_4m_F", [-7.724, -0.908], 286.122] call spawnCollide;

// Lighting
_Light1 = ["Land_LampHarbour_F", [2.972, -3.451], -165.604] call spawnCollide;
_Light2 = ["Land_LampHarbour_F", [-4.515, -1.559], -165.604] call spawnCollide;

// End of script
