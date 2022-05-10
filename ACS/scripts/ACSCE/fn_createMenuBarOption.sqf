///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_dialog = uiNamespace getVariable "ACS_CE";
_ctrl = _dialog ctrlCreate ["RscText", call ACSCE_fnc_getUnusedIDC];
_ctrl ctrlEnable true;
_ctrl ctrlSetText (_this select 0);
_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
_ctrl ctrlSetTextColor [1,1,1,1];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlSetPosition (_this select 1);
_ctrl ctrlCommit 0;

_mouseMovingAndHolding = {
	//hint str _this;
	_thisCtrl = (_this select 0);
	if (_this select 3) then {
		_thisCtrl ctrlSetTextColor [0,0,0,1];
		_thisCtrl ctrlSetBackgroundColor [1,1,1,1];
		if (ACSCE_MENU_CLICKED) then {
			_text = ctrlText _thisCtrl;
			_text = 'ACSCE_' + _text;
			_menuBar = uiNamespace getVariable ['ACSCE_WINDOW_MENU', []];
			{
				_menuOptions = uiNamespace getVariable [_x, []];
				private _controlSettings = [false, 1, 0];
				if (_x == _text) then {
					_controlSettings = [true, 0, 0];
				};
				{
					_x ctrlEnable (_controlSettings # 0);
					_x ctrlSetFade (_controlSettings # 1);
					_x ctrlCommit (_controlSettings # 2);
				} forEach _menuOptions;
			} forEach _menuBar;
		} else {
			_text = ctrlText _thisCtrl;
			_text = 'ACSCE_' + _text;
			_menuBar = uiNamespace getVariable ['ACSCE_WINDOW_MENU', []];
			{
				_menuOptions = uiNamespace getVariable [_x, []];
				{
					_x ctrlEnable false;
					_x ctrlSetFade 1;
					_x ctrlCommit 0;
				} forEach _menuOptions;
			} forEach _menuBar;
		};
	} else {
		_thisCtrl ctrlSetTextColor [1,1,1,1];
		_thisCtrl ctrlSetBackgroundColor [0,0,0,1];
	};
};
_ctrl ctrlAddEventHandler ["MouseMoving", _mouseMovingAndHolding];
_ctrl ctrlAddEventHandler ["MouseHolding", _mouseMovingAndHolding];
_ctrl ctrlAddEventHandler ["MouseButtonDown", {
	false call ACSCE_fnc_showRightMouseMenu;
	if (!ACSCE_CLICK_IGNORE) then {ACSCE_MENU_CLICKED = !ACSCE_MENU_CLICKED; ACSCE_CLICK_IGNORE = true;};
}];
_ctrl ctrlAddEventHandler ["MouseButtonUp", {
	ACSCE_CLICK_IGNORE = false;
}];

_menuArray = uiNamespace getVariable ["ACSCE_WINDOW_MENU", []];
_name = ("ACSCE_" + (_this select 0));
_menuArray pushBack _name;
uiNamespace setVariable ["ACSCE_WINDOW_MENU",  _menuArray];
[_name, _ctrl];