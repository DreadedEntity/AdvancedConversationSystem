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
	ctrlEnable [1500, !_this];
	{
		_x ctrlEnable (!_this);
		_x ctrlSetFade (_fadeSettings # 0);
		_x ctrlCommit (_fadeSettings # 1);
	} forEach (uiNamespace getVariable ["ACSCE_MAINCONTROLS", []]);
};