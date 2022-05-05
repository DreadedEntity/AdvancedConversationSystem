/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

private ["_numChildren", "_path", "_depth", "_edit"];
	
_path = [_this, 0, [], [[]]] call BIS_fnc_param;
_depth = [_this, 1, 0, [0]] call BIS_fnc_param;
_edit = [_this, 2, [], [[]]] call BIS_fnc_param;

_numChildren = (tvCount [1500, _path]) - 1;
for "_i" from 0 to _numChildren do
{
	_data = call compile (tvData [1500, _path + [_i]]);

	_edit pushBack [/*[tvText [1500, _path + [_i]],*/ _data, []];

	tvExpand [1500, _path];
	
	if (tvCount [1500, _path] > 0) then
	{
		[_path + [_i], _depth + 1, (_edit select _i) select 1] call ACSCE_fnc_saveConversation;
	};
};

if (_depth <= 0) then
{
//	hint str _edit;
//	profileNamespace setVariable ["ACSCE_LAST_CONVERSATION_BACKUP", _edit];
};

_edit;