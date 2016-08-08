private ["_all","_keyDown"];

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayRemoveAllEventHandlers "KeyDown"; 

_all = [];

/*
// Unbeach boat (Shift+4)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 2 && {_this select 1 == 0x05}) then {_null = [] spawn Script_UnbeachBoat;};"];
_all set [count _all, _keyDown];

// Construction dialog (Shift-C)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 2 && {_this select 1 == 0x2E}) then {_null = [] spawn Script_OpenConstruct;};"];
_all set [count _all, _keyDown];

// Object positioning (Shift-B)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 2 && {_this select 1 == 0x30}) then {_null = [] spawn Script_GID;};"];
*/