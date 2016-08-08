_WeatherDurationRange = [60 * 60, 180 * 60];     // Min and max time between weather shifts (seconds)
_FogTransitionRange = [10 * 60, 60 * 60];        // Min and max fog fade in time (seconds)
_OvercastTransitionRange = [10 * 60, 20* 60];    // Min and max overcast fade in time (seconds)


WeatherActive = true;

// Weather_Type is set in environment_settings.sqf
// Default values here will be overwritten by the Weather_Type switch
FogIntensity = [0.0, 0.0];
FogAltitudeRange = [0.0, 0.0];
FogDecayRange = [0.0, 0.0];
FogChance = 0;
OvercastIntensity = [0.0, 0.0];

[format ["Weather type at dyn: %1", Weather_Type]] call DLog;

switch (Weather_Type) do {
    case Weather_Arid: 
    {        
        FogIntensity = [0.01, 0.01];
        FogAltitudeRange = [0.01, 0.01];
        FogDecayRange = [0.1, 0.1];
        FogChance = 0;
        
        OvercastIntensity = [0.0, 0.3];
    };
    
    case Weather_Med:
    {
        FogIntensity = [0.0, 0.5];
        FogAltitudeRange = [5, 10];
        FogDecayRange = [0.075, 0.125];
        FogChance = 0.2;
        
        OvercastIntensity = [0.0, 0.6];    
    };
    
    case Weather_Temp:
    {
        FogIntensity = [0.0, 0.8];
        FogAltitudeRange = [7, 15];
        FogDecayRange = [0.065, 0.135];
        FogChance = 0.3;
        
        OvercastIntensity = [0.3, 0.8];
    };
        
    case Weather_Tropical:
    {
        FogIntensity = [0.3, 0.9];
        FogAltitudeRange = [10, 20];
        FogDecayRange = [0.05, 0.15];
        FogChance = 0.3;
        
        OvercastIntensity = [0.0, 1.0];
    };
    
    case Weather_None:
    {   
        WeatherActive = false;
    };       
};



while {WeatherActive} do {    
    _WeatherDuration = _WeatherDurationRange call RandRange;
    _FogTransition = _FogTransitionRange call RandRange;
    _FogIntensity = FogIntensity call RandRange;
    _FogDecay = FogDecayRange call RandRange;
    _FogAltitude = FogAltitudeRange call RandRange;
    
    _OvercastTransition = _OvercastTransitionRange call RandRange;
    _OvercastIntensity = OvercastIntensity call RandRange;
    
    if (random 1 > FogChance) then {
        _FogTransition setFog [0, 0, 0];
        player globalchat "No fog.";
    }
    else { 
        _FogTransition setFog [_FogIntensity, _FogDecay, _FogAltitude];
        player globalchat "Fog active.";
    };
    _OvercastTransition setOvercast _OvercastIntensity;
      
    [format ["Weather change: FogArray %1, Overcast %2, WeatherDuration %3, FogTransition %4, OTransition %5", [_FogIntensity, _FogDecay, _FogAltitude], _OvercastIntensity, _WeatherDuration, _FogTransition, _OvercastTransition]] call DLog;
    
    sleep (_WeatherDuration + _FogTransition);       
};