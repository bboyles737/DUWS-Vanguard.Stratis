// Spawning function for OPFOR Base
// Research Station
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Create structures
_House1 = ["Land_Cargo_House_V1_F", [-1.827, 0.920], -74.556] call spawnCollide;
_Toilet1 = ["Land_FieldToilet_F", [-5.051, -1.687], 15.579] call spawnCollide;

// Create barriers
_Barrier1 = ["Land_HBarrier_5_F", [-5.269, 4.27], 104.750] call spawnCollide;
_Barrier2 = ["Land_HBarrier_3_F", [-2.230, 4.999], 15.887] call spawnCollide;
_Barrier3 = ["Land_HBarrier_1_F", [-3.736, 5.043], 103.437] call spawnCollide;
_Barrier4 = ["Land_CncBarrierMedium_F", [4.091, 5.857], 16.499] call spawnCollide;
_Barrier5 = ["Land_CncBarrierMedium4_F", [-4.131, -5.419], 15.333] call spawnCollide;
_Barrier6 = ["Land_CncBarrierMedium_F", [5.909, 5.292], 11.829] call spawnCollide;
_Barrier7 = ["Land_CncBarrierMedium_F", [2.256, 6.773]] call spawnCollide;

// Create canisters and containers
_Canister1 = ["Land_CanisterPlastic_F", [-0.349, -0.098], 138.447] call spawnCollide;
_Canister2 = ["Land_CanisterPlastic_F", [-0.530, -0.554], 192.667] call spawnCollide;
_Container1 = ["Land_Cargo20_grey_F", [3.761, -3.921], -58.979] call spawnCollide;
_Barrel1 = ["Land_WaterBarrel_F", [-0.506, -1.361]] call spawnCollide;
_WaterTank = ["Land_WaterTank_F", [5.765, -0.712], 30.685] call spawnCollide;

// Misc items
_Bench1 = ["Land_Bench_F", [1.305, 3.154], 14.868] call spawnCollide;

// End of script
