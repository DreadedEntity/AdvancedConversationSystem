/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_select: %1", _this];
diag_log format ["Path: %1", _this # 1];

params ["_conversation","_path"];
{
	_conversation = (_conversation # 1) # _x;
} forEach _path;
_conversation; //return topic at the input path
//ACS_fnc_select returns the input path