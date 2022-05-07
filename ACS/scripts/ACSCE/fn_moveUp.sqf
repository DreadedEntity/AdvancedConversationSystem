/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

false call ACSCE_showRightMouseMenu;

_element = tvCurSel 1500;
_parent = _element select [0, (count _element) - 1];

hint str _parent;

[
	"Command Not Fully Implemented",
	"Move Up functionality is currently limited\nand should not be used at this time.",
	nil,
	nil,
	"Okay",
	nil,
	nil,
	"false call ACSCE_fnc_dimMainControls;"
] call ACSCE_fnc_showConfirmationWindow;

if (count _element > 0) then {
	_children = tvCount [1500, _parent];

	systemChat str _children;
	
	for "_i" from _children to 1 step -1 do {		
		tvSetValue [1500, _parent + [_i - 1], _i];
		
		tvSetData [1500, _parent + [_i - 1], str [_i,"","",""]];
	};

	((uiNamespace getVariable "ACS_CE") displayCtrl 1500) tvSortByValue [_element select [0, (count _element) - 1], false];
};