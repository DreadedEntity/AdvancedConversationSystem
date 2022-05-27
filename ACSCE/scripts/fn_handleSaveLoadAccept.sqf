///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_lb = lbText [1501, lbCurSel 1501];
_eb = (ctrlText 1409);

if (ACSCE_SAVELOAD_STATE == 0) then {
	if (ACSCE_UNSAVED_CHANGES) then {
		false call ACSCE_fnc_showLoadControls;
		[
			"Load New Conversation Without Saving?",
			"You have unsaved changes. The requested action will\nrevert any changes made. Please save to prevent a\nloss of data.",
			"Cancel",
			"Save",
			"Load",
			"true call ACSCE_fnc_dimMainControls;true call ACSCE_fnc_showLoadControls;",
			"true call ACSCE_fnc_showSaveControls;",
			"ACSCE_UNSAVED_CHANGES = false; call ACSCE_fnc_handleSaveLoadAccept;"
		] call ACSCE_fnc_showConfirmationWindow;
	} else {
		tvClear 1500;
		if ((ctrlText 1409) == "") then {
			_convoToLoad = _lb;
			[[], profileNamespace getVariable _convoToLoad] call ACSCE_fnc_loadConversation;
			ACSCE_CURRENT_CONVERSATION = _convoToLoad;
			ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION];
		} else {
			[[], profileNamespace getVariable _eb] call ACSCE_fnc_loadConversation;
			ACSCE_CURRENT_CONVERSATION = _eb;
			ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION];
		};
		false call ACSCE_fnc_showLoadControls;
	};
} else {
	_knownConvos = (call ACSCE_fnc_getKnownSaves);
	if ((_knownConvos find (ctrlText 1409) > -1) || (_knownConvos find (lbText [1501, lbCurSel 1501]) > -1)) then {
		ACSCE_CURRENT_CONVERSATION = (lbText [1501, lbCurSel 1501]);
		false call ACSCE_fnc_showSaveControls;
		[
			"Warning!",
			"The requested action will overwrite an existing conversation!\nProceed?",
			"Cancel",
			nil,
			"Accept",
			"true call ACSCE_fnc_dimMainControls;true call ACSCE_fnc_showSaveControls;",
			"",
			"call ACSCE_fnc_overwriteConfirm;"
		] call ACSCE_fnc_showConfirmationWindow;
	} else {
		profileNamespace setVariable ["ACSCE_KNOWN_SAVES", (call ACSCE_fnc_getKnownSaves) + [ctrlText 1409]];
		profileNamespace setVariable [(ctrlText 1409), [[],0,[]] call ACSCE_fnc_saveConversation];
		ACSCE_CURRENT_CONVERSATION = (ctrlText 1409);
		ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION];
		ACSCE_UNSAVED_CHANGES = false;
	};
};