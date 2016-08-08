class HUD_CP_Display_Format{
	idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = {0.0,0.0,0.0,0.0};
	colorText[] = {1.0,1.0,1.0,1.0};
	x=safeZoneX;
	y=safeZoneY;
	w=0.4;
	h=0.4;
	size = 0.04;
	text = "Command Points";
};

class HUD_ErrorMsg_Format{
	idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = {0.0,0.0,0.0,0.0};
	colorText[] = {1.0,1.0,1.0,1.0};
	x=0.4;
	y=safeZoneY;
	w=0.4;
	h=0.4;
	size = 0.06;
	text = "Error Msg";
};

class RscTitles
{	
	class HUD_CP_Display_Class
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=10e30;
	  	name="HUD_CmdPoints";
		onLoad = "uiNamespace setVariable ['HUD_CP_Display', _this select 0]";
	  	controls[]={"HUD_CPD"};
	  	class HUD_CPD : HUD_CP_Display_Format
		{
			idc = 3140;
		};
	};
    
    class HUD_ErrorMsg_Class
	{
	  	idd=-1;
	  	movingEnable=0;
	  	duration=5;
	  	name="HUD_ErrorMsg";
		onLoad = "uiNamespace setVariable ['HUD_ErrorMsg_Display', _this select 0]";
	  	controls[]={"HUD_Err"};
	  	class HUD_Err : HUD_ErrorMsg_Format
		{
			idc = 3150;
		};
	};
};