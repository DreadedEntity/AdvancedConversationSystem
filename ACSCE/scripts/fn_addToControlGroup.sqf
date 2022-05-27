///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

params ["_control","_groupName"];
_controls = uiNamespace getVariable [_groupName, []];
_controls pushBack _control;
uiNamespace setVariable [_groupName, _controls];