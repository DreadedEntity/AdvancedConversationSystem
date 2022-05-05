///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;


player addAction ["Open Editor",
{
	[] call ACSCE_fnc_openEditor;
}, [], 6, false, true];

[man, "man_convo_1"] call ACS_fnc_user_registerConversation;
man call ACS_fnc_user_enableTalk;

[captain, missionConfigFile >> "cfgACSConversations" >> "captain_convo_1"] call ACS_fnc_user_registerConversation;
captain call ACS_fnc_user_enableTalk;


//[man, player] spawn ACS_fnc_user_NPCSpeakTo;