class AdvancedConversationSystem
{
	idd = 69;
	movingenable = false;

	onLoad = "uiNamespace setVariable ['ACS', (_this select 0)]";

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by DreadedEntity, v1.063, #Sodaqe)
		////////////////////////////////////////////////////////
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.507964 * safezoneW + safezoneX;
			y = 0.414996 * safezoneH + safezoneY;
			w = 0.103526 * safezoneW;
			h = 0.272013 * safezoneH;
			
			onLBDblClick = "_this spawn ACS_fnc_system_execute;";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "test"; //--- ToDo: Localize;
			x = -0.00170207 * safezoneW + safezoneX;
			y = 0.414996 * safezoneH + safezoneY;
			w = 0.509666 * safezoneW;
			h = 0.0340016 * safezoneH;
			
			style = ST_RIGHT;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "test_dialogue"; //--- ToDo: Localize;
			x = 0.332766 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.350395 * safezoneW;
			h = 0.136006 * safezoneH;
			
			style = ST_MULTI + ST_CENTER + NO_BORDER;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			x = 0.507964 * safezoneW + safezoneX;
			y = 0.414997 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0.272013 * safezoneH;
			
			style = 178;
			colorText[] = {1,1,1,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};