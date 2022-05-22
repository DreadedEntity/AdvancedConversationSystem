/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_doTopic: %1", _this];

params ["_titleTexts", "_titleSounds", "_titleSoundLengths", "_bodyTexts", "_bodySounds", "_bodySoundLengths"];

true call ACS_fnc_system_dimMainControls;

[true, _titleTexts, _titleSounds, _titleSoundLengths] call ACS_fnc_system_converse;
[false, _bodyTexts, _bodySounds, _bodySoundLengths] call ACS_fnc_system_converse;

false call ACS_fnc_system_dimMainControls;