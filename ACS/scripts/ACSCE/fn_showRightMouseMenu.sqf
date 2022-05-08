///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ctrlEnable [1500, !_this];
private _dialog = uiNamespace getVariable "ACS_CE";

{
	ctrlEnable [_x, _this];
	(_dialog displayCtrl _x) ctrlSetFade (if (_this) then [{0},{1}]);
	(_dialog displayCtrl _x) ctrlCommit 0;
} forEach [1601, 1602, 1605, 1606, 1610];

if (_this) then {
	ctrlEnable [1500, _this];
};