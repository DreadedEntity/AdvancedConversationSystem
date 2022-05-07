/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

params ["_path", "_main"];
private ["_endCount", "_depth"];

{
	tvAdd [1500, _path, (_x # 0) # 0];
	tvSetData [1500, _path + [(tvCount [1500, _path]) - 1], str(_x # 0)];
	tvExpand [1500, _path];
		
	if (count (_x # 1) > 0) then {
		[_path + [_forEachIndex], (_x # 1)] call ACSCE_fnc_loadConversation;
	};
} forEach _main;