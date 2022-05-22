/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_openDialog: %1", _this];

ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

disableSerialization;
params ["_speaker", "_caller"];
ACS_SPEAKER = (_this select 0);
ACS_CALLER = (_this select 1);
ACS_INTERRUPT = false;
ACS_INTERRUPT_HELD = false;
soundPlaying = false;

createDialog "AdvancedConversationSystem";
(name ACS_SPEAKER) call ACS_fnc_system_setNameTextbox;
"" call ACS_fnc_system_setDialogueTextbox;

[] call ACS_fnc_system_addTopics;

private _conversation = ACS_SPEAKER getVariable "ACS_CONVERSATION";
if (isNil "_conversation") exitWith {};
_data = (_conversation # 0) # 0;
diag_log format ["Data: %1", _data];

_data call ACS_fnc_system_doTopic;

//ACS2 requires ArmaPilot's Ferrari Addon