/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

false call ACSCE_fnc_showRightMouseMenu;

_element = tvCurSel 1500;
_childIndex = _element select ((count _element) - 1);
_parent = _element select [0, (count _element) - 1];

diag_log format ["ChildIndex: %1    Element: %2    Parent: %3    Value: %4    Text: %5", _childIndex, _element, _parent, tvValue [1500, _element], tvText [1500, _element]];

if (count _element > 0) then {
	_children = (tvCount [1500, _parent]) - 1;
	
	for "_i" from 0 to _children do {
		private _value = _i;
		if (_this == "up") then {
			if (_i == _childIndex - 1) then {
				_value = _childIndex;
			} else {
				if (_i == _childIndex) then {
					_value = _childIndex - 1;
				};
			};
		};
		if (_this == "down") then {
			if (_i == _childIndex) then {
				_value = _childIndex + 1;
			} else {
				if (_i == _childIndex + 1) then {
					_value = _childIndex;
				};
			};
		};
		
		tvSetValue [1500, _parent + [_i], _value];
		diag_log format ["Updated path %1 with value: %2", _parent + [_i], _value];
	};

	((uiNamespace getVariable "ACS_CE") displayCtrl 1500) tvSortByValue [_parent, true];
	call ACSCE_fnc_needsSave;
};