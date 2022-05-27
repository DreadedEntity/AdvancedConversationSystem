///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_dialog = uiNamespace getVariable "ACS_CE";

//Auto-scaling menubar - Doesn't work and don't want to spend the time to fix it right now, will do it manually in config
//_line = _dialog displayCtrl 1015;
//_currentSize = ctrlPosition _line;
//_newControlWidth = (_this # 1 # 2) / safeZoneW;
//_newLineX = (_currentSize # 0) / safeZoneW - safeZoneX + _newControlWidth;
//_newLineWidth = (_currentSize # 2) / safeZoneW - _newControlWidth;
//_line ctrlSetPosition [
//	_newLineX * safeZoneW + safeZoneX,
//	_currentSize # 1,
//	_newLineWidth,
//	_currentSize # 3
//];
//_line ctrlCommit 0;

_ctrl = _dialog ctrlCreate ["RscText", call ACSCE_fnc_getUnusedIDC];
_ctrl ctrlEnable true;
_ctrl ctrlSetText (_this select 0);
_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
_ctrl ctrlSetTextColor [1,1,1,1];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlSetPosition (_this select 1);
_ctrl ctrlCommit 0;

_mouseEnter = {
	_thisCtrl = (_this select 0);
	_thisCtrl ctrlSetTextColor [0,0,0,1];
	_thisCtrl ctrlSetBackgroundColor [1,1,1,1];
};
_mouseExit = {
	_thisCtrl = (_this select 0);
	_thisCtrl ctrlSetTextColor [1,1,1,1];
	_thisCtrl ctrlSetBackgroundColor [0,0,0,1];
};
_mouseMovingAndHolding = {
	//hint str _this;
	_thisCtrl = (_this select 0);
	if (_this select 3) then {
		_text = ctrlText _thisCtrl;
		_text = 'ACSCE_WINDOWMENU_' + _text;
		{
			private _controlSettings = if (ACSCE_MENU_CLICKED && {_x == _text}) then { [true, 0, 0] } else { [false, 1, 0] };
			{
				_x ctrlEnable (_controlSettings # 0);
				_x ctrlSetFade (_controlSettings # 1);
				_x ctrlCommit (_controlSettings # 2);
			} forEach (uiNamespace getVariable [_x, []]);
		} forEach (uiNamespace getVariable ['ACSCE_WINDOWMENU', []]);
	};
};
_ctrl ctrlAddEventHandler ["MouseMoving", _mouseMovingAndHolding];
_ctrl ctrlAddEventHandler ["MouseHolding", _mouseMovingAndHolding];
_ctrl ctrlAddEventHandler ["MouseEnter", _mouseEnter];
_ctrl ctrlAddEventHandler ["MouseExit", _mouseExit];
_ctrl ctrlAddEventHandler ["MouseButtonDown", {
	false call ACSCE_fnc_showRightMouseMenu;
	if (!ACSCE_CLICK_IGNORE) then {ACSCE_MENU_CLICKED = !ACSCE_MENU_CLICKED; ACSCE_CLICK_IGNORE = true;};
}];
_ctrl ctrlAddEventHandler ["MouseButtonUp", {
	ACSCE_CLICK_IGNORE = false;
}];

_controlsArray = uiNamespace getVariable ["ACSCE_WINDOWMENU_CONTROLS", []];
_controlsArray pushBack _ctrl;
uiNamespace setVariable ["ACSCE_WINDOWMENU_CONTROLS", _controlsArray];

_menuArray = uiNamespace getVariable ["ACSCE_WINDOWMENU", []];
_name = ("ACSCE_WINDOWMENU_" + (_this select 0));
_menuArray pushBack _name;
uiNamespace setVariable ["ACSCE_WINDOWMENU",  _menuArray];
[_name, _ctrl];