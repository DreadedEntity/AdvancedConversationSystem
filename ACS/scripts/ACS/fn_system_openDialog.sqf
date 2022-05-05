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

systemChat toString _this;

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
_data = (_conversation select 0) select 0;

_titleText = call compile (_data select 0);
_titleSound = call compile (_data select 1);
if (isNil "_titleSound") then
{
	_titleSound = [];
};
_titleSoundLength = call compile (_data select 2);
if (isNil "_titleSoundLength") then
{
	_titleSoundLength = [];
};

_count = (count _titleText) - 1;
{
	if (_x > _count) then
	{
		_count = _x;
	};
} forEach [count _titleSound, count _titleSoundLength];

if (_count > 0) then
{
	{
		_x resize _count;
		{
			if (isNil {_x}) then
			{
				_x = "";
			};
		} forEach _x;
	} forEach [_titleSound, _titleSoundLength];

	ACS_CALLER setRandomLip true;
	for "_i" from 0 to (_count - 1) do
	{
		if ((_titleText select (_i + 1)) find "STR_" == 0) then
		{
			ctrlSetText [1001, localize (_titleText select (_i + 1))];
		} else
		{
			ctrlSetText [1001, _titleText select (_i + 1)];
		};
		if (((_titleSound) select _i) != "") then
		{
			if ((_titleSound select _i) find "STR_" == 0) then
			{
				playSound3D [ACS_MISSION_PATH + (localize (_titleSound select _i)), ACS_CALLER];
			} else
			{
				playSound3D [ACS_MISSION_PATH + (_titleSound select _i), ACS_CALLER];
			};
		};
		if (!isNil {((_titleSoundLength) select _i)}) then
		{
			_ACS_TIME = time;
			_length = (_titleSoundLength select _i);
			if (typeName _length == "STRING") then
			{
				if (_length find "NUM_" == 0) then
				{
					waitUntil {(time > (_ACS_TIME + (call compile (localize _length)))) || ACS_INTERRUPT};
				} else
				{
					waitUntil {(time > (_ACS_TIME + (call compile _length))) || ACS_INTERRUPT};
				};
			} else
			{
				if (typeName _length == "SCALAR") then
				{
					waitUntil {time > (_ACS_TIME + _length)};
				};
			};
			ACS_INTERRUPT = false;
		};
	};
	ACS_CALLER setRandomLip false;
};

/*
_bodyText = call compile (_data select 3);
_bodySound = call compile (_data select 4);
_bodySoundLength = call compile (_data select 5);
*/

_bodyText = call compile (_data select 3);
_bodySound = call compile (_data select 4);
if (isNil "_bodySound") then
{
	_bodySound = [];
};
_bodySoundLength = call compile (_data select 5);
if (isNil "_bodySoundLength") then
{
	_bodySoundLength = [];
};

_count = count _bodyText;
{
	if (_x > _count) then
	{
		_count = _x;
	};
} forEach [count _bodyText, count _bodySound, count _bodySoundLength];

if (_count > 0) then
{
	{
		_x resize _count;
		{
			if (isNil {_x}) then
			{
				_x = "";
			};
		} forEach _x;
	} forEach [_bodyText, _bodySound, _bodySoundLength];
	
	ACS_SPEAKER setRandomLip true;
	for "_i" from 0 to _count do
	{
		if ((_bodyText select _i) find "STR_" == 0) then
		{
			ctrlSetText [1001, localize (_bodyText select _i)];
		} else
		{
			ctrlSetText [1001, _bodyText select _i];
		};
		if ((_bodySound select _i) != "") then
		{
			if ((_bodySound select _i) find "STR_" == 0) then
			{
				playSound3D [ACS_MISSION_PATH + (localize (_bodySound select _i)), ACS_SPEAKER];
			} else
			{
				playSound3D [ACS_MISSION_PATH + (_bodySound select _i), ACS_SPEAKER];
			};
		};
		if (!isNil {_bodySoundLength select _i}) then
		{
			_ACS_TIME = time;
			_length = (_bodySoundLength select _i);
			if (typeName _length == "STRING") then
			{
				if (_length find "NUM_" == 0) then
				{
					waitUntil {(time > (_ACS_TIME + (call compile (localize _length)))) || ACS_INTERRUPT};
				} else
				{
					waitUntil {(time > (_ACS_TIME + (call compile _length))) || ACS_INTERRUPT};
				};
			} else
			{
				if (typeName _length == "SCALAR") then
				{
					waitUntil {time > (_ACS_TIME + _length)};
				};
			};
			ACS_INTERRUPT = false;
		};
	};
	ACS_SPEAKER setRandomLip false;
};

{
	((findDisplay 69) displayCtrl _x) ctrlSetFade 0;
	((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
	ctrlEnable [_x, true]
} forEach [1500, 1000, 1002];

//ACS2 requires ArmaPilot's Ferrari Addon