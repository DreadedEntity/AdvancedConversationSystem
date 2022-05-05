/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

_this addAction ["Talk To",
{
	_vd = (getPosASL (_this select 1)) vectorDiff (getPosASL (_this select 0));
	_dir = (_vd select 0) atan2 (_vd select 1);
	if (_dir < 0) then {_dir = 360 + _dir};
	(_this select 0) setFormDir _dir;
	[_this select 0,player] call ACS_fnc_system_openDialog;
}, [], 6, false, true, "", "_target distance player < 5 && {alive _target}"];