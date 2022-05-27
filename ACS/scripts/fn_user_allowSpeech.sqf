///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_this addAction ["Talk to " + (name _this), {
	_this call ACS_fnc_system_openDialog;
},nil,6, false, true];