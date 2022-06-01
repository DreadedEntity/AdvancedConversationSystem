/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define NEW 0
#define EDIT 1

false call ACSCE_fnc_showRightMouseMenu;
switch (_this) do {
	case 0: {
		true call ACSCE_fnc_showEditControls;
		{
			_x ctrlSetText "";
		} forEach (uiNamespace getVariable "ACSCE_EDITTEXTBOXES");
		uiNamespace setVariable ["ACSCE_STATE", NEW];
	};
	case 1: {
		if (count(tvCurSel 1500) > 0) then {
			true call ACSCE_fnc_showEditControls;
			
			ctrlSetText [1400, tvText [1500, tvCurSel 1500]];
			_data = call compile (tvData [1500, tvCurSel 1500]);
			{
				ctrlSetText [_x, _data # _forEachIndex];
			} forEach [1401,1402,1400,1403,1406,1407,1408];
			uiNamespace setVariable ["ACSCE_STATE", EDIT];
		} else {
			true call ACSCE_fnc_dimMainControls;
			[
				"No Topic Selected!",
				"You must select a topic before you can edit a topic.",
				nil,nil,"Okay",
				nil,nil,"false call ACSCE_fnc_dimMainControls;"
			] call ACSCE_fnc_showConfirmationWindow;
		};
	};
	default {};
};