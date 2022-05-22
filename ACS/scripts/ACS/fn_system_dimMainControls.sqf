/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_dimMainControls: %1", _this];

private _settings = if (_this) then { [1, 0, false] } else { [0, 0.5, true] };

{
	_x ctrlSetFade (_settings # 0);
	_x ctrlCommit (_settings # 1);
	_x ctrlEnable (_settings # 2);
} forEach (uiNamespace getVariable ["ACS_MAINCONTROLS", []]);