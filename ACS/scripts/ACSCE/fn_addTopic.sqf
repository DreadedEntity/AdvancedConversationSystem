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

if (ctrlText 1400 != "") then
{
	_newTopic = tvCurSel 1500;
	tvAdd [1500, _newTopic, ctrlText ACSCE_TITLE];
	tvExpand [1500, _newTopic];
	tvSetData [1500, _newTopic + [(tvCount [1500,_newTopic]) - 1],str [ctrlText ACSCE_TITLE, ctrlText ACSCE_TITLE_SOUND, ctrlText ACSCE_TITLE_LENGTH, ctrlText ACSCE_BODY, ctrlText ACSCE_SOUND, ctrlText ACSCE_BODY_LENGTH, ctrlText ACSCE_CODE, ctrlText ACSCE_PATH, ctrlText ACSCE_CONDITION]];
	
	if (ACSCE_DEBUG) then
	{
		systemChat str _newTopic;
		systemChat str (_newTopic + [(tvCount [1500,_newTopic]) - 1]);
	};
	
	ctrlSetText [1000, "Conversation Editor - " + ACSCE_CURRENT_CONVERSATION + "*"];
	ACSCE_UNSAVED_CHANGES = true;
	
	false call ACSCE_fnc_showEditControls;
}else
{
	if (ctrlText ACSCE_TITLE == "") then
	{
		ctrlSetText [ACSCE_TITLE, "Topic Needed"];
	};
};