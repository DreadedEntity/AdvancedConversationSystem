///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ctrlEnable [1500, !_this];
private _dialog = uiNamespace getVariable "ACS_CE";

{
	_x ctrlEnable _this;
	_x ctrlSetFade (if (_this) then [{0},{1}]);
	_x ctrlCommit 0;
} forEach (uiNamespace getVariable ["ACSCE_MOUSEMENU", []]);

if (_this) then {
	ctrlEnable [1500, _this];
};