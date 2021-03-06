// Spawning function for OPFOR Base
// Vehicle Refit Station
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Create pipes
_Pipes1 = ["Land_IronPipes_F", [6.741, -2.266], -88.125] call spawnCollide;
_Pipes2 = ["Land_Pipes_large_F", [4.652, -3.917], -78.031] call spawnCollide;
_Pipes3 = ["Land_Pipes_small_F", [5.511, -0.156], 99.290] call spawnCollide;

// Create barrels
_Barrel1 = ["Land_MetalBarrel_F", [-7.295, 1.972]] call spawnCollide;
_Barrel2 = ["Land_MetalBarrel_empty_F", [-6.917, 1.280]] call spawnCollide;
_Barrel3 = ["Land_WaterBarrel_F", [-6.110, 2.032]] call spawnCollide;
_Barrel4 = ["Land_MetalBarrel_F", [-8.340, 3.428]] call spawnCollide;
_Barrel5 = ["Land_MetalBarrel_F", [-6.235, 3.290]] call spawnCollide;
_Barrel6 = ["Land_WaterBarrel_F", [-7.318, 3.487]] call spawnCollide;
_Barrel7 = ["Land_WaterBarrel_F", [-7.847, 4.727]] call spawnCollide;
_Barrel8 = ["Land_BarrelSand_F", [13.370, -3.987]] call spawnCollide;
_Barrel9 = ["Land_BarrelSand_F", [4.294, 7.457]] call spawnCollide;
_Barrel10 = ["Land_MetalBarrel_empty_F", [13.235, -4.676]] call spawnCollide;
_Barrel11 = ["Land_MetalBarrel_empty_F", [9.028, -5.737]] call spawnCollide;
_Barrel12 = ["Land_MetalBarrel_F", [7.928, -3.239]] call spawnCollide;


// Cargo boxes
_Box1 = ["Land_CargoBox_V1_F", [1.261, -9.449], 23.663] call spawnCollide;
_Box2 = ["Land_Cargo20_military_green_F", [-9.367, -0.206], 96.250] call spawnCollide;
_Box3 = ["Land_Cargo20_grey_F", [11.994, -9.138], 95.525] call spawnCollide;
_VehAmmoBox1 = ["Box_East_AmmoVeh_F", [5.359, 5.950]] call spawnCollide;
_VehAmmoBox2 = ["Box_East_AmmoVeh_F", [-11.154, 4.164], 15.017] call spawnCollide;
_AmmoBox = ["O_supplyCrate_F", [-0.729, -5.101, 1.385], 64.221] call spawnCollide;

// Other objects
_WaterTank = ["Land_WaterTank_F", [-7.191, -1.378], 106.685] call spawnCollide;
_Girder = ["Land_Girder_F", [4.454, -1.408], -113.070] call spawnCollide;
_Pallet = ["Land_Pallet_F", [-5.502, 0.240]] call spawnCollide;
_Workstand = ["Land_WorkStand_F", [-6.261, -2.578], 126.171] call spawnCollide;
_Tires = ["Land_Tyres_F", [4.943, 2.870], 60.680] call spawnCollide;
_Bench1 = ["Land_Bench_F", [-2.875, 0.721], 96.608] call spawnCollide;
_Bench2 = ["Land_Bench_F", [0.817, -4.913], 180.328] call spawnCollide;
_Tunnel = ["Land_Shoot_House_Tunnel_Crouch_F", [-0.739, -5.167], 5.500] call spawnCollide;

// Vehicles at repair shop
_Truck1 = ["O_Truck_02_transport_F", [-3.300, -3.157], 187.681] call spawnCollide;
_Truck2 = ["O_Truck_02_covered_F", [-4.018, 5.667], 141.584] call spawnCollide;
_MRAP = ["O_MRAP_02_F", [10.287, 3.068], -9.114] call spawnCollide;
_WreckedTruck = ["Land_Wreck_Truck_dropside_F", [4.677, -8.563], 30.310] call spawnCollide;


// Barriers
_Barrier1 = ["Land_CncBarrier_F", [1.376, -11.554], 14.828] call spawnCollide;
_Barrier2 = ["Land_CncBarrier_F", [-3.239, -10.439], 11.767] call spawnCollide;
_Barrier3 = ["Land_CncBarrier_F", [-8.433, -9.001], 16.198] call spawnCollide;
_Barrier4 = ["Land_CncBarrierMedium_F", [-9.721, -7.516], 93.624] call spawnCollide;
_Barrier5 = ["Land_CncBarrierMedium4_F", [-4.231, -14.096], 190.205] call spawnCollide;
_Barrier6 = ["Land_CncBarrierMeidum_F", [-9.254, 4.424], 100.541] call spawnCollide;
_Barrier7 = ["Land_CncBarrierMedium_F", [5.655, -11.867], 133.020] call spawnCollide;
_Barrier8 = ["Land_CncBarrierMedium_F", [7.602, -9.171], 108.549] call spawnCollide;
_Barrier9 = ["Land_CncBarrierMedium_F", [8.121, -7.178], 101.438] call spawnCollide;
_Barrier10 = ["Land_CncBarrierMedium_F", [8.114, -5.185], 103.707] call spawnCollide;
_Barrier11 = ["Land_CncBarrierMedium_F", [6.644, 2.645], 84.502] call spawnCollide;
_Barrier12 = ["Land_CncBarrierMedium_F", [6.582, 6.039], 272.201] call spawnCollide;
_Barrier13 = ["Land_CncBarrierMedium_F", [-9.621, -4.251], 101.573] call spawnCollide;
_Barrier14 = ["Land_CncWall4_F", [14.391, 1.106], 86.020] call spawnCollide;
_Barrier15 = ["Land_CncWall4_F", [13.905, -5.833], 93.953] call spawnCollide;
_Barrier16 = ["Land_CncWall1_F", [13.839, -9.430], 100.028] call spawnCollide;
_Barrier17 = ["Land_CncWall1_F", [13.484, -10.375], 94.123] call spawnCollide;
_Barrier18 = ["Land_CncWall1_F", [16.201, -2.564], 87.529] call spawnCollide;
_Barrier19 = ["Land_CncBarrierMedium_F", [13.713, 5.228]] call spawnCollide;
_Barrier20 = ["Land_CncBarrierMedium_F", [13.550, 7.220]] call spawnCollide;
_Barrier21 = ["Land_CncBarrier_F", [-9.018, 7.453]] call spawnCollide;

// End of script
