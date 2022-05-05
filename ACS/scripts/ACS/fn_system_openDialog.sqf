/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

disableSerialization;
ACS_SPEAKER = (_this select 0);
ACS_CALLER = (_this select 1);
ACS_INTERRUPT = false;
ACS_INTERRUPT_HELD = false;
soundPlaying = false;

createDialog "AdvancedConversationSystem";

ctrlSetText[1000, name ACS_SPEAKER];
ctrlSetText[1001, ""];

{
	((findDisplay 69) displayCtrl _x) ctrlSetFade 1;
	((findDisplay 69) displayCtrl _x) ctrlCommit 0;
	ctrlEnable [_x, false]
} forEach [1500, 1000, 1002];

[] call ACS_fnc_system_addTopics;

_conversation = (_this select 0) getVariable "ACS_CONVERSATION";
_data = [[]] + ((_conversation select 0) select 0);

_data spawn ACS_fnc_system_execute;

//ACS2 requires ArmaPilot's Ferrari Addon