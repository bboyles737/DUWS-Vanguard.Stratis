// Spawning function for OPFOR Base
// Outpost 2
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Fortifications
_SandBagBunker = ["Land_BagBunker_Small_F", [0.982, 5.231], 194.415] call spawnCollide;

// Supplies
_AmmoBox1 = ["Box_East_Ammo_F", [-2.977, -6.746], -21.203] call spawnCollide;
_AmmoBox2 = ["Box_East_Ammo_F", [-2.403, -7.306], 53.340] call spawnCollide;
_AmmoBox3 = ["Box_East_AmmoOrd_F", [-9.159, 0.417], 21.457] call spawnCollide;
_AmmoBox4 = ["Box_East_Grenades_F", [6.171, -4.049]] call spawnCollide;
_AmmoBox5 = ["Box_East_Support_F", [5.816, -3.381], -55.929] call spawnCollide;

// Misc Items
_Chair1 = ["Land_ChairPlastic_F", [0.072, -0.307], -84.292] call spawnCollide;
_Chair2 = ["Land_ChairPlastic_F", [0.778, -0.692], -60.391] call spawnCollide;
_Chair3 = ["Land_ChairPlastic_F", [-0.817, -5.746], 128.821] call spawnCollide
_Bench1 = ["Land_Bench_F", [-1.467, 0.406], 112.941] call spawnCollide;
_Barrel1 = ["Land_WaterBarrel_F", [-3.240, 1.342] call spawnCollide;
_WaterTank = ["Land_WaterTank_F", [1.830, -2.256], 114.821] call spawnCollide;

// Barriers
_Barrier1 = ["Land_CncBarrierMedium4_F", [4.610, 0.254], 58.164] call spawnCollide;
_Barrier2 = ["Land_CncBarrierMedium_F", [-2.471, 4.502], 10.936] call spawnCollide;
_Barrier3 = ["Land_CncBarrierMedium_F", [-6.680, 5.096], -5.230] call spawnCollide;
_Barrier4 = ["Land_HBarrier_3_F", [-8.804, -1.221], 36.291] call spawnCollide;
_Barrier5 = ["Land_HBarrier_3_F", [2.301, -6.282], 163.069] call spawnCollide;
_Barrier6 = ["Land_HBarrier_1_F", [-3.917, -5.541], 19.423] call spawnCollide;
_Barrier7 = ["Land_CncBarrier_F", [-6.696, -5.903], 43.520] call spawnCollide;
_Barrier8 = ["Land_Shoot_House_Wall_Crouch_F", [0.897, -5.836], -18.229] call spawnCollide;
_Barrier9 = ["Land_Shoot_House_Wall_Crouch_F", [-7.918, -0.776], 34.012] call spawnCollide;
_Barrier10= ["Land_HBarrier_3_F", [-1.973, -1.092], 209.709] call spawnCollide;
_Barrier11= ["Land_HBarrier_1_F", [-0.747, -1.516], 11.815] call spawnCollide;
_Barrier12= ["Land_HBarrier_1_F", [0.462, -2.096], 26.359] call spawnCollide;
_Barrier13= ["Land_Shoot_House_Wall_Crouch_F", [-1.317, -0.275], 20.989] call spawnCollide;
_Barrier14= ["Land_Shoot_House_Wall_Crouch_F", [-3.123, 0.565], 26.989] call spawnCollide;
_Barrier15= ["Land_Shoot_House_Wall_Crouch_F", [0.502, -1.078], 28.699] call spawnCollide;
    
// Sandbags
_SandBag1 = ["Land_BagFence_Round_F", [-2.855, -7.650], 31.845] call spawnCollide;
_SandBag2 = ["Land_BagFence_Long_F", [-8.908, 2.037], 110.480] call spawnCollide;
_SandBag3 = ["Land_BagFence_End_F", [-0.689, -7.691], -12.400] call spawnCollide;
_SandBag4 = ["Land_BagFence_Short_F", [-8.199, 4.253], -74.497] call spawnCollide;
_SandBag5 = ["Land_BagFence_Round_F", [6.728, -4.531], 282.431] call spawnCollide;
_SandBag6 = ["Land_BagFence_Short_F", [5.369, -5.741], 150.460] call spawnCollide;
_SandBag7 = ["Land_BagFence_Corner_F", [-9.707, 0.116], 201.058] call spawnCollide;
_SandBag8 = ["Land_BagFence_Corner_F", [-0.531, -7.673], 77.842] call spawnCollide;

// End of script
