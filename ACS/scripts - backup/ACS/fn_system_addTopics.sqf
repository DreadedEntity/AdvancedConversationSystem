/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define GREY [1,1,1,0.5]

_conversation = ACS_SPEAKER getVariable "ACS_CONVERSATION";
_parent = [(_conversation select 0), _this] call ACS_fnc_system_select;
_children = _parent select 1;

if (isNil "_parent") then
{
	_children = ["NULL"];
};

//systemChat str ((_parent select 0) select 0);

_length = count _this;
_childAmount = count _children;

if (_childAmount > 0) then
{
	lbClear 1500;
	lbSetCurSel [1500, -1];
	{
		_condition = (_x select 0) select 8;
		if ((_condition == "") || {call compile _condition}) then
		{
			_array = _this;
			_index = -1; //variables initialized within an "if" block are not in the same scope, error occurs at "lbSetData"
			_topicName = (call compile ((_x select 0) select 0)) select 0; //first select gets the entire topic array, second select gets topic array, third select gets the name
			if (_topicName find "STR_" == 0) then
			{
				_index = lbAdd [1500, localize _topicName];
			} else
			{
				_index = lbAdd [1500, _topicName];
			};
			_array set [_length, _forEachIndex];
			lbSetData [1500, _index, str ([_array] + (_x select 0))];
//			systemChat (lbData [1500, _index]);
//			if (_array in (player getVariable ["ACS_completedTopics", []])) then
//			{
//			lbSetColor [1500, _index, GREY];
//			};
		};
	}forEach _children; //select all children from main conversation
};