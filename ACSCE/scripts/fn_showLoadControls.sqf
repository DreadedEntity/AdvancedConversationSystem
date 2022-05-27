/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

ctrlSetText [1409, ""];
ctrlSetText [1011, "Load Conversation"];
ACSCE_SAVELOAD_STATE = 0;
ctrlSetText [1611, "Delete"];

_this call ACSCE_fnc_dimMainControls;

lbClear 1501;
lbSetCurSel [1501, -1];

{
	lbAdd [1501, _x];
} forEach (call ACSCE_fnc_getKnownSaves);

{
	_x ctrlEnable _this;
	_x ctrlShow _this;
}forEach (uiNamespace getVariable ["ACSCE_SAVEMENU",[]]);