///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

if (count (tvCurSel 1500) > 0) then
{
	false call ACSCE_fnc_showRightMouseMenu;
	[
		"Delete Topic?",
		"This action cannot be undone! Are you sure you\nwant to delete the selected topic?",
		"Cancel",
		nil,
		"Delete",
		"false call ACSCE_fnc_dimMainControls;",
		nil,
		"tvDelete [1500, (tvCurSel 1500)];ctrlSetText [1000, 'Conversation Editor - ' + ACSCE_CURRENT_CONVERSATION + '*'];ACSCE_UNSAVED_CHANGES = true;'ACSCE_AUTOSAVE' call ACSCE_fnc_saveTo; false call ACSCE_fnc_dimMainControls;"
	] call ACSCE_fnc_showConfirmationWindow;
} else
{
	false call ACSCE_fnc_showRightMouseMenu;
	[
		"No Topic Selected!",
		"You must select a topic before you can delete a\ntopic.",
		nil,nil,"Okay",
		nil,nil,"false call ACSCE_fnc_dimMainControls;"
	] call ACSCE_fnc_showConfirmationWindow;
};