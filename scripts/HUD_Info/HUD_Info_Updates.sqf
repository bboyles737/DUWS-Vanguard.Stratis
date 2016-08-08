// Call specific functions for updates, or call the whole script to update everything.

Update_CP = {
    19 cutRsc ["HUD_CP_Display_Class","PLAIN"];
    disableSerialization;
    _disp = uiNamespace getVariable "HUD_CP_Display";
    _msg = TanColor_Tag + "Command Points: " + "</t>";
    _msg = _msg + str(Player_CP);
    (_disp displayCtrl 3140) ctrlSetStructuredText parseText _msg;
};

HUD_Error_Msg = {
    _ErrorMsg = _this select 0;
    20 cutRsc ["HUD_ErrorMsg_Class","PLAIN"];
    disableSerialization;
    _disp = uiNamespace getVariable "HUD_ErrorMsg_Display";
    _msg = RedColor_Tag + _ErrorMsg + "</t>";
    (_disp displayCtrl 3150) ctrlSetStructuredText parseText _msg;
};

[] call Update_CP;

