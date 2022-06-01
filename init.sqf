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

OFFICER_CONVERSATION = [[["entry","","","['Hello', 'This is ACS 2']","","",""],[[["whatisACS2","What is ACS2","","['ACS stands for Advanced Conversation System', 'This is a vastly improved version of the original made in 2015']","","",""],[]],[["whyACS","Why ACS 2","","['I saw what good dialogue can do for a game in other games such as The Elder Scrolls and Fallout franchises','and I thought that it would definitely be a benefit to Arma.','no one had created a system like this, so I did']","","",""],[]],[["whatis","This Convo","","['This is just a test conversation so I can see what using the editor to create a conversation is actually like.','This will allow me to make improvements to the system to make a better experience for the user.','Additionally, I am using this conversation for testing to make sure everything works']","","",""],[]],[["features","Features","","['ACS 2 has a lot of features', 'see for yourself']","","",""],[[["branching","Branching","","['True, real branching is new in ACS 2.', 'It was only possible in the original version by using a workaround']","","[3]",""],[]],[["editor","Editor","","['That''s right, ACS now has a full editor, dubbed Conversation Editor, built entirely within Arma', 'This should make creating conversations much easier.']","","[3]",""],[]],[["code","Code","","['ACS 2 now has the ability to run code that you specify after a player selects a certain dialogue topic.','This can be used to spawn enemies, update objectives, anything you want.']","","[3]",""],[]],[["interrupts","Interrupts","","['Any good conversation system should have the ability to skip through dialogue, ACS 2 has this as well. Press Spacebar to skip a line of dialogue to the next one. Try it!', 'Here, this line of dialogue has been made intentionally long to incentivize players of practicing the ''interrupt'' feature that is brand-new to ACS2. Go on, give it a try, see what it does. No? Really? No, really, just press the spacebar. Oh fine, I give up, you win']","","[3]",""],[]],[["lip","Lip","","['You may have already noticed my lips moving while we''ve been talking, this is actually a feature of Arma itself but it has been integrated into ACS 2.','Simply convert your .ogg files to .lip files and store them in the same folder, then the game will automatically make my lips move']","","[3]",""],[]],[["back","Back","","['Yes I suppose that''s enough about ACS 2''s new features','There are probably a few more that I didn''t mention, but I am incredibly bored now']","","[]",""],[]]]]]]];
[officer, OFFICER_CONVERSATION] call ACS_fnc_user_registerConversation;
condition = 1;

officer setName "TESTMAN";

officer call ACS_fnc_user_allowSpeech;

//[officer, player] spawn ACS_fnc_user_NPCSpeakTo;