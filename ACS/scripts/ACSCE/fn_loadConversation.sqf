/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

params ["_path", "_main"];
private ["_endCount", "_depth"];
private _dialog = uiNamespace getVariable "ACS_CE";
private _control = _dialog displayCtrl 1500;
{
	//diag_log format ["Control: %1    Path: %2    Value: %3", _control, _path, _x # 0 # 0];
	private _index = _control tvAdd [_path, (_x # 0) # 0];
	private _new = _path + [_index];
	_control tvSetValue [_new, _index];
	tvSetText [1500, _new, _x # 0 # 0];
	tvSetData [1500, _new, str(_x # 0)];
	tvExpand [1500, _path];
		
	if (count (_x # 1) > 0) then {
		[_path + [_forEachIndex], (_x # 1)] call ACSCE_fnc_loadConversation;
	};
} forEach _main;