///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_file = [" File", 0.030] call ACSCE_fnc_createMenuBarOption;

if (ACSCE_DEBUG) then { hint str _file; };

[_file, "New", 
"
	[
		'Create New Conversation?',
		'This action cannot be undone, be sure you have saved\nthe current conversation to prevent a loss of data.',
		'Cancel',
		nil,
		'New',
		'false call ACSCE_fnc_dimMainControls;',
		nil,
		'tvClear 1500; ACSCE_CURRENT_CONVERSATION = ''New''; ctrlSetText [1000, ''Conversation Editor - New'']; false call ACSCE_fnc_dimMainControls;'
	] call ACSCE_fnc_showConfirmationWindow;
"] call ACSCE_fnc_addToMenuBarOption;
[_file, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_file, "Save", "profileNamespace setVariable [ACSCE_CURRENT_CONVERSATION, [[],0,[]] call ACSCE_fnc_saveConversation]; ACSCE_UNSAVED_CHANGES = false; ctrlSetText [1000, 'Conversation Editor - ' + ACSCE_CURRENT_CONVERSATION];"] call ACSCE_fnc_addToMenuBarOption;
[_file, "Save as", "true call ACSCE_fnc_showSaveControls;"] call ACSCE_fnc_addToMenuBarOption;
[_file, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_file, "Load", "true call ACSCE_fnc_showLoadControls;"] call ACSCE_fnc_addToMenuBarOption;
[_file, "Import",
"
	tvClear 1500;
	[[], call compile copyFromClipboard] call ACSCE_fnc_loadConversation;
	ACSCE_CURRENT_CONVERSATION = 'Import';
	ctrlSetText [1000, 'Conversation Editor - ' + ACSCE_CURRENT_CONVERSATION];
"] call ACSCE_fnc_addToMenuBarOption;
[_file, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_file, "Test Conv",
"
	player call ACS_fnc_user_deregisterConversation;
	[player, profileNamespace getVariable ACSCE_CURRENT_CONVERSATION] call ACS_fnc_user_registerConversation;
	call ACSCE_fnc_cleanup;
	closeDialog 0;
	_this call ACS_fnc_system_openDialog;
"] call ACSCE_fnc_addToMenuBarOption;
[_file, "Help", "systemChat 'To start using ACSCE, press right mouse button';"] call ACSCE_fnc_addToMenuBarOption;
[_file, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_file, "Exit", "call ACSCE_fnc_closeEditor;"] call ACSCE_fnc_addToMenuBarOption;

_load = [" Edit", 0.030] call ACSCE_fnc_createMenuBarOption;
[_load, "Undo", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Cut", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Copy", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Paste", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Delete", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Add Topic", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Edit Topic", ""] call ACSCE_fnc_addToMenuBarOption;

_bull = [" Help", 0.034] call ACSCE_fnc_createMenuBarOption;
[_bull, "Help", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "Hotkeys", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "Tutorial", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "BAR", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "About ACSCE", ""] call ACSCE_fnc_addToMenuBarOption;

_offset = (uiNamespace getVariable ["ACSCE_WINDOW_MENU_OFFSET", 0]);
((findDisplay 12345) displayCtrl 1015) ctrlSetPosition [
								_offset * safezoneW + safezoneX,
								0.028 * safezoneH + safezoneY,
								(1 - _offset) * safezoneW,
								0.02 * safezoneH
							];