/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_execute: %1", _this];

private _data = call compile ((uiNamespace getVariable "ACS_TOPICLISTBOX") lbData (_this # 1));
/*
	_data select 0 -- Current path
	_data select 1 -- Title Text
	_data select 2 -- Title Sound //should be made redunant?
	_data select 3 -- Title Sound Length //now redundant
	_data select 4 -- Body Text
	_data select 5 -- Body Sound //should be made redunant?
	_data select 6 -- Body Sound Length //now redundant
	_data select 7 -- Code
	_data select 8 -- Next Path
	_data select 9 -- Condition
*/
diag_log format ["Data: %1", _data];

(_data select [1, 6]) call ACS_fnc_system_doTopic;

if ((_data # 7) != "") then {
	[] spawn compile (_data # 7);
};

diag_log format ["Data # 8: %1", _data # 8];
private _next = if ((_data # 8) != "") then {
	call compile (_data # 8);
} else {
	_data # 0;
};
diag_log format ["Next: %1", _next];

_currentTopic = [((ACS_SPEAKER getVariable "ACS_CONVERSATION") # 0), _next] call ACS_fnc_system_select;
diag_log format ["Current Topic # 0: %1", _currentTopic # 0];
diag_log format ["Current Topic # 1: %1", _currentTopic # 1];
if (count (_currentTopic # 1) == 0) then {
	closeDialog 0;
} else {
	_next call ACS_fnc_system_addTopics;
};


private _completed = ACS_SPEAKER getVariable ["ACS_COMPLETEDTOPICS", []];
_completed pushBackUnique (_data # 0);
ACS_SPEAKER setVariable ["ACS_completedTopics", _completed];


//hint str (player getVariable ["ACS_completedTopics", []]);