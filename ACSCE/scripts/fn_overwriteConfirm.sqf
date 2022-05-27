///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

true call ACSCE_fnc_dimMainControls;
if ((ctrlText 1409) != "") then {
	(ctrlText 1409) call ACSCE_fnc_saveTo;
	"ACSCE_AUTOSAVE" call ACSCE_fnc_saveTo;
	ACSCE_CURRENT_CONVERSATION = (ctrlText 1409);
} else {
	ACSCE_CURRENT_CONVERSATION call ACSCE_fnc_saveTo;
	"ACSCE_AUTOSAVE" call ACSCE_fnc_saveTo;
};
false call ACSCE_fnc_showSaveControls;

ACSCE_UNSAVED_CHANGES = false;
ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION];