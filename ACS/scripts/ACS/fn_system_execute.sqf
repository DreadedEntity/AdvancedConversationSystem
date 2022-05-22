/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_execute: %1", _this];

_data = call compile ((uiNamespace getVariable "ACS_TOPICLISTBOX") lbData (_this # 1));
/*
	_data select 0 -- Current path
	_data select 1 -- Title Text
	_data select 2 -- Title Sound
	_data select 3 -- Title Sound Length
	_data select 4 -- Body Text
	_data select 5 -- Body Sound
	_data select 6 -- Body Sound Length
	_data select 7 -- Code
	_data select 8 -- Next Path
	_data select 9 -- Condition
*/

/* This code is for an INTERRUPT system that I created. It's purpose is to skip to the next line of dialogue when the player presses spacebar,
	however, since there is no way to stop sound using playSound3D I have commented this code.
_mouseDownEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	_button = (_this select 1);
	switch (_button) do {
		case 57: {
			if (!ACS_INTERRUPT_HELD) then {
				ACS_INTERRUPT_HELD = true;
				ACS_INTERRUPT = true;
			};
		};
		default {
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", ACS_UIEH select 0];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", ACS_UIEH select 1];
			closeDialog 0;
		};
	};
}];
_mouseUpEH = (findDisplay 46) displayAddEventHandler ["KeyUp", {
	_button = (_this select 1);
	switch (_button) do {
		case 57: {
			ACS_INTERRUPT_HELD = false;
			ACS_INTERRUPT = false;
		};
	};
}];
*/

//ACS_UIEH = [_mouseDownEH, _mouseUpEH];

//_data = _this;
diag_log format ["Data: %1", _data];

(_data select [1, 6]) call ACS_fnc_system_doTopic;

/*
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _mouseDownEH];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _mouseUpEH];
*/

if ((_data # 7) != "") then {
	[] spawn compile (_data # 7);
};

_next = if ((_data # 8) != "") then {
	call compile (_data # 8);
} else {
	_data # 0;
};

_currentTopic = [((ACS_SPEAKER getVariable "ACS_CONVERSATION") # 0), _data # 0] call ACS_fnc_system_select2;
if (count (_currentTopic # 1) == 0) then {
	closeDialog 0;
} else {
	_next call ACS_fnc_system_addTopics;
};

/*
_completed = player getVariable ["ACS_completedTopics", []];
if !((_data select 0) in _completed) then {
	_completed pushBack (_data select 0);
	player setVariable ["ACS_completedTopics", _completed];
};
*/

//hint str (player getVariable ["ACS_completedTopics", []]);