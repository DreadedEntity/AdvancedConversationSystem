///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ctrlSetText [1409, ""];
ctrlSetText [1011, "Save Conversation As:"];
ACSCE_SAVELOAD_STATE = 1;
ctrlSetText [1611, "Export"];

_this call ACSCE_fnc_dimMainControls;

lbClear 1501;
lbSetCurSel [1501, -1];

{
	lbAdd [1501, _x];
} forEach (call ACSCE_fnc_getKnownSaves);

{
	_x ctrlEnable _this;
	_x ctrlShow _this;
}forEach (uiNamespace getVariable ["ACSCE_SAVEMENU", []]);