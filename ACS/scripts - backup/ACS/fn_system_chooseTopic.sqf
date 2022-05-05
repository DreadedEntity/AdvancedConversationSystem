/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

_data = call compile (lbData [1500, _this select 1]);

{
	((findDisplay 69) displayCtrl _x) ctrlSetFade 0.75;
	((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
	ctrlEnable [_x, false]
} forEach [1500, 1000, 1002];

_data spawn ACS_fnc_system_execute;