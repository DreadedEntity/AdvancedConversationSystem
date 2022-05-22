/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_select: %1", _this];

private ["_pathLength","_depth","_target"];

params ["_conv","_path",["_depth",0,[0]]];

_pathLength = count _path;

if (_pathLength > 0) then { //pop first element and run function again until there are none left
	_target = _path # 0;
	_conv = [(_conv # 1) # _target, _path select [1, _pathLength - 1], _depth + 1] call ACS_fnc_system_select;
};

_conv; //return topic at the input path

//ACS_fnc_select returns the input path