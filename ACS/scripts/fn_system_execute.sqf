/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_execute: %1", _this];

private _data = call compile ((uiNamespace getVariable "ACS_TOPICLISTBOX") lbData (_this # 1));

diag_log format ["Data: %1", _data];
_data params ["_path","_topic","_menu","_titles","_bodys","_code","_nextPath","_condition"];

private _speaker = uiNamespace getVariable "ACS_SPEAKER";

_data call ACS_fnc_system_doTopic;
private _completed = _speaker getVariable ["ACS_COMPLETEDTOPICS", []];
_completed pushBackUnique _path;
_speaker setVariable ["ACS_COMPLETEDTOPICS", _completed];

if (_code != "") then {	[] spawn compile _code };

private _next = if (_nextPath != "") then {
	call compile _nextPath;
} else {
	//_path deleteAt ((count _path) - 1); //get parent
	_path;
};

diag_log format ["Next: %1", _next];
_currentTopic = [((_speaker getVariable "ACS_CONVERSATION") # 0), _next] call ACS_fnc_system_select;
diag_log format ["Current Topic # 0: %1", _currentTopic # 0];
diag_log format ["Current Topic # 1: %1", _currentTopic # 1];
if (count (_currentTopic # 1) == 0) then {
	//closeDialog 0;
	_next deleteAt ((count _next) - 1); //get parent
};
_next call ACS_fnc_system_addTopics;