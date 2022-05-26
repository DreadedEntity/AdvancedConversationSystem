/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_addTopics: %1", _this];

#define GREY [1,1,1,0.5]

private _conversation = ACS_SPEAKER getVariable "ACS_CONVERSATION";
private _parent = [(_conversation # 0), _this] call ACS_fnc_system_select;
private _children = _parent # 1;

if (isNil "_parent") then {
	_children = ["NULL"];
};

private _length = count _this;
private _childAmount = count _children;

private _lb = uiNamespace getVariable "ACS_TOPICLISTBOX";
if (_childAmount > 0) then {
	lbClear _lb;
	_lb lbSetCurSel -1;
	{
		private _condition = (_x # 0) # 8;
		if ((_condition == "") || {call compile _condition}) then {
			private _array = _this;
			//diag_log format ["Array: %1", _this];
			private _topicName = (call compile ((_x # 0) # 0)) # 0; //first select gets the entire topic array, second select gets topic array, third select gets the name
			if (_topicName find "STR_" == 0) then {
				_topicName = localize _topicName;
			};
			_index = _lb lbAdd _topicName;
			_array set [_length, _forEachIndex];
			_lb lbSetData [_index, str ([_array] + (_x # 0))];
			if (_array in (ACS_SPEAKER getVariable ["ACS_COMPLETEDTOPICS", []])) then {
				_lb lbSetColor [ _index, GREY];
			};
		};
	} forEach _children; //select all children from main conversation
};