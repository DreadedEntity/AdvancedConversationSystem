/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

private ["_main","_path","_endCount","_depth"];

_path = _this select 0;
_main = _this select 1;

{
	tvAdd [1500, _path, (_x select 0) select 0];
	tvSetData [1500, _path + [(tvCount [1500, _path]) - 1], str(_x select 0)];
	tvExpand [1500, _path];
		
	if (count (_x select 1) > 0) then {
		[_path + [_forEachIndex], (_x select 1)] call ACSCE_fnc_loadConversation;
	};
} forEach _main;