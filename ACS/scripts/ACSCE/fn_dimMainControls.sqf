///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_controlsArray = [1000, 1500, 1600, 1609];
_menuBarControlsArray = uiNamespace getVariable ["ACSCE_WINDOW_MENU_CONTROLS", []];

switch (_this) do
{
	case true:
	{
		{
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0.75;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach (_controlsArray + _menuBarControlsArray);
	};
	case false:
	{
		{
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach (_controlsArray + _menuBarControlsArray);
	};
	default
	{
		systemChat "You broke my shit.";
	};
};