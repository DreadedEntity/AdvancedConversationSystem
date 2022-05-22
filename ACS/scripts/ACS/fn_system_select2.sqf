/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_select: %1", _this];

params ["_conversation","_path"];
{
	_conv = (_conv # 1) # _x;
} forEach _path;
_conv; //return topic at the input path
//ACS_fnc_select returns the input path