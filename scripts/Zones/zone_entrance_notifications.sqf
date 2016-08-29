_zoneName = _this select 0;
_zoneTrigger = _this select 1;

// Notifications are defined under scripts\zones\zone_notifications.hpp

// Zone entrance notification
sleep 0.5;
["Enter_Location", [_zoneName]] call bis_fnc_showNotification;

// Waits until you leave the zone to display exit notification
waitUntil {
    sleep 1.0;
    count _zoneTrigger < 1;     // _zoneTrigger is 0 (false) 
};
["Leave_Location", [_zoneName]] call bis_fnc_showNotification;