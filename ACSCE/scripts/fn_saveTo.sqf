/////////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_convoToSave = [[],0,[]] call ACSCE_fnc_saveConversation;
profileNamespace setVariable [_this, _convoToSave];

if (((call ACSCE_fnc_getKnownSaves) find _this) > -1) then {
} else {
	profileNamespace setVariable ["ACSCE_KNOWN_SAVES", (call ACSCE_fnc_getKnownSaves) + [_this]];
};

_check = profileNamespace getVariable _this;
_didSave = false;
if (_check isEqualTo _convoToSave) then {
	_didSave = true;
} else {
	_didSave = false;
};

//systemChat format ["Save Conversation: %1 | Saved Successfully: %2", _this, _didSave];

//_convoToSave;