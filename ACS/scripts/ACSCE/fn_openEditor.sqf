/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define ACS_CE (uiNamespace getVariable "ACS_CE")
#define ACSCE_DIALOG (findDisplay 12345)

//disableSerialization;

createDialog "ACS_Editor";
waitUntil {!isNil {ACS_CE}};

ACSCE_CLOSE_REQUESTED = false;
ACSCE_WARNED_OVERWRITE = false;
ACSCE_SAVELOAD_STATE = 0;
ACSCE_CURRENT_CONVERSATION = "Untitled";
ACSCE_UNSAVED_CHANGES = false;
ACSCE_ALT_PRESSED = false;
ACSCE_IGNORE_KEY = false;
ACSCE_MENU_CLICKED = false;
ACSCE_CLICK_IGNORE = false;

false call ACSCE_fnc_showEditControls;
false call ACSCE_fnc_showLoadControls;
call ACSCE_fnc_closeConfirmationWindow;
false call ACSCE_fnc_showRightMouseMenu;

_file = ["File",
	[
		0.0 * safezoneW + safezoneX,
		0.028 * safezoneH + safezoneY,
		0.030 * safezoneW,
		0.02 * safezoneH
	]
] call ACSCE_fnc_createMenuBarOption;
//hint str _file;
[_file, "New", {
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
}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Save", {profileNamespace setVariable [ACSCE_CURRENT_CONVERSATION, [[],0,[]] call ACSCE_fnc_saveConversation]; ACSCE_UNSAVED_CHANGES = false; ctrlSetText [1000, 'Conversation Editor - ' + ACSCE_CURRENT_CONVERSATION];}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Save as", {true call ACSCE_fnc_showSaveControls}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Load", {true call ACSCE_fnc_showLoadControls}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Import", {
	tvClear 1500;
	[[], call compile copyFromClipboard] call ACSCE_fnc_loadConversation;
	ACSCE_CURRENT_CONVERSATION = 'Import';
	ctrlSetText [1000, 'Conversation Editor - ' + ACSCE_CURRENT_CONVERSATION];
}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Test Conv", {
	player call ACS_fnc_user_deregisterConversation;
	[player, profileNamespace getVariable ACSCE_CURRENT_CONVERSATION] call ACS_fnc_user_registerConversation;
	call ACSCE_fnc_cleanup;
	closeDialog 0;
	_this call ACS_fnc_system_openDialog;
}] call ACSCE_fnc_addToMenuBarOption;
[_file, "Exit", "call ACSCE_fnc_closeEditor;"] call ACSCE_fnc_addToMenuBarOption;

_load = ["Edit",
	[
		0.030 * safezoneW + safezoneX,
		0.028 * safezoneH + safezoneY,
		0.040 * safezoneW,
		0.02 * safezoneH
	]
] call ACSCE_fnc_createMenuBarOption;
[_load, "Undo", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Redo", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Cut", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Copy", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Paste", ""] call ACSCE_fnc_addToMenuBarOption;
[_load, "Delete", ""] call ACSCE_fnc_addToMenuBarOption;

_bull = ["Help",
	[
		0.070 * safezoneW + safezoneX,
		0.028 * safezoneH + safezoneY,
		0.034 * safezoneW,
		0.02 * safezoneH
	]
] call ACSCE_fnc_createMenuBarOption;
[_bull, "Tutorial", ""] call ACSCE_fnc_addToMenuBarOption;
[_bull, "About", ""] call ACSCE_fnc_addToMenuBarOption;

_check = profileNamespace getVariable ["ACSCE_AUTOSAVE", "NULL"];
if (typeName _check == "ARRAY") then {
	[[], _check] spawn ACSCE_fnc_loadConversation;
	ACSCE_CURRENT_CONVERSATION = "ACSCE_AUTOSAVE";
} else {
	ACSCE_CURRENT_CONVERSATION = "Untitled";
};
ctrlSetText [1000, "Conversation Editor - ACSCE_AUTOSAVE"];

_dontShowAgain =
"
	profileNamespace setVariable ['ACS_BUG_WARNING', 1];
	false call ACSCE_fnc_dimMainControls;
";
_accept = "false call ACSCE_fnc_dimMainControls;";

if ((profileNamespace getVariable ["ACS_BUG_WARNING", 0]) == 0) then {
	["WARNING", "ACSCE is in the alpha stage, there may be bugs.", "Don't Show", nil, "Okay", _dontShowAgain, "", _accept] call ACSCE_fnc_showConfirmationWindow;
};

ACSCE_DIALOG displayAddEventHandler ["KeyDown", {
	private _return = false;
	if ((_this select 1) == 1) then {
		_return = true;
		call ACSCE_fnc_closeEditor;
	};
	_return;
}];