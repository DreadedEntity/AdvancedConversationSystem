///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

switch (ACSCE_SAVELOAD_STATE) do
{
	case 0:
	{
		//LOAD - DELETE
		_knownSaves = call ACSCE_fnc_getKnownSaves;
		if ((lbCurSel 1501) > -1) then
		{
			_deleteElement = lbText [1501, lbCurSel 1501];
			_knownSaves = _knownSaves - [_deleteElement];
			profileNamespace setVariable [_deleteElement, nil];
			profileNamespace setVariable ["ACSCE_KNOWN_SAVES", _knownSaves];			
		};
		lbClear 1501;
		{
			lbAdd [1501, _x]
		} forEach _knownSaves;
	};
	case 1:
	{
		//SAVE - EXPORT
		if ((lbCurSel 1501) > -1) then
		{
			(profileNamespace getVariable [lbText [1501, lbCurSel 1501], ["You Tried To Load A Null Conversation"]]) call ACSCE_fnc_fixOutput;
			systemChat format["%1 was exported to clipboard", lbText [1501, lbCurSel 1501]];
			systemChat "Press Ctrl+V to paste and save";
		};
	};
	default {hint "How tf did you get here?";};
};