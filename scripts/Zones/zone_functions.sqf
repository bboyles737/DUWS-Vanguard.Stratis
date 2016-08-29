// CreateZoneMarkers - creates a zone given the following arguments:
// [ID, Position, Side, Size (m), Name]
// Side is SIDE_BLUE (0), SIDE_OPFOR (1), SIDE_IND (2), SIDE_CIV (3), or SIDE_NONE (10).  Defined in DUWS-V.sqf.
CreateZoneMarkers = {
    _thisID = _this select 0;
    _thisLoc = _this select 1;
    _thisSide = _this select 2;
    _zoneSize = _this select 3;
    _zoneName = _this select 4;
    
    [format ["Establishing markers for zone %1.", _thisID]] call DLog;
    
    // Zone name
    _MarkerName = format ["CenterZone%1", _thisID];
    _Marker = createMarker [str(_MarkerName), _thisLoc];    
    _Marker setMarkerShape "ICON";
    _Marker setMarkerType "hd_objective"; 
    _Marker setMarkerSize [0, 0];
    _Marker setMarkerText _zoneName;
    
    // Elliptical zone coloring
    _MarkerName = format["Zone%1", _thisID];
    _ZoneMarker = createMarker [str(_MarkerName), _thisLoc];
    _ZoneMarker setMarkerShape "ELLIPSE";
    _ZoneMarker setMarkerBrush "SolidBorder";    
    _ZoneMarker setMarkerSize [_zoneSize, _zoneSize];
    
    [_Marker, _ZoneMarker, _thisSide] call SetZoneColor;
    
    // Trigger for entry/departure notifications
    _ZoneEntryTrigger = createTrigger["EmptyDetector", _thisLoc];
    _ZoneEntryTrigger triggerAttachVehicle [player];
    _ZoneEntryTrigger setTriggerArea [_zoneSize, _zoneSize, 0, false];
    _ZoneEntryTrigger setTriggerActivation ["VEHICLE", "PRESENT", true];               
    _ZoneEntryTrigger setTriggerStatements ["this", format ["[""%1"", thisList] execvm 'scripts\zones\zone_entrance_notifications.sqf'", _zoneName], ""];    
    
};

// SetZoneColors - sets the color of a zone given the following arguments:
// [TextMarkerName, ZoneMarkerName, Side]
// Side is SIDE_BLUE (0), SIDE_OPFOR (1), SIDE_IND (2), SIDE_CIV (3), or SIDE_NONE (10).  Defined in DUWS-R.sqf.
SetZoneColor = {
  _textMarker = _this select 0;
  _zoneMarker = _this select 1;
  _side = _this select 2;
  
  // These are overwritten by the case statement below
  _setColorTo = "ColorWhite";
  _setAlphaTo = 0.0;
  
  switch (_side) do {
    case SIDE_BLUFOR: { _setColorTo = "ColorBLUFOR";
                        _setAlphaTo = 0.2;};
    case SIDE_OPFOR:  { _setColorTo = "ColorOPFOR";
                        _setAlphaTo = 0.2;};
    case SIDE_IND:    { _setColorTo = "ColorIndependent";
                        _setAlphaTo = 0.2;};
    case SIDE_CIV:    { _setColorTo = "ColorCivilian";
                        _setAlphaTo = 0.2;};
    case SIDE_NONE:   { _setColorTo = "ColorGrey";
                        _setAlphaTo = 0.4;};
  };    
  
  _textMarker setMarkerColor _setColorTo;
  _zoneMarker setMarkerColor _setColorTo;
  _zoneMarker setMarkerAlpha _setAlphaTo;
};

// ChangeZoneControl changes who controls a zone and its associated marker on themap
// [Zone Data Struct, New Side]
// Sides: SIDE_BLUFOR = 0, SIDE_OPFOR = 1, SIDE_IND = 2, SIDE_CIV = 3, SIDE_NONE = 10
ChangeZoneControl = {
  _zone = _this select 0;
  _zoneNum = _zone select 0;
  _newSide = _this select 1;    
  
  _zone set [3, _newSide];
  Zone_Array set [(_zoneNum - 1), _zone];
  
  _centerMarkerName = [_zoneNum] call GetCenterMarker;
  _zoneMarkerName = [_zoneNum] call GetZoneMarker;   
  [_centerMarkerName, _zoneMarkerName, _newSide] call SetZoneColor;
};

// GetCenterMarker returns the marker at the center of the given zone number
// [zone number]
GetCenterMarker = {
    _zoneNumber = _this select 0;    
    _numberOfZones = count Zone_Array;
    if (_zoneNumber > _numberOfZones || _zoneNumber <= 0) then {
        [format ["ERROR!  Can't get center marker for zone %1 because zone array only has %2 entries.", _zoneNumber, _numberOfZones]] call DLog;
        str("ERROR");
    } else {
        _centerMarkerName = format["CenterZone%1", _zoneNumber];
        str(_centerMarkerName);    
    };    
};

// GetZoneMarker returns the marker for the zone area of the given zone number
// [zone number]
GetZoneMarker = {
    _zoneNumber = _this select 0;
    _numberOfZones = count Zone_Array;        
    if (_zoneNumber > _numberOfZones || _zoneNumber <= 0) then {
        [format ["ERROR!  Can't get zone marker for zone %1 because zone array only has %2 entries.", _zoneNumber, _numberOfZones]] call DLog;        
        str("ERROR");
    } else {
        _zoneMarkerName = format["Zone%1", _zoneNumber];
        str(_zoneMarkerName);    
    };              
};
