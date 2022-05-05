/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

//ACS_MISSION_PATH = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
//sounds you add to the mission file must have the FULL filepath or they will not play. This is required.
//sounds must also be registered to description.ext, look in mine for examples.

/*
player addEventHandler ["Fired", {
	_bullet = (_this select 6);
	_bullet spawn {
		hint "Shot fired\nBegin Collecting Data";
		_lineBreak = toString [13, 10];
		_data = "----------" + _linebreak + "BEGIN SHOT DATA" + _linebreak + "----------" + _linebreak;
		_startTime = time;
		while {speed _this > 1} do {
			_data = _data + (str (velocity _this) + _linebreak);
		};
		_endTime = time;
		_data = _data + "----------" + _linebreak + "END SHOT DATA" + _linebreak + "----------" + _linebreak + "Start Time: " + (str _startTime) + " | " + "End Time: " + (str _endTime) + _linebreak + "Total Time: " + (str (_endTime - _startTime));
		copyToClipboard _data;
		hint "Shot stopped\nEnd Collecting Data";
	};
}];
*/

debug = true;
player addAction ["Open ACSCE", {
	[] call ACSCE_fnc_openEditor;
},[],6, false, true, "", "debug"];
player addAction ["Test Conversation", {
	[player, profileNamespace getVariable "ACSCE_AUTOSAVE"] call ACS_fnc_user_registerConversation;
	_this call ACS_fnc_system_openDialog;
},[], 6, false, true, "", "debug"];

OFFICER_CONVERSATION = [[["Start","","","['Hey', 'Hey', 'Hey']","['sounds\hey.ogg', 'sounds\hey.ogg', 'sounds\hey.ogg']","[0.453, 0.453, 0.453]","","",""],[[["['Another Topic']","sounds\newsound.ogg","5.248","","","","","","condition == 0"],[]],[["['STR_HELLO']","ts","tsl","body text","body sound","body sound length","code","np","condition > 0"],[]],[["['Hello', 'This is a test', 'that will hopefully allow ACS', 'to show multiple prompts and sounds']","['sounds\newsound.ogg', 'sounds\newsound.ogg', 'sounds\newsound.ogg']","[0.5, 0.5, 4.248]","['This is another test', 'that I hope works', 'because I''ve worked hard']","['sounds\newsound.ogg', 'sounds\newsound.ogg', 'sounds\newsound.ogg']","[5.248, 5.248, 5.248]","","[]",""],[]]]]];
[officer, OFFICER_CONVERSATION] call ACS_fnc_user_registerConversation;
condition = 1;

officer setName "TESTMAN";

officer call ACS_fnc_user_allowSpeech;

//[officer, player] spawn ACS_fnc_user_NPCSpeakTo;