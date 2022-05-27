/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

if (ctrlText 1400 != "") then {
	private _newTopic = tvCurSel 1500;
	tvAdd [1500, _newTopic, ctrlText 1401];
	tvExpand [1500, _newTopic];
	tvSetData [1500, _newTopic + [(tvCount [1500,_newTopic]) - 1],str [ctrlText 1401, ctrlText 1402, ctrlText 1400, ctrlText 1403, ctrlText 1406, ctrlText 1407, ctrlText 1408]];
	
	call ACSCE_fnc_needsSave;
	false call ACSCE_fnc_showEditControls;
} else {
	if (ctrlText 1400 == "") then {
		ctrlSetText [1400, "Topic Needed"];
	};
};