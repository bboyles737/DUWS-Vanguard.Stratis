// Spawning function for OPFOR Base
// Power Relay
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Comm Relay Tower and Equipment
_RelayTower = ["Land_Communication_F", [0.213, -0.036], 12.576] call spawnCollide;
_TowerTransformer = ["Land_dp_transformer_F", [1.476, 3.950], 192.985] call spawnCollide;
_Cargo1 = ["Land_Cargo20_grey_F", [-1.491, -4.549], 14.735] call spawnCollide;
_RustyWatchTower = ["Land_Cargo_Patrol_V2_F", [-1.331, -4.317], 14.763] call spawnCollide;
_WaterBarrel = ["Land_WaterBarrel_F", [-0.751, 5.376]] call spawnCollide;
_WaterTower = ["Land_WaterTank_F", [6.084, 2.452], 45.442] call spawnCollide;
_TrashBarrel = ["Land_BarrelTrash_F", [-1.595, 5.415]] call spawnCollide;

// Vehicle
_CargoTruck = ["O_Truck_02_covered_F", [-7.372, -3.209], 3.574] call spawnCollide;

// Barriers
_Barrier1 = ["Land_CncWall4_F", [2.093, 6.293], 13.839] call spawnCollide;
_Barrier2 = ["Land_CncWall4_F", [-2.811, 5.123], -34.980] call spawnCollide;
_Barrier3 = ["Land_CncWall1_F", [5.232, 5.039], 46.319] call spawnCollide;
_Barrier4 = ["Land_CncWall1_F", [6.354, 3.773], 42.130] call spawnCollide;
_Barrier5 = ["Land_CncWall1_F", [7.301, 2.787], 51.773] call spawnCollide;
_Barrier6 = ["Land_CncWall1_F", [7.916, 1.204], 94.168] call spawnCollide;
_Barrier7 = ["Land_CncBarrierMedium4_F", [-2.927, -8.449], 13.428] call spawnCollide;
_Barrier8 = ["Land_CncBarrierMedium_F", [6.635, -1.836], 110.495] call spawnCollide;
_Barrier9 = ["Land_CncBarrierMedium_F", [4.177, -7.347], 123.233] call spawnCollide;
_Barrier10= ["Land_CncBarrierMedium_F", [7.555, -6.026], 120.553] call spawnCollide;

// End of script
