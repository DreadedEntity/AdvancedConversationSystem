/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define INFO     0
#define CHILDREN 1

private ["_conv", "_path", "_pathLength", "_target", "_depth"];

_conv = (_this select 0); //conversation in
_path = _this select 1; //tree path in
_depth = [_this, 2, 0, [0]] call BIS_fnc_param;

_pathLength = count _path;

if (_pathLength > 0) then { //pop first element and run function again until there are none left
	_target = _path select 0;
	_conv = [(_conv select 1) select _target, _path select [1, _pathLength - 1], _depth + 1] call ACS_fnc_system_select;
	//hint str _conv;
};

_conv; //return topic at the input path

//ACS_fnc_select returns the input path