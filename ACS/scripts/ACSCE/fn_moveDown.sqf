/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

false call ACSCE_showRightMouseMenu;

_element = tvCurSel 1500;

hint str _element;

[
	"Command Not Implimented",
	"Move Down is currently not implimented\nand should not be used at this time.",
	nil,
	nil,
	"Okay",
	nil,
	nil,
	"false call ACSCE_fnc_dimMainControls;"
] call ACSCE_fnc_showConfirmationWindow;

if (count _element > 0) then {
	_children = tvCount [1500, _element];
	
	for "_i" from _children to 1 step -1 do {
		tvSetValue [1500, _element + [_i], _i];
		tvSetData [1500, _element + [_i], str [_i,"","",""]];
	};

	((findDisplay 12345) displayCtrl 1500) tvSortByValue [_element select [0, (count _element) - 1], false];
};