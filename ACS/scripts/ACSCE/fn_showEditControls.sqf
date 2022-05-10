/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

_this call ACSCE_fnc_dimMainControls;

{
	if (ctrlIDC _x != 1800) then {
		_x ctrlEnable _this;
	};
	_x ctrlShow _this;
}forEach (uiNamespace getVariable ["ACSCE_EDITMENU", []]);