/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_openDialog: %1", _this];

//ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

disableSerialization;
params ["_speaker", "_caller"];
_speaker = (_this select 0);
uiNamespace setVariable ["ACS_SPEAKER", _speaker];
_caller = (_this select 1);
uiNamespace setVariable ["ACS_CALLED", _caller];

createDialog "AdvancedConversationSystem";
(name _speaker) call ACS_fnc_system_setNameTextbox;
"" call ACS_fnc_system_setDialogueTextbox;

[] call ACS_fnc_system_addTopics;

private _conversation = _speaker getVariable "ACS_CONVERSATION";
if (isNil "_conversation") exitWith {};
private _data = [[]];
_data append ((_conversation # 0) # 0);

diag_log format ["Data: %1", _data];

_data call ACS_fnc_system_doTopic;

//ACS2 requires ArmaPilot's Ferrari Addon