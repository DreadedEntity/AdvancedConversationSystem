///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

private _cleanup = ["ACSCE_WINDOWMENU","ACSCE_WINDOWMENU_CONTROLS","ACSCE_MAINCONTROLS","ACSCE_MOUSEMENU","ACSCE_EDITMENU","ACSCE_SAVEMENU","ACSCE_CONFIRM"];
_cleanup append (uiNamespace getVariable ["ACSCE_WINDOWMENU",  []]);

_cleanup apply {
	uiNamespace setVariable [_x, nil];
};