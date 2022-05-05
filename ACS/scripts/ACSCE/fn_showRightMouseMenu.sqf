///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ctrlEnable [1500, !_this];

{
	ctrlEnable [_x, _this];
	((findDisplay 12345) displayCtrl _x) ctrlSetFade (if (_this) then [{0},{1}]);
	((findDisplay 12345) displayCtrl _x) ctrlCommit 0;
} forEach [1601, 1602, 1605, 1606, 1610];

if (_this) then {
	ctrlEnable [1500, _this];
};