#define ACSCE_TITLE        1400
#define ACSCE_TITLE_SOUND  1401
#define ACSCE_TITLE_LENGTH 1402
#define ACSCE_BODY         1403
#define ACSCE_SOUND        1404
#define ACSCE_BODY_LENGTH  1405
#define ACSCE_CODE         1406
#define ACSCE_PATH         1407
#define ACSCE_CONDITION    1408

class ACS_Editor {
	idd = 12345;
	movingenable = false;

	onLoad = "uiNamespace setVariable ['ACS_CE', (_this select 0)]";
	onKeyDown = "_this call ACSCE_fnc_dialogKeyAction";
	onKeyUp = "_this call ACSCE_fnc_dialogKeyUp";

	class controls {
		////////////////////////////////////////////////////////
		// BEGIN SYSTEM GUI
		////////////////////////////////////////////////////////
		class RscText_1010: RscText {
			idc = 1010;
			text = "v16"; //--- ToDo: Localize;
			x = 0.97427 * safezoneW + safezoneX;
			y = 0.970333 * safezoneH + safezoneY;
			w = 0.0328041 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1000: RscTitle {
			idc = 1000;
			text = "Conversation Editor"; //--- ToDo: Localize;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscListbox_1500: RscTree {
			idc = 1500;
			x = 0.0 * safezoneW + safezoneX;
			y = 0.048 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.958 * safezoneH;
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {0,0,0,1};
			colorPictureDisabled[] = {1,1,1,0.25};
			colorPictureRight[] = {1,1,1,1};
			colorPictureRightSelected[] = {0,0,0,1};
			colorPictureRightDisabled[] = {1,1,1,0.25};

			onTreeSelChanged = "if (ctrlShown ((findDisplay 12345) displayCtrl 1001)) then {ctrlSetText [1400, tvText [1500, tvCurSel 1500]];ctrlSetText [1401, tvData [1500, tvCurSel 1500]];}; systemChat str (tvData [1500, tvCurSel 1500]);";
			onTreeDblClick = "systemChat str (tvValue [1500, _this select 1]);";
//			onMouseMoving = "systemChat str _this;";
			onMouseButtonDown = "_this call ACSCE_fnc_handleMouseClick";
		};
		class RscButton_1600: RscText {
			idc = 1600;
			style = ST_PICTURE;
			fixedWidth = 0;
			text = "ACS\resources\top_close_gs.paa"; //--- ToDo: Localize;
			shadow = 2;
			
			x = 0.9725 * safezoneW + safezoneX;
			y = -0.00399999 * safezoneH + safezoneY;
			w = 0.0262433 * safezoneW;
			h = 0.042 * safezoneH;
			
			onMouseButtonDown = "call ACSCE_fnc_closeEditor";
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,1};
//			colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
			onMouseMoving = "if (_this select 3) then {(_this select 0) ctrlSetTextColor [0.96,0.62,0,1]} else {(_this select 0) ctrlSetTextColor [1,1,1,1]};";
		};
		class RscText_1015: RscText {
			idc = 1015;
			x = 0.103 * safezoneW + safezoneX;
			y = 0.028 * safezoneH + safezoneY;
			w = 0.897 * safezoneW;
			h = 0.02 * safezoneH;
			
			//colorActive[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			
			//onLoad = "(_this select 0) ctrlEnable false;";
		};
		////////////////////////////////////////////////////////
		// END SYSTEM GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN RIGHT MOUSE MENU GUI
		////////////////////////////////////////////////////////
		class RscButton_1601: RscButton {
			idc = 1601;
			style = 0;
			text = "New Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			
			action = "0 call ACSCE_fnc_handleButtons";
		};
		class RscButton_1602: RscButton {
			idc = 1602;
			style = 0;
			text = "Edit Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
						
			action = "1 call ACSCE_fnc_handleButtons";
		};
		class RscButton_1605: RscButton {
			idc = 1605;
			style = 0;
			text = "Move Up"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			
			action = "call ACSCE_fnc_moveUp";
			onLoad = "(_this select 0) ctrlEnable false";
		};
		class RscButton_1606: RscButton {
			idc = 1606;
			style = 0;
			text = "Move Down"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			
			action = "";
			onLoad = "(_this select 0) ctrlEnable false";
		};
		class RscButton_1610: RscButton {
			idc = 1610;
			style = 0;
			text = "Delete Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			
			action = "call ACSCE_fnc_handleDelete";
		};
		////////////////////////////////////////////////////////
		// END RIGHT MOUSE MENU GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN EDIT GUI
		////////////////////////////////////////////////////////
		class RscText_1001: RscTitle {
			idc = 1001;
			text = "Title:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1400: RscEdit {
			text = "ACSCE_TITLE_EDIT";
//			onLoad = "ACSCE_TITLE_EDIT = _this select 0";
			
			idc = ACSCE_TITLE;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1002: RscTitle {
			idc = 1002;
			text = "Title Sound:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1401: RscEdit {
			text = "ACSCE_TITLE_SOUND_EDIT";
//			onLoad = "ACSCE_TITLE_SOUND_EDIT = _this select 0";
			
			idc = ACSCE_TITLE_SOUND;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.177142 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1003: RscTitle {
			idc = 1003;
			text = "Sound Length:"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0984123 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1402: RscEdit {
			text = "ACSCE_TITLE_LENGTH_EDIT";
//			onLoad = "ACSCE_TITLE_LENGTH_EDIT = _this select 0";
			
			idc = ACSCE_TITLE_LENGTH;
			x = 0.598412 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.16402 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1004: RscTitle {
			idc = 1004;
			text = "Body:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1403: RscEdit {
			text = "ACSCE_BODY_EDIT";
//			onLoad = "ACSCE_BODY_EDIT = _this select 0";
			
			idc = ACSCE_BODY;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.247007 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.154 * safezoneH;
			
			style = ST_MULTI;
		};
		class RscText_1005: RscTitle {
			idc = 1005;
			text = "Body Sound:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1404: RscEdit {
			text = "ACSCE_SOUND_EDIT";
//			onLoad = "ACSCE_SOUND_EDIT = _this select 0";
			
			idc = ACSCE_SOUND;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.177142 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1006: RscTitle {
			idc = 1006;
			text = "Body Length:"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1405: RscEdit {
			text = "ACSCE_BODY_LENGTH_EDIT";
//			onLoad = "ACSCE_BODY_LENGTH_EDIT = _this select 0";
			
			idc = ACSCE_BODY_LENGTH;
			x = 0.585291 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.177142 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1007: RscTitle {
			idc = 1007;
			text = "Code:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1406: RscEdit {
			text = "ACSCE_CODE_EDIT";
//			onLoad = "ACSCE_CODE_EDIT = _this select 0";
			
			idc = ACSCE_CODE;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.056 * safezoneH;
			
			style = ST_MULTI;
		};
		class RscText_1008: RscTitle {
			idc = 1008;
			text = "New Path:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1407: RscEdit {
			text = "ACSCE_PATH_EDIT";
//			onLoad = "ACSCE_PATH_EDIT = _this select 0";
			
			idc = ACSCE_PATH;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1009: RscTitle {
			idc = 1009;
			text = "Condition:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1408: RscEdit {
			text = "ACSCE_CONDITION_EDIT";
//			onLoad = "ACSCE_CONDITION_EDIT = _this select 0";
			
			idc = ACSCE_CONDITION;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscButton_1603: RscButton {
			idc = 1603;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.526243 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0796353 * safezoneW;
			h = 0.0340016 * safezoneH;
			
			action = "call ACSCE_fnc_handleAccept";
		};
		class RscButton_1604: RscButton {
			idc = 1604;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.395027 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0796353 * safezoneW;
			h = 0.0340016 * safezoneH;
			
			action = "false call ACSCE_fnc_showEditControls";
		};
		////////////////////////////////////////////////////////
		// END EDIT GUI
		////////////////////////////////////////////////////////

		////////////////////////////////////////////////////////
		// BEGIN SAVE/LOAD CONVERSATION GUI
		////////////////////////////////////////////////////////

		class RscText_1011: RscTitle {
			idc = 1011;
			text = "Load Conversation"; //--- ToDo: Localize;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.268994 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscEdit_1409: RscEdit {
			idc = 1409;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.268994 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscButton_1607: RscButton {
			idc = 1607;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			
			action = "false call ACSCE_fnc_showLoadControls";
		};
		class RscButton_1608: RscButton {
			idc = 1608;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.683703 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			
			action = "call ACSCE_fnc_handleSaveLoadAccept";
		};
		class RscText_1012: RscTitle {
			idc = 1012;
			text = "Known Conversations"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.249311 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscListbox_1501: RscListbox {
			idc = 1501;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.249311 * safezoneW;
			h = 0.42 * safezoneH;
		};
		class RscButton_1611: RscButton {
			idc = 1611;
			text = "Delete"; //--- ToDo: Localize;
			x = 0.585291 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			
			action = "call ACSCE_fnc_handleSaveLoadMiddleButton";
		};
		////////////////////////////////////////////////////////
		// END SAVE/LOAD CONVERSATION GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN CONFIRMATION WINDOW
		////////////////////////////////////////////////////////

		class RscText_1013: RscTitle {
			idc = 1013;
			text = "Confirmation Window"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.314919 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscText_1014: RscText {
			idc = 1014;
			text = "Message Window"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.314919 * safezoneW;
			h = 0.0205 * safezoneH;
			
			colorBackground[] = {0,0,0,0.5};
			style = NO_BORDER + ST_MULTI;
		};
		class RscButton_1612: RscButton {
			idc = 1612;
			text = "Button_NO"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscButton_1613: RscButton {
			idc = 1613;
			text = "Button_Middle"; //--- ToDo: Localize;
			x = 0.454074 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscButton_1614: RscButton {
			idc = 1614;
			text = "Button_YES"; //--- ToDo: Localize;
			x = 0.565608 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// END CONFIRMATION WINDOW
		////////////////////////////////////////////////////////
	};
};