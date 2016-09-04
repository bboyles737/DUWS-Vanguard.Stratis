// Sets default spawn center location for the spawnCollide function
setDefaultSpawn = {
    spawnCenter = _this select 0;
};

// Function to make spawning easy
// If global var spawnCenter is active, it will use that as the default
spawnCollide = {        
    _spawnDir = 0;
    _spawnRad = 0;
    _markerPos = getMarkerPos spawnCenter;         

    params ["_spawnModel", "_offsetPos", "_spawnDir", "_spawnRad"];                   
    
    _actualX = (_offsetPos select 0) + (_markerPos select 0);
    _actualY = (_offsetPos select 1) + (_markerPos select 1);
    _actualZ = 0;
    
    if ( count _offsetPos == 3) then { _actualZ = _offsetPos select 2};
            
    _spawnPos = [_actualX, _actualY, _actualZ];
    
    _returnObj = createVehicle [_spawnModel, _spawnPos, [], _spawnRad, "CAN_COLLIDE"];
    _returnObj setDir _spawnDir;        

    _returnObj;   
};