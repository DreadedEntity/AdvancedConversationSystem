/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_converse: %1", _this];

params ["_offset", "_menu", "_texts"];

{
	diag_log format ["Beginning loop %1", _forEachIndex];
	private _text = if (_x find "STR_" == 0) then { localize _x } else { _x };
	diag_log format ["Text: %1", _text];
	_text call ACS_fnc_system_setDialogueTextbox;
	private _sound = [_menu, _forEachIndex + 1] joinString "";
	if (isClass (missionConfigFile >> "CfgSounds" >> _sound)) then {
		diag_log format ["Sound: %1", _sound];
		private _speaker = if (_offset) then { ACS_CALLER } else { ACS_SPEAKER };
		private _soundSource = _speaker say3D _sound;
		uiNamespace setVariable ["ACS_SOUNDSOURCE", _soundSource];
		waitUntil {isNull _soundSource || ACS_INTERRUPT};
	}
} forEach call compile _texts;
"" call ACS_fnc_system_setDialogueTextbox;