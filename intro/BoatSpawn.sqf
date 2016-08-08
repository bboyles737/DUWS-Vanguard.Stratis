// Takes a 3D position array as an argument.  Builds HQ around this center point.
_SpawnAt = _this select 0;
_defaultPos = [10.0, 10.0, 0.0];

// Boat 1
_pos = [-10.0, 0.0, 0.0];
_pos = [_SpawnAt, _pos] call ArraySub;
[format ["Boat1 Spawn: %1, %2", _pos select 0, _pos select 1]] call DLog;
_Boat1 = createVehicle ["B_Boat_Transport_01_F", _pos, [], 0, "CAN_COLLIDE"];

// Boat 2
_pos = [10.0, 0.0, 0.0];
_pos = [_SpawnAt, _pos] call ArraySub;
[format ["Boat2 Spawn: %1, %2", _pos select 0, _pos select 1]] call DLog;
_Boat2 = createVehicle ["B_Boat_Transport_01_F", _pos, [], 0, "CAN_COLLIDE"];

_playerGrp = group player;



//_pos = [_SpawnAt, position player] call ArraySub;
_pos = position player;



// Alpha Team
_ATL = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_TL;
_AAR = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_AR;
_AGR = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_GRN;
_AAT = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_LAT;



// Bravo Team
_BTL = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_TL;
_BAR = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_AR;
_BGR = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_GRN;
_BAT = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_LAT;

// Squad Medic
_Medic = [_pos, NATO_Standard_Tier, _playerGrp] call Spawn_NATO_MED;

sleep 1.0;

_ATL moveInCargo _Boat1;
_AAR moveInCargo _Boat1;
_AGR moveInCargo _Boat1;
_AAT moveInCargo _Boat1;
_ATL assignTeam "RED";
_AAR assignTeam "RED";
_AGR assignTeam "RED";
_AAT assignTeam "RED";
player assignTeam "RED";

_BTL moveInDriver _Boat2;
_BAR moveInCargo _Boat2;
_BGR moveInCargo _Boat2;
_BAT moveInCargo _Boat2;
_Medic moveInCargo _Boat2;
_BTL assignTeam "GREEN";
_BAR assignTeam "GREEN";
_BGR assignTeam "GREEN";
_BAT assignTeam "GREEN";
_Medic assignTeam "GREEN";



_playerGrp setFormation "LINE";

sleep 0.1;

player moveInDriver _Boat1;




/*
_Base_HQ_Building setDir 0;
_Base_HQ_Building setPosATL _pos;

// Base ammo crate (for receiving logistical requests)
_pos = [1801.772095,5554.777832,0];
_pos = [_pos, _baseArray] call ArraySub;
_BaseAmmo = createVehicle ["Box_NATO_AmmoVeh_F", _pos, [], 0, "CAN_COLLIDE"];
_BaseAmmo setDir 360;
_BaseAmmo setPosATL _pos;
clearItemCargo _BaseAmmo;
clearBackpackCargo _BaseAmmo;
clearMagazineCargo _BaseAmmo;
clearWeaponCargo _BaseAmmo;

// Staff officer.
_Base_HQ_Grp = createGroup west;
_pos = [1806.463257,5562.397949,0.603112];
_pos = [_pos, _baseArray] call ArraySub;
_Base_HQ_Officer = _Base_HQ_Grp createUnit ["B_Story_SF_Captain_F", _pos, [], 0, "FORM"];
_Base_HQ_Officer disableAI "AUTOTARGET";
_Base_HQ_Officer setFormDir 180;
RemoveAllWeapons _Base_HQ_Officer;
RemoveGoggles _Base_HQ_Officer;

// Base array information: [Position, Object for Base Supply Crate, Base HQ Officer]
_BaseInfoArray = [(getPos _Base_HQ_Building), _BaseAmmo, _Base_HQ_Officer];
NATO_BaseArray = NATO_BaseArray + [_BaseInfoArray];
_handle = [_BaseInfoArray] execVM "base_management\HQ_Actions.sqf";
sleep 0.1;

// Player position
_pos = [1794.797485,5556.318359,0];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Sign_Arrow_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;



// Map board -- defaults to Altis, but if it detects it is on Stratis, will replace it appropriately.
// You could also use Mapboard_seismic_F
_pos = [1807.845947,5563.0449219,0.574482];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["MapBoard_stratis_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 49.2675;
_object setPosATL _pos;
_object addAction ["Choose Side Mission", ""];


// Desk for the HQ staffer
_pos = [1803.903931,5561.540039,0.576706];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_TableDesk_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0.0156448;
_object setPosATL _pos;



// Staffer needs a computer.
_pos = [1803.688721,5561.358398,1.40];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_Laptop_unfolded_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;
_object enableSimulation false;


// A chair for the staffer
_pos = [1803.966187,5562.871094,0.576666];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_CampingChair_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 360;
_object setPosATL _pos;


// Generator for power - a big one, since this is a FOB after all.
_pos = [1802.171509,5562.462402,-2.0504e-005];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_PowerGenerator_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;


// Fuel cans

_pos = [1801.0802002,5560.820313,0];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_CanisterFuel_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;

_pos = [1801.127441,5560.586426,0];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_CanisterFuel_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;

_pos = [1801.184814,5560.229492,0];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Land_CanisterFuel_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 3.99999;
_object setPosATL _pos;



// Every base needs a flag. 
_pos = [1808.223145,5556.256836,3.26];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Flag_US_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;


// Interior ammo crates
_pos = [1807.348267,5553.317871,0.697088];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Box_NATO_Wps_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0.00143207;
_object setPosATL _pos;


_pos = [1805.674072,5553.515625,0.697093];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Box_NATO_Ammo_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 89.9844;
_object setPosATL _pos;


_pos = [1804.0426025,5553.509277,0.699999];
_pos = [_pos, _baseArray] call ArraySub;
_object = createVehicle ["Box_NATO_Grenades_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 89.9999;
_object setPosATL _pos;

[_Base_HQ_Building, 'Door_1_rot'] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf");
*/
