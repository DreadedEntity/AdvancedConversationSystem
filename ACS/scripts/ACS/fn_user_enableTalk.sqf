/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

_this addAction ["Talk To", {
	params ["_target", "_caller"];
	_vd = (getPosASL _caller) vectorDiff (getPosASL _target);
	_dir = _target atan2 _caller;
	if (_dir < 0) then {_dir = 360 + _dir};
	_target setFormDir _dir;
	//hint str _this;
	[_target, _caller] call ACS_fnc_system_openDialog;
}, nil, 6, false, true, "", "_target distance player < 5 && {alive _target}"];