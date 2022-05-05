/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define NEW 0
#define EDIT 1

true call ACSCE_fnc_dimMainControls;
ctrlEnable [1500, false];

switch (_this) do {
	case 0: {
		true call ACSCE_fnc_showEditControls;
		for "_i" from 1400 to 1408 do {
			ctrlSetText [_i, ""];
		};
		uiNamespace setVariable ["ACSCE_STATE", NEW];
	};
	case 1: {
		if (count(tvCurSel 1500) > 0) then {
			true call ACSCE_fnc_showEditControls;
			
			ctrlSetText [1400, tvText [1500, tvCurSel 1500]];
			_data = call compile (tvData [1500, tvCurSel 1500]);
			_count = count _data;
			for "_i" from 1 to _count do {
				ctrlSetText [1399 + _i, _data select (_i - 1)];
			};
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

false call ACSCE_fnc_showRightMouseMenu;