// Adopted from DnA's mapSwitchTextures.sqf

[] spawn {
    ["Map Switch Script running."] call DLog;

    // Wait for the game map to become available
    waitUntil { !isNull findDisplay 12 };
    
    // Activate the "texture" button
    ctrlActivate ((findDisplay 12) displayCtrl 107 );    
};