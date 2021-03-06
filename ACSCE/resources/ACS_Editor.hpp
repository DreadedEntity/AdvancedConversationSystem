#define ACSCE_TITLE        1400
#define ACSCE_TOPIC        1401
#define ACSCE_MENU_NAME    1402
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
		class RscText_1010: ACSText {
			idc = 1010;
			text = "v16"; //--- ToDo: Localize;
			x = 0.97427 * safezoneW + safezoneX;
			y = 0.970333 * safezoneH + safezoneY;
			w = 0.0328041 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_MAINCONTROLS'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1000: ACSTitle {
			idc = 1000;
			text = "Conversation Editor"; //--- ToDo: Localize;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.028 * safezoneH;
			onMouseButtonDown = "call ACSCE_fnc_closeMenu; false call ACSCE_fnc_showRightMouseMenu; ctrlSetFocus (displayCtrl 1600);";
			onMouseButtonDblClick = "ctrlSetFocus (displayCtrl 1600)";
			onLoad = "[_this # 0, 'ACSCE_MAINCONTROLS'] call ACSCE_fnc_addToControlGroup";
		};
		class RscListbox_1500: ACSTree {
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

			onTreeSelChanged = "if (ctrlShown ((findDisplay 12345) displayCtrl 1001)) then {ctrlSetText [1400, tvText [1500, tvCurSel 1500]];ctrlSetText [1401, tvData [1500, tvCurSel 1500]];}; systemChat str (tvData [1500, tvCurSel 1500]);ACSCE_MENU_CLICKED = false;";
			//onTreeDblClick = "systemChat str (tvValue [1500, _this select 1]);";
			onMouseButtonDown = "_this call ACSCE_fnc_handleMouseClick; call ACSCE_fnc_closeMenu;";
			onLoad = "[_this # 0, 'ACSCE_MAINCONTROLS'] call ACSCE_fnc_addToControlGroup; uiNamespace setVariable ['ACSCE_MAINTREE', _this # 0]";
		};
		class RscButton_1600: ACSText {
			idc = 1600;
			style = ST_PICTURE;
			fixedWidth = 0;
			text = "ACSCE\resources\top_close_gs.paa"; //--- ToDo: Localize;
			shadow = 2;
			
			x = 0.979 * safezoneW + safezoneX;
			y = -0.007 * safezoneH + safezoneY;
			w = 0.023625 * safezoneW;
			h = 0.042 * safezoneH;
			
			onMouseButtonDown = "call ACSCE_fnc_closeEditor";
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,1};
//			colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
			onMouseMoving = "if (_this select 3) then {(_this select 0) ctrlSetTextColor [0.96,0.62,0,1]} else {(_this select 0) ctrlSetTextColor [1,1,1,1]};";
			onLoad = "[_this # 0, 'ACSCE_MAINCONTROLS'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1015: ACSText {
			idc = 1015;
			x = 0.094 * safezoneW + safezoneX;
			y = 0.028 * safezoneH + safezoneY;
			w = 0.906 * safezoneW;
			h = 0.02 * safezoneH;
			//colorActive[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			onLoad = "[_this # 0, 'ACSCE_MAINCONTROLS'] call ACSCE_fnc_addToControlGroup";
		};
		////////////////////////////////////////////////////////
		// END SYSTEM GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN RIGHT MOUSE MENU GUI
		////////////////////////////////////////////////////////
		class RscButton_1601: ACSButton {
			idc = 1601;
			style = 0;
			text = "New Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			action = "0 call ACSCE_fnc_handleButtons";
			onLoad = "[_this # 0, 'ACSCE_MOUSEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1602: ACSButton {
			idc = 1602;
			style = 0;
			text = "Edit Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			action = "1 call ACSCE_fnc_handleButtons";
			onLoad = "[_this # 0, 'ACSCE_MOUSEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1605: ACSButton {
			idc = 1605;
			style = 0;
			text = "Move Up"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			action = "'up' call ACSCE_fnc_move";
			onLoad = "[_this # 0, 'ACSCE_MOUSEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1606: ACSButton {
			idc = 1606;
			style = 0;
			text = "Move Down"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			action = "'down' call ACSCE_fnc_move";
			onLoad = "[_this # 0, 'ACSCE_MOUSEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1610: ACSButton {
			idc = 1610;
			style = 0;
			text = "Delete Topic"; //--- ToDo: Localize;
			x = 0.165312 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.02 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
			action = "call ACSCE_fnc_handleDelete";
			onLoad = "[_this # 0, 'ACSCE_MOUSEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		////////////////////////////////////////////////////////
		// END RIGHT MOUSE MENU GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN EDIT GUI
		////////////////////////////////////////////////////////
		class RscFrame_1800: ACSBackground {
			idc = 1800;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.524866 * safezoneW;
			h = 0.384002 * safezoneH;
			neverEnable = true;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1001: ACSTitle {
			idc = 1001;
			text = "Title:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1400: ACSEdit {
			text = "ACSCE_TITLE_EDIT";
			idc = ACSCE_TITLE;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1002: ACSTitle {
			idc = 1002;
			text = "Topic Name:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1401: ACSEdit {
			text = "ACSCE_TOPIC_EDIT";
			idc = ACSCE_TOPIC;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1003: ACSTitle {
			idc = 1003;
			text = "Menu Name:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1402: ACSEdit {
			text = "ACSCE_TITLE_LENGTH_EDIT";
			idc = ACSCE_MENU_NAME;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1004: ACSTitle {
			idc = 1004;
			text = "Body:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1403: ACSEdit {
			text = "ACSCE_BODY_EDIT";
			idc = ACSCE_BODY;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.154 * safezoneH;
			style = ST_MULTI;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		//class RscText_1005: ACSTitle {
		//	idc = 1005;
		//	text = "Body Sound:"; //--- ToDo: Localize;
		//	x = 0.237567 * safezoneW + safezoneX;
		//	y = 0.402 * safezoneH + safezoneY;
		//	w = 0.0852906 * safezoneW;
		//	h = 0.028 * safezoneH;
		//	onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		//};
		//class RscEdit_1404: ACSEdit {
		//	text = "ACSCE_SOUND_EDIT";
		//	idc = ACSCE_SOUND;
		//	x = 0.322858 * safezoneW + safezoneX;
		//	y = 0.402 * safezoneH + safezoneY;
		//	w = 0.177142 * safezoneW;
		//	h = 0.028 * safezoneH;
		//	onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		//};
		//class RscText_1006: ACSTitle {
		//	idc = 1006;
		//	text = "Body Length:"; //--- ToDo: Localize;
		//	x = 0.5 * safezoneW + safezoneX;
		//	y = 0.402 * safezoneH + safezoneY;
		//	w = 0.0852906 * safezoneW;
		//	h = 0.028 * safezoneH;
		//	onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		//};
		//class RscEdit_1405: ACSEdit {
		//	text = "ACSCE_BODY_LENGTH_EDIT";
		//	idc = ACSCE_BODY_LENGTH;
		//	x = 0.585291 * safezoneW + safezoneX;
		//	y = 0.402 * safezoneH + safezoneY;
		//	w = 0.177142 * safezoneW;
		//	h = 0.028 * safezoneH;
		//	onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		//};
		class RscText_1007: ACSTitle {
			idc = 1007;
			text = "Code:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1406: ACSEdit {
			text = "ACSCE_CODE_EDIT";
			idc = ACSCE_CODE;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.056 * safezoneH;
			style = ST_MULTI;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1008: ACSTitle {
			idc = 1008;
			text = "New Path:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1407: ACSEdit {
			text = "ACSCE_PATH_EDIT";
			idc = ACSCE_PATH;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1009: ACSTitle {
			idc = 1009;
			text = "Condition:"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.0852906 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1408: ACSEdit {
			text = "ACSCE_CONDITION_EDIT";
			idc = ACSCE_CONDITION;
			x = 0.322858 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.439575 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_EDITTEXTBOXES'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1603: ACSButton {
			idc = 1603;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.526243 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0796353 * safezoneW;
			h = 0.0340016 * safezoneH;
			action = "call ACSCE_fnc_handleAccept";
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1604: ACSButton {
			idc = 1604;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.395027 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.0796353 * safezoneW;
			h = 0.0340016 * safezoneH;
			action = "false call ACSCE_fnc_showEditControls";
			onLoad = "[_this # 0, 'ACSCE_EDITMENU'] call ACSCE_fnc_addToControlGroup";
		};
		////////////////////////////////////////////////////////
		// END EDIT GUI
		////////////////////////////////////////////////////////

		////////////////////////////////////////////////////////
		// BEGIN SAVE/LOAD CONVERSATION GUI
		////////////////////////////////////////////////////////

		class RscText_1011: ACSTitle {
			idc = 1011;
			text = "Load Conversation"; //--- ToDo: Localize;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.268994 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscEdit_1409: ACSEdit {
			idc = 1409;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.268994 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1607: ACSButton {
			idc = 1607;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.493439 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			action = "false call ACSCE_fnc_showLoadControls";
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1608: ACSButton {
			idc = 1608;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.683703 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			action = "call ACSCE_fnc_handleSaveLoadAccept";
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1012: ACSTitle {
			idc = 1012;
			text = "Saved Conversations"; //--- ToDo: Localize;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.249311 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscListbox_1501: ACSListbox {
			idc = 1501;
			x = 0.237567 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.249311 * safezoneW;
			h = 0.42 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1611: ACSButton {
			idc = 1611;
			text = "Delete"; //--- ToDo: Localize;
			x = 0.585291 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.0787298 * safezoneW;
			h = 0.028 * safezoneH;
			action = "call ACSCE_fnc_handleSaveLoadMiddleButton";
			onLoad = "[_this # 0, 'ACSCE_SAVEMENU'] call ACSCE_fnc_addToControlGroup";
		};
		////////////////////////////////////////////////////////
		// END SAVE/LOAD CONVERSATION GUI
		////////////////////////////////////////////////////////
		
		////////////////////////////////////////////////////////
		// BEGIN CONFIRMATION WINDOW
		////////////////////////////////////////////////////////

		class RscText_1013: ACSTitle {
			idc = 1013;
			text = "Confirmation Window"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.314919 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_CONFIRM'] call ACSCE_fnc_addToControlGroup";
		};
		class RscText_1014: ACSText {
			idc = 1014;
			text = "Message Window"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.314919 * safezoneW;
			h = 0.0205 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			style = NO_BORDER + ST_MULTI;
			onLoad = "[_this # 0, 'ACSCE_CONFIRM'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1612: ACSButton {
			idc = 1612;
			text = "Button_NO"; //--- ToDo: Localize;
			x = 0.34254 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_CONFIRM'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_CONFIRM_BUTTONS'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1613: ACSButton {
			idc = 1613;
			text = "Button_Middle"; //--- ToDo: Localize;
			x = 0.454074 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_CONFIRM'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_CONFIRM_BUTTONS'] call ACSCE_fnc_addToControlGroup";
		};
		class RscButton_1614: ACSButton {
			idc = 1614;
			text = "Button_YES"; //--- ToDo: Localize;
			x = 0.565608 * safezoneW + safezoneX;
			y = 0.2975 * safezoneH + safezoneY;
			w = 0.0918515 * safezoneW;
			h = 0.028 * safezoneH;
			onLoad = "[_this # 0, 'ACSCE_CONFIRM'] call ACSCE_fnc_addToControlGroup; [_this # 0, 'ACSCE_CONFIRM_BUTTONS'] call ACSCE_fnc_addToControlGroup";
		};
		////////////////////////////////////////////////////////
		// END CONFIRMATION WINDOW
		////////////////////////////////////////////////////////
	};
};