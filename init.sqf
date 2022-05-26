/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

//ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
//sounds you add to the mission file must have the FULL filepath or they will not play. This is required.
//sounds must also be registered to description.ext, look in mine for examples.

debug = true;
player addAction ["Open ACSCE", {
	[] call ACSCE_fnc_openEditor;
},[],6, false, true, "", "debug"];
player addAction ["Test Conversation", {
	[player, profileNamespace getVariable "ACSCE_AUTOSAVE"] call ACS_fnc_user_registerConversation;
	_this call ACS_fnc_system_openDialog;
},[], 6, false, true, "", "debug"];

//OFFICER_CONVERSATION = [[["['Start']","","","['Hey', 'Hey', 'Hey']","['hey', 'hey', 'hey']","[0.453, 0.453, 0.453]","","",""],[[["['Another Topic']","sounds\newsound.ogg","5.248","","","","","",""],[]],[["['Test2']","","","","","","","",""],[]],[["['Hello', 'This is a test', 'that will hopefully allow ACS', 'to show multiple prompts and sounds']","['sounds\newsound.ogg', 'sounds\newsound.ogg', 'sounds\newsound.ogg']","[0.5, 0.5, 4.248]","['This is another test', 'that I hope works', 'because I''ve worked hard']","['sounds\newsound.ogg', 'sounds\newsound.ogg', 'sounds\newsound.ogg']","[5.248, 5.248, 5.248]","","[]",""],[]]]]];
OFFICER_CONVERSATION = [[["['Entry']","","","['Hello', 'This is ACS 2']","['entry1', 'entry2']","","","",""],[[["['What is ACS 2?']","","","['ACS stands for Advanced Conversation System', 'This is a vastly improved version of the original made in 2015']","['whatisACS21','whatisACS22']","","","[]","condition == 0"],[]],[["['Why ACS?']","","","['I saw what good dialogue can do for a game in other games such as The Elder Scrolls and Fallout franchises','and I thought that it would definitely be a benefit to Arma.','no one had created a system like this, so I did']","['whyACS1','whyACS2','whyACS3']","","","[0]",""],[]],[["['What is this conversation?']","","","['This is just a test conversation so I can see what using the editor to create a conversation is actually like.','This will allow me to make improvements to the system to make a better experience for the user.','Additionally, I am using this conversation for testing to make sure everything works']","['whatis1','whatis2','whatis3']","","","[0]",""],[]]]]];
[officer, OFFICER_CONVERSATION] call ACS_fnc_user_registerConversation;
condition = 1;

officer setName "TESTMAN";

officer call ACS_fnc_user_allowSpeech;

//[officer, player] spawn ACS_fnc_user_NPCSpeakTo;