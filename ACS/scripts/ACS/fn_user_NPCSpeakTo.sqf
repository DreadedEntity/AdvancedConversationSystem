///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

//Forces first object to open dialogue with the second object
_initiator = (_this select 0);
_speakingTo = (_this select 1);

while {_initiator distance player > 4} do {
	_initiator move (getpos player);
	sleep 1;
};
doStop _initiator;
waitUntil {speed _initiator < 1};

//get direction from speakingTo to initiator
_dirToInit = [_speakingTo, _initiator] call BIS_fnc_dirTo;
//get direction from initiator to speakintTo
_dirToSpe = [_initiator, _speakingTo] call BIS_fnc_dirTo;


//Turn speakingTo to face initiator
[_dirToInit, _speakingTo] call {
	_dirToInit = (_this select 0);
	_speakingTo = (_this select 1);
	
	_deltaDir = 0;
	if (_dirToInit - (direction _speakingTo) > 180) then {
		_deltaDir = -1;
	} else {
		_deltaDir = 1;
	};
	
	_speakingTo setDir _dirToInit;
//	while {(direction _speakingTo) > (_dirToInit - 2) && {(direction _speakingTo) < (_dirToInit + 2)}} do
//	{
//		_speakingTo setDir ((direction _speakingTo) + _deltaDir);
//	};
};

//Turn initator to face speakingTo
[_dirToSpe, _initiator] call {
	_dirToSpe = (_this select 0);
	_initiator = (_this select 1);
	
	_deltaDir = 0;
	if (_dirToSpe - (direction _initiator) > 180) then {
		_deltaDir = -1;
	} else {
		_deltaDir = 1;
	};
	
	_initiator setDir _dirToSpe;
//	while {(direction _initiator) > (_dirToSpe - 2) && {(direction _initiator) < (_dirToSpe + 2)}} do
//	{
//		_initiator setDir ((direction _initiator) + _deltaDir);
//	};
};

[_initiator, _speakingTo] spawn ACS_fnc_system_openDialog;