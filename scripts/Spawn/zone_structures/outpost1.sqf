// Spawning function for OPFOR Base
// Outpost 1
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Bunkers
_Bunker = ["Land_BagBunker_Small_F", [-1.364, -7.026], 21.971] call spawnCollide;

// Supplies
_AmmoBox1 = ["Box_East_Ammo_F", [-3.758, 5.443], 8.430] call spawnCollide;
_AmmoBox2 = ["Box_East_Ammo_F", [-0.866, -8.116], -79.370] call spawnCollide;
_AmmoBox3 = ["Box_East_Ammo_F", [1.829, 6.686]] call spawnCollide;
_AmmoBox4 = ["Box_East_Grenades_F", [0.998, 6.952], 99.495] call spawnCollide;
_AmmoBox5 = ["Box_East_AmmoOrd_F", [2.553, 6.046], 51.509] call spawnCollide;


// Barriers
_Barrier1 = ["Land_CncBarrier_F", [-0.982, 7.874], 104.443] call spawnCollide;
_Barrier2 = ["Land_CncBarrierMedium4_F", [7.185, -2.495], 105.219] call spawnCollide;
_Barrier3 = ["Land_CncBarrierMedium4_F", [-4.590, -6.436], 22.254] call spawnCollide;
_Barrier4 = ["Land_HBarrier_5_F", [0.062, 8.877], 11.900] call spawnCollide;
_Barrier5 = ["Land_HBarrier_5_F", [-9.122, 1.619], 104.530] call spawnCollide;
_Barrier6 = ["Land_CncBarrier_F", [3.486, 5.918], 113.279] call spawnCollide;
_Barrier7 = ["Land_CncBarrierMedium_F", [2.782, 2.148], 13.907] call spawnCollide;
_Barrier8 = ["Land_CncBarrierMedium_F", [0.963, 2.566], 20.570] call spawnCollide;
_Barrier9 = ["Land_CncBarrierMedium_F", [-0.776, 3.415], 10.933] call spawnCollide;

// Sandbags
_SandBag1 = ["Land_BagFence_Long_F", [8.155, 2.671], 90.249] call spawnCollide;
_SandBag2 = ["Land_BagFence_Long_F", [-6.813, -5.317], 204.334] call spawnCollide;
_SandBag3 = ["Land_BagFence_End_F", [-7.895, -4.648], -155.161] call spawnCollide;
_SandBag4 = ["Land_BagFence_Corner_F", [7.619, 7.117], 10.795] call spawnCollide;
_SandBag5 = ["Land_BagFence_Round_F", [-2.303, 9.276], 163.916] call spawnCollide;
_SandBag6 = ["Land_BagFence_Long_F", [-4.196, 7.665], 121.747] call spawnCollide;
_SandBag7 = ["Land_BagFence_Short_F", [5.744, 7.504], -166.942] call spawnCollide;
_SandBag8 = ["Land_BagFence_Short_F", [0.556, -9.223], 5.183] call spawnCollide;
_SandBag9 = ["Land_BagFence_Long_F", [5.245, -7.294], 131.708] call spawnCollide;

// End of script
