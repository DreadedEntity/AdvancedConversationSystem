///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ACSCE_MENU_CLICKED = false;
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