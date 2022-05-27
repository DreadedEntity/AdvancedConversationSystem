///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_input = _this;
//hint str _this;

disableSerialization;

switch (_this select 1) do {
	case 0: {
		false call ACSCE_fnc_showRightMouseMenu;
	};
	case 1: {
		true call ACSCE_fnc_showRightMouseMenu;
		
		{
			_x ctrlSetPosition [_this # 2, (_this # 3) + (_forEachIndex * (0.02 * safezoneH))];
			_x ctrlCommit 0;
		} forEach (uiNamespace getVariable ["ACSCE_MOUSEMENU", []]);
	};
};