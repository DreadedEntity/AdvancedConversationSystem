///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_array = uiNamespace getVariable ["ACSCE_WINDOW_MENU",  []];
{
	uiNamespace setVariable [_x, nil];
} forEach _array;
uiNamespace setVariable ["ACSCE_WINDOW_MENU", nil];

["ACSCE_MAINCONTROLS","ACSCE_MOUSEMENU","ACSCE_EDITMENU","ACSCE_SAVEMENU","ACSCE_CONFIRM"] apply {
	uiNamespace setVariable [_x, nil];
}