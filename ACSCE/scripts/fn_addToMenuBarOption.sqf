///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

private _buttonCode = _this # 2;
_dialog = uiNamespace getVariable "ACS_CE";
_ctrl = _dialog ctrlCreate ["RscText", call ACSCE_fnc_getUnusedIDC];
_ctrl ctrlEnable false;
_ctrl ctrlSetText (_this select 1);
_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
_ctrl ctrlSetTextColor [1,1,1,0.90];
_ctrl ctrlSetBackgroundColor [0,0,0,0.90];


_ctrl ctrlAddEventHandler ["MouseMoving", ACSCE_fnc_menuMouseover];
_ctrl ctrlAddEventHandler ["MouseButtonDown", _buttonCode];
_ctrl ctrlAddEventHandler ["MouseButtonDown", ACSCE_fnc_closeMenu];
_ctrl ctrlAddEventHandler ["MouseButtonUp", {
	ACSCE_CLICK_IGNORE = false;
}];

_menuOptionArray = uiNamespace getVariable [(_this select 0) select 0, []];
_menuOptionArray pushBack _ctrl;
uiNamespace setVariable [(_this select 0) select 0,  _menuOptionArray];
//hint str _menuOptionArray;

_startY = 0.028 * safezoneH + safezoneY;
_parentCtrl = (_this select 0) select 1;
_pos = ctrlPosition _parentCtrl;
{
	_startY = _startY + (0.02 * safeZoneH);
	
	_x ctrlSetPosition [ _pos select 0, _startY, 0.060 * safezoneW, 0.02 * safezoneH ];
	_x ctrlSetFade 1;
	_x ctrlCommit 0;
} forEach _menuOptionArray;
true;