///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_ctrl = (findDisplay 12345) ctrlCreate ["RscText", call ACSCE_fnc_getUnusedIDC];
_ctrl ctrlEnable false;
_ctrl ctrlSetText (_this select 1);
_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
_ctrl ctrlSetTextColor [1,1,1,0.90];
_ctrl ctrlSetBackgroundColor [0,0,0,0.90];


_ctrl ctrlAddEventHandler ["MouseMoving",
"
	hint str _this;
	_thisCtrl = (_this select 0);
	if (_this select 3) then {
		_thisCtrl ctrlSetTextColor [0,0,0,0.90];
		_thisCtrl ctrlSetBackgroundColor [1,1,1,0.90];

	} else {
		_thisCtrl ctrlSetTextColor [1,1,1,0.90];
		_thisCtrl ctrlSetBackgroundColor [0,0,0,0.90];
	};
"];
_ctrl ctrlAddEventHandler ["MouseButtonDown", (_this select 2) +
"
	ACSCE_MENU_CLICKED = false;
	_text = ctrlText _thisCtrl;
	_text = 'ACSCE_' + _text;
	_menuBar = uiNamespace getVariable ['ACSCE_WINDOW_MENU', []]; {
		_menuOptions = uiNamespace getVariable [_x, []]; {
			_x ctrlEnable false;
			_x ctrlSetFade 1;
			_x ctrlCommit 0;
		} forEach _menuOptions;
	} forEach _menuBar;
"];
_ctrl ctrlAddEventHandler ["MouseButtonUp",
"
	ACSCE_CLICK_IGNORE = false;
"];

_menuOptionArray = uiNamespace getVariable [(_this select 0) select 0, []];
_menuOptionArray pushBack _ctrl;
uiNamespace setVariable [(_this select 0) select 0,  _menuOptionArray];
//hint str _menuOptionArray;

_startY = 0.028 * safezoneH + safezoneY;
_parentCtrl = (_this select 0) select 1;
_pos = ctrlPosition _parentCtrl;
{
	_startY = _startY + (0.02 * safeZoneH);
	
	_x ctrlSetPosition
	[
		_pos select 0,
		_startY,
		0.060 * safezoneW,
		0.02 * safezoneH
	];
	_x ctrlSetFade 1;
	_x ctrlCommit 0;
} forEach _menuOptionArray;
true;