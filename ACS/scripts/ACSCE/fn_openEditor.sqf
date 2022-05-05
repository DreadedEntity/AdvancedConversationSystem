/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define ACS_CE (uiNamespace getVariable "ACS_CE")
#define ACSCE_DIALOG (findDisplay 12345)

//disableSerialization;

createDialog "ACS_Editor";
waitUntil {!isNil {ACS_CE}};

ACSCE_DEBUG = true;

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

ctrlEnable [1000, false];

[] call ACSCE_fnc_createWindowMenu;

_check = profileNamespace getVariable ["ACSCE_AUTOSAVE", "NULL"];
if (typeName _check == "ARRAY") then
{
	[[], _check] spawn ACSCE_fnc_loadConversation;
	ACSCE_CURRENT_CONVERSATION = "ACSCE_AUTOSAVE";
} else
{
	ACSCE_CURRENT_CONVERSATION = "Untitled";
};
ctrlSetText [1000, "Conversation Editor - ACSCE_AUTOSAVE"];

_dontShowAgain =
"
	profileNamespace setVariable ['ACS_BUG_WARNING', 1];
	false call ACSCE_fnc_dimMainControls;
";
_accept = "false call ACSCE_fnc_dimMainControls;";

if ((profileNamespace getVariable ["ACS_BUG_WARNING", 0]) == 0) then
{
	["WARNING", "ACSCE is in the alpha stage, there may be bugs.", "Don't Show", nil, "Okay", _dontShowAgain, "", _accept] call ACSCE_fnc_showConfirmationWindow;
};

ACSCE_DIALOG displayAddEventHandler ["KeyDown",
{
	private "_return";
	_return = false;
	if ((_this select 1) == 1) then
	{
		_return = true;
		call ACSCE_fnc_closeEditor;
	};
	_return;
}];