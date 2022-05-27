///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

//[[],0,[]] call ACSCE_fnc_saveConversation;

if (ACSCE_UNSAVED_CHANGES) then {
	['Exit Without Saving?', 'You are trying to quit with unsaved changes.\nPlease save to prevent a loss of data.', 'Cancel', 'Exit', 'Save', 'false call ACSCE_fnc_dimMainControls;', 'call ACSCE_fnc_cleanup;closeDialog 0;', 'true call ACSCE_fnc_showSaveControls;true call ACSCE_fnc_dimMainControls;'] call ACSCE_fnc_showConfirmationWindow
} else {
	call ACSCE_fnc_cleanup;
	closeDialog 0;
};