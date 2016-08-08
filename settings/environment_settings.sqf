_handle = createDialog "Environment_Settings_Dialog";  
//waitUntil {dialog};

// Season selection
Season_Winter = lbAdd[2100, "Winter"];
Season_Spring = lbAdd[2100, "Spring"];
Season_Summer = lbAdd[2100, "Summer (default)"];
Season_Fall = lbAdd[2100, "Fall"];
lbSetCurSel [2100, Season_Summer];

// Time of day selection
Time_Dawn = lbAdd[2101, "Dawn (default)"];
Time_Day = lbAdd[2101, "Day"];
Time_Evening = lbAdd[2101, "Evening"];
Time_Night = lbAdd[2101, "Night"];
lbSetCurSel [2101, Time_Dawn];

// Weather type selection
Weather_Arid = lbAdd[2102, "Arid"];
Weather_Med = lbAdd[2102, "Mediterranean (default)"];
Weather_Temp = lbAdd[2102, "Temperate"];
Weather_Tropical = lbAdd[2102, "Tropical"];
Weather_None = lbAdd[2102, "Disable dynamic weather"];
Weather_Type = -1;
lbSetCurSel [2102, Weather_Med];

_SeasonOffset = 0;      // Offset in fraction of a year, by season
_TimeOffsets = [0, 0];  // Offset to sunrise/sunset times (approximate)

_TimeVariance = 0.35;         // +/-, in hours
_TimeVarRand = random(_TimeVariance * 2) - _TimeVariance;
_NewHour = 0;

while {dialog} do
{   
    
    // Season Selection
    switch (lbCurSel 2100) do {
        case Season_Winter:
        {   _SeasonOffset = -0.1;
            _TimeOffsets = [2.1, -2.1];
        };    
        case Season_Spring:
        {   _SeasonOffset = 0.15;
            _TimeOffsets = [1.15, -1.15];
        };
        case Season_Summer:
        {   _SeasonOffset = 0.40;
            _TimeOffsets = [0, 0];
        };    
        case Season_Fall:
        {   _SeasonOffset = 0.65; 
            _TimeOffsets = [1.05, -1.05];
        };    
    };
    
    
    // Time of day selection
    switch (lbCurSel 2101) do {
        case Time_Dawn: 
        { _NewHour = 5 + (_TimeOffsets select 0) + _TimeVarRand;      
        };        
        case Time_Day:
        { _NewHour = 12 + (_TimeVarRand * 10);      // Wider variance  
        };        
        case Time_Evening:
        { _NewHour = 18.5 + (_TimeOffsets select 1) + _TimeVarRand;      
        };
        case Time_Night:
        { _NewHour = 1 + (_TimeVarRand * 10);       // Wider variance
        };
    }; 

    Weather_Type = lbCurSel 2102;
    
    sleep 0.1;       
};

// Sets date and time
_SeasonOffset = _SeasonOffset + random(0.25);
if (_SeasonOffset < 0) then {_SeasonOffset = _SeasonOffset + 1;};
_CurrentDate = numberToDate [2035, _SeasonOffset];

_NewMinute = floor((_NewHour % 1) * 60);
_NewHour = floor(_NewHour);

_CurrentDate set [3, _NewHour];
_CurrentDate set [4, _NewMinute];

setDate _CurrentDate;
//[] execVM "scripts\ShowOSD\SITREP_Info.sqf";

// Weather type
["Time and date updated."] call DLog;

DialogWaitFlag = true;

if (!WeatherActive) then {
    ["Initializing dynamic weather script"] call DLog;
    WeatherScript = [] execVM "scripts\Weather\dynamic_weather.sqf";}
else {
    ["Restarting dynamic weather script"] call DLog;
    terminate WeatherScript;
    WeatherScript = [] execVM "scripts\Weather\dynamic_weather.sqf";
};