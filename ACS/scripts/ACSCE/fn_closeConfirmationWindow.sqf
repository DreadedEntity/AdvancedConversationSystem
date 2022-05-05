///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

{
	ctrlEnable [_x, false];
	((findDisplay 12345) displayCtrl _x) ctrlSetFade 1;
	((findDisplay 12345) displayCtrl _x) ctrlCommit 0;
} forEach [1013, 1014, 1612, 1613, 1614];