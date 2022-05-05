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
	ctrlEnable [_x, _this];
	ctrlShow [_x, _this];
}forEach [1011, 1409, 1607, 1608, 1501, 1012, 1611];