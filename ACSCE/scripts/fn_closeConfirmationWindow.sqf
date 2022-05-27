///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

private _dialog = uiNamespace getVariable "ACS_CE";
{
	ctrlEnable [_x, false];
	(_dialog displayCtrl _x) ctrlSetFade 1;
	(_dialog displayCtrl _x) ctrlCommit 0;
} forEach [1013, 1014, 1612, 1613, 1614];