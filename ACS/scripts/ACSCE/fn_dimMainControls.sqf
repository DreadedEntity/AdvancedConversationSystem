///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////


private _fadeSettings = switch (_this) do {
	case true: { [0.75, 0.25] };
	case false: { [0,0.25] };
	default {};
};

if (typeName _fadeSettings == "ARRAY") then {
	private _dialog = uiNamespace getVariable "ACS_CE";
	private _controls = [1000, 1500, 1600, 1609];
	{
		ctrlEnable [_x, !_this];
		(_dialog displayCtrl _x) ctrlSetFade (_fadeSettings # 0);
		(_dialog displayCtrl _x) ctrlCommit (_fadeSettings # 1);
	} forEach _controls;
};