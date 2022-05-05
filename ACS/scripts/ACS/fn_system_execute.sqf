/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////


//_data = call compile (lbData [1500, _this select 1]);
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
	
{
	((findDisplay 69) displayCtrl _x) ctrlSetFade 0.75;
	((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
	ctrlEnable [_x, false]
} forEach [1500, 1000, 1002];
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

_data = _this;

_titleText = call compile (_data select 1);
_titleSound = call compile (_data select 2);
if (isNil "_titleSound") then {
	_titleSound = [];
};
_titleSoundLength = call compile (_data select 3);
if (isNil "_titleSoundLength") then {
	_titleSoundLength = [];
};

_count = (count _titleText) - 1; {
	if (_x > _count) then {
		_count = _x;
	};
} forEach [count _titleSound, count _titleSoundLength];

if (_count > 0) then { {
		_x resize _count; {
			if (isNil {_x}) then {
				_x = "";
			};
		} forEach _x;
	} forEach [_titleSound, _titleSoundLength];

	ACS_CALLER setRandomLip true;
	for "_i" from 0 to (_count - 1) do {
		if ((_titleText select (_i + 1)) find "STR_" == 0) then {
			ctrlSetText [1001, parseText (localize (_titleText select (_i + 1)))];
		} else {
			ctrlSetText [1001, parseText (_titleText select (_i + 1))];
		};
		if (((_titleSound) select _i) != "") then {
			if ((_titleSound select _i) find "STR_" == 0) then {
				playSound3D [ACS_MISSION_PATH + (localize (_titleSound select _i)), ACS_CALLER];
			} else {
				playSound3D [ACS_MISSION_PATH + (_titleSound select _i), ACS_CALLER];
			};
		};
		if (!isNil {((_titleSoundLength) select _i)}) then {
			_ACS_TIME = time;
			_length = (_titleSoundLength select _i);
			if (typeName _length == "STRING") then {
				if (_length find "NUM_" == 0) then {
					waitUntil {(time > (_ACS_TIME + (call compile (localize _length)))) || ACS_INTERRUPT};
				} else {
					waitUntil {(time > (_ACS_TIME + (call compile _length))) || ACS_INTERRUPT};
				};
			} else {
				if (typeName _length == "SCALAR") then {
					waitUntil {time > (_ACS_TIME + _length)};
				};
			};
			ACS_INTERRUPT = false;
		};
	};
	ACS_CALLER setRandomLip false;
};

_bodyText = call compile (_data select 4);
if (isNil "_bodyText") then {
	_bodyText = [];
};
_bodySound = call compile (_data select 5);
if (isNil "_bodySound") then {
	_bodySound = [];
};
_bodySoundLength = call compile (_data select 6);
if (isNil "_bodySoundLength") then {
	_bodySoundLength = [];
};

_count = count _bodyText; {
	if (_x > _count) then {
		_count = _x;
	};
} forEach [count _bodyText, count _bodySound, count _bodySoundLength];

if (_count > 0) then { {
		_x resize _count; {
			if (isNil {_x}) then {
				_x = "";
			};
		} forEach _x;
	} forEach [_bodyText, _bodySound, _bodySoundLength];

	ACS_SPEAKER setRandomLip true;
	for "_i" from 0 to _count do {
		if ((_bodyText select _i) find "STR_" == 0) then {
			ctrlSetText [1001, localize (_bodyText select _i)];
		} else {
			ctrlSetText [1001, _bodyText select _i];
		};
		if ((_bodySound select _i) != "") then {
			if ((_bodySound select _i) find "STR_" == 0) then {
				playSound3D [ACS_MISSION_PATH + (localize (_bodySound select _i)), ACS_SPEAKER];
			} else {
				playSound3D [ACS_MISSION_PATH + (_bodySound select _i), ACS_SPEAKER];
			};
		};
		if (!isNil {_bodySoundLength select _i}) then {
			_ACS_TIME = time;
			_length = (_bodySoundLength select _i);
			if (typeName _length == "STRING") then {
				if (_length find "NUM_" == 0) then {
					waitUntil {(time > (_ACS_TIME + (call compile (localize _length)))) || ACS_INTERRUPT};
				} else {
					waitUntil {(time > (_ACS_TIME + (call compile _length))) || ACS_INTERRUPT};
				};
			} else {
				if (typeName _length == "SCALAR") then {
					waitUntil {time > (_ACS_TIME + _length)};
				};
			};
			ACS_INTERRUPT = false;
		};
	};
	ACS_SPEAKER setRandomLip false;
};

/*
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _mouseDownEH];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _mouseUpEH];
*/

{
	((findDisplay 69) displayCtrl _x) ctrlSetFade 0;
	((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
	ctrlEnable [_x, true]
} forEach [1500, 1000, 1002];

if ((_data select 7) != "") then {
	[] spawn compile (_data select 7);
};

_next = [];
if ((_data select 8) != "") then {
	_next = call compile (_data select 8);
} else {
	_next = _data select 0;
};

_currentTopic = [((ACS_SPEAKER getVariable "ACS_CONVERSATION") select 0), (_data select 0)] call ACS_fnc_system_select;
if (count (_currentTopic select 1) == 0) then {
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

//_next call ACS_fnc_system_addTopics;