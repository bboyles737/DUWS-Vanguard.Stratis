class Environment_Settings_Dialog
{
    idd = -1;
	movingenable = false;
    
    class controls 
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by Victor Troska, v1.063, #Miqisu)
        ////////////////////////////////////////////////////////

        class Environment_Background: IGUIBack
        {
            idc = 2200;
            x = 8 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 23 * GUI_GRID_W;
            h = 15 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class Environment_Frame: RscFrame
        {
            idc = 1800;
            text = "Environment Settings"; 
            x = 8.5 * GUI_GRID_W + GUI_GRID_X;
            y = 6 * GUI_GRID_H + GUI_GRID_Y;
            w = 22 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
        };
        class SeasonSelect_Frame: RscFrame
        {
            idc = 1801;
            text = "Season"; 
            x = 9.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class SelectSeason_Menu: RscCombo
        {
            idc = 2100;
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 10.25 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "Select the current season."; 
        };
        class TimeSelect_Frame: RscFrame
        {
            idc = 1802;
            text = "Time of Day"; 
            x = 9.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class TimeSelect_Menu: RscCombo
        {
            idc = 2101;
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 12.75 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "Select the time of day."; 
        };
        class WeatherSelect_Frame: RscFrame
        {
            idc = 1803;
            text = "Weather"; 
            x = 9.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class WeatherSelect_Menu: RscCombo
        {
            idc = 2102;
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 15.25 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "Select the weather pattern for this environment."; 
        };
        class EnvironmentSelect_Button: RscButton
        {
            idc = 1600;
            text = "OK"; 
            x = 17.5 * GUI_GRID_W + GUI_GRID_X;
            y = 17 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            action = "closeDialog 0";
        }; 
        
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};