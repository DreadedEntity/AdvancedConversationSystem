///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

disableSerialization;
_arr = [];
{
	_str = str _x;
	_count = count _str;
	_hash = (_str find "#") + 1;
	_str = _str select [_hash, _count - _hash];
	_arr pushBack (parseNumber _str);
} forEach (allControls (uiNamespace getVariable "ACS_CE"));

_testNum = 3;
while {_arr find _testNum > -1} do {
	_testNum = _testNum + 1;
};
_testNum;