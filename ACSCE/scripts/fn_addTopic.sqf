/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_addTopic: %1", _this];

if (ctrlText 1401 != "") then {
	private _tree = uiNamespace getVariable "ACSCE_MAINTREE";
	private _newTopic = tvCurSel _tree;
	private _child = _tree tvAdd [_newTopic, ctrlText 1401];
	_tree tvExpand _newTopic;
	_tree tvSetData [_newTopic + [_child],str [ctrlText 1401, ctrlText 1402, ctrlText 1400, ctrlText 1403, ctrlText 1406, ctrlText 1407, ctrlText 1408]];
	
	call ACSCE_fnc_needsSave;
	false call ACSCE_fnc_showEditControls;
} else {
	if (ctrlText 1401 == "") then {
		ctrlSetText [1401, "Topic Needed"];
	};
};