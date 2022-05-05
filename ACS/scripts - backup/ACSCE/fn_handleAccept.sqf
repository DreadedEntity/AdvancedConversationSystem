/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

true call ACSCE_fnc_showEditControls;

switch (uiNamespace getVariable ["ACSCE_STATE", 0]) do
{
	case 0:
	{
		call ACSCE_fnc_addTopic;
	};
	case 1:
	{
		tvSetData [1500, tvCurSel 1500, str [ctrlText 1400, ctrlText 1401, ctrlText 1402, ctrlText 1403, ctrlText 1404, ctrlText 1405, ctrlText 1406, ctrlText 1407, ctrlText 1408]];
	};
	default {};
};

ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION + "*"];
ACSCE_UNSAVED_CHANGES = true;

"ACSCE_AUTOSAVE" call ACSCE_fnc_saveTo;

false call ACSCE_fnc_showEditControls;