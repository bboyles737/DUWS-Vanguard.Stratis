// Spawning function for OPFOR Base
// Camp Site
// Note: CenterZoneX is the marker for the center of our zone.
// [Zone to spawn]
_zoneNum = _this select 0;

_centerZone = [_zoneNum] call GetCenterMarker;
[_centerZone] call setDefaultSpawn;

// Vehicles and Ammo
_Offroad = ["B_G_Offroad_01_armed_F", [0.541, -4.410], 197.771] call spawnCollide;
_Quad = ["O_Quadbike_01_F", [0.338, 3.615], 211.333] call spawnCollide;
_AmmoBox1 = ["Box_East_AmmoOrd_F", [1.984, 1.968]] call spawnCollide;]
_AmmoBox2 = ["Box_East_Wps_F", [2.673, 0.875], 58.028] call spawnCollide;

// Tents
_Tent1 = ["Land_TentDome_F", [-8.178, 2.185], -164.410] call spawnCollide;
_Tent2 = ["Land_TentDome_F", [-3.252, 5.372], 238.971] call spawnCollide;

// Sleeping Bags and Bedding
_Bag1 = ["Land_Sleeping_bag_brown_folded_F", [-4.408, 4.258], -29.269] call spawn Collide;
_Bag2 = ["Land_Sleeping_bag_brown_folded_F", [-4.215, 3.861], 36.197] call spawnCollide;
_Bag3 = ["Land_Sleeping_bag_brown_folded_F", [-7.620, 0.423], 36.197] call spawnCollide;
_Pillow1 = ["Land_Pillow_camouflage_F", [-4.220, 4.115]] call spawnCollide;

// Other Camp Gear
_Chair1 = ["Land_CampingChair_V1_F", [-0.737, 4.925], 15.489] call spawnCollide;
_Chair2 = ["Land_CampingChair_V1_F", [-4.327, -0.190], -117.252] call spawnCollide;
_Chair3 = ["Land_CampingChair_V1_F", [-6.507, 3.567], -72.408] call spawnCollide;
_Chair4 = ["Land_CampingChair_V1_F", [-3.376, -1.426], -144.310] call spawnCollide;
_Campfire = ["Campfire_burning_F", [-2.473, 0.684]] call spawnCollide;
_Table = ["Land_CampingTable_small_F", [-5.466, 4.239], -10.271] call spawnCollide;
_Workstand = ["Land_WorkStand_F", [2.522, 1.489], 56.699] call spawnCollide;
_Light1 = ["Land_Camping_Light_F", [-5.735, 4.260], 11.110] call spawnCollide;
_Light2 = ["Land_Camping_Light_F", [-7.439, 0.670]] call spawnCollide;
_Radio = ["Land_PortableLongRangeRadio_F", [-5.412, 4.335], 11.110] call spawnCollide;
_Generator = ["Land_Portable_generator_F", [3.847, -1.606], 87.752] call spawnCollide;
_Cord = ["Land_ExtensionCord_F", [3.417, -2.776], 174.214] call spawnCollide;
_Fuel1 = ["Land_CanisterFuel_F", [4.880, -2.071], 88.821] call spawnCollide;
_Fuel2 = ["Land_CanisterFuel_F", [5.214, -2.266], 127.971] call spawnCollide;

// Other Objects
_Woodpile1 = ["Land_WoodPile_F", [-5.261, -0.976], -40.056] call spawnCollide;
_Woodpile2 = ["Land_WoodPile_F", [-5.599, -1.366], 139.780] call spawnCollide;
_Timbers = ["Land_Timbers_F", [3.718, 2.914], -29.986] call spawnCollide;
_Bucket = ["Land_Bucket_clean_F", [-4.505, -1.838]] call spawnCollide;
_Axe = ["Land_Axe_F", [-4.400, -2.227], 13.720] call spawnCollide;
_Grinder = ["Land_Grinder_F", [4.355, -2.164], 40.135] call spawnCollide;
_Gloves = ["Land_Gloves_F", [-4.636, -2.333]] call spawnCollide;
_Pallet = ["Land_Pallet_F", [-5.204, -1.588], 87.241] call spawnCollide;
_Garbage1 = ["Land_Garbage_square3_F", [-5.240, 1.602]] call spawnCollide;
_Garbage2 = ["Land_Garbage_square5_F", [-0.345, -2.375]] call spawnCollide;
_Garbage3 = ["Land_Garbage_square3_F", [-0.104, 2.537]] call spawnCollide;
_Sackheap = ["Land_Sacks_heap_F", [-3.819, -3.304], 12.589] call spawnCollide;

// End of script
