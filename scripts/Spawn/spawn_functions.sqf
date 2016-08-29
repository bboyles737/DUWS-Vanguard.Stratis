// Sets default spawn center location for the spawnCollide function
setDefaultSpawn = {
    spawnCollide = _this select 0;
};

// Function to make spawning easy
// If global var spawnCenter is active, it will use that as the default
spawnCollide = {

    _numArgs = count _this;
    
    _spawnModel = _this select 0;
    _spawnPos = _this select 1;
    _spawnDir = 0;
    _spawnRad = 0;
    _markerArray = objNull;
    
    
    if (spawnCenter != objNull) then {
        _markerArray = spawnCenter;    
    };
    
    
    if (_numArgs > 2) then { _spawnDir = _this select 2};
    if (_numArgs > 3) then { _spawnRad = _this select 3};
    if (_numArgs > 4) then { _markerArray = _this select 4};
    
    _returnObj = createVehicle [_spawnModel, _spawnPos, _markerArray, _spawnRad, "CAN_COLLIDE"];
    _returnObj setDir _spawnDir;
    
    _returnObj;   
};