///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ctrlSetText [1409, ""];
ctrlSetText [1011, "Save Conversation As:"];
ACSCE_SAVELOAD_STATE = 1;
ctrlSetText [1611, "Export"];

switch (_this) do
{
	case true:
	{
		{
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0.75;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach [1000, 1500, 1600, 1609];
	};
	case false:
	{
		{
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach [1000, 1500, 1600, 1609];
	};
	default
	{
		systemChat "You broke my shit.";
	};
};

lbClear 1501;
lbSetCurSel [1501, -1];

{
	lbAdd [1501, _x];
} forEach (call ACSCE_fnc_getKnownSaves);

{
	ctrlEnable [_x, _this];
	ctrlShow [_x, _this];
}forEach [1011, 1409, 1607, 1608, 1501, 1012, 1611];