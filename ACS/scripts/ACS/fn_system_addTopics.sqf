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

_length = count _this;
_childAmount = count _children;

if (_childAmount > 0) then {
	lbClear 1500;
	lbSetCurSel [1500, -1];
	{
		_condition = (_x # 0) # 8;
		if ((_condition == "") || {call compile _condition}) then {
			private _array = _this;
			private _topicName = (call compile ((_x # 0) # 0)) # 0; //first select gets the entire topic array, second select gets topic array, third select gets the name
			if (_topicName find "STR_" == 0) then {
				_topicName = localize _topicName;
			};
			_index = lbAdd [1500, _topicName];
			_array set [_length, _forEachIndex];
			lbSetData [1500, _index, str ([_array] + (_x # 0))];
			//systemChat (lbData [1500, _index]);
//			if (_array in (player getVariable ["ACS_completedTopics", []])) then
//			{
//			lbSetColor [1500, _index, GREY];
//			};
		};
	} forEach _children; //select all children from main conversation
};