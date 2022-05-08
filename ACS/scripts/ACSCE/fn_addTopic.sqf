/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

#define ACSCE_TITLE        1400
#define ACSCE_TITLE_SOUND  1401
#define ACSCE_TITLE_LENGTH 1402
#define ACSCE_BODY         1403
#define ACSCE_SOUND        1404
#define ACSCE_BODY_LENGTH  1405
#define ACSCE_CODE         1406
#define ACSCE_PATH         1407
#define ACSCE_CONDITION    1408

private ["_newTopic"];

if (ctrlText 1400 != "") then {
	_newTopic = tvCurSel 1500;
	tvAdd [1500, _newTopic, ctrlText 1400];
	tvExpand [1500, _newTopic];
	tvSetData [1500, _newTopic + [(tvCount [1500,_newTopic]) - 1],str [ctrlText 1400, ctrlText 1401, ctrlText 1402, ctrlText 1403, ctrlText 1404, ctrlText 1405, ctrlText 1406, ctrlText 1407, ctrlText 1408]];
	
	//systemChat str _newTopic;
	//systemChat str (_newTopic + [(tvCount [1500,_newTopic]) - 1]);
	
	call ACSCE_fnc_needsSave;
	false call ACSCE_fnc_showEditControls;
}else {
	if (ctrlText 1400 == "") then {
		ctrlSetText [1400, "Topic Needed"];
	};
};