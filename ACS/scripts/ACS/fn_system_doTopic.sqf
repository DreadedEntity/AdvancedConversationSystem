/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_doTopic: %1", _this];

params ["_titleTexts", "_titleSounds", "_titleSoundLengths", "_bodyTexts", "_bodySounds", "_bodySoundLengths"];

true call ACS_fnc_system_dimMainControls;

private _ACS = uiNamespace getVariable "ACS";
private _keyDown = _ACS displayAddEventHandler ["KeyDown", {
	if !(uiNamespace getVariable ["ACS_INTERRUPT", false]) then {
		uiNamespace setVariable ["ACS_INTERRUPT", true];
		if (_this # 1 == 57) then {
			private _soundSource = uiNamespace getVariable "ACS_SOUNDSOURCE";
			if (!isNil "_soundSource") then {
				deleteVehicle _soundSource;
			}
		}
	};
}];
private _keyUp = _ACS displayAddEventHandler ["KeyUp", {
	if (_this # 1 == 57) then {
		uiNamespace setVariable ["ACS_INTERRUPT", false];
	}
}];

[true, _titleTexts, _titleSounds, _titleSoundLengths] call ACS_fnc_system_converse;
sleep 0.5;
[false, _bodyTexts, _bodySounds, _bodySoundLengths] call ACS_fnc_system_converse;

{
	_ACS displayRemoveEventHandler _x;
} forEach [["KeyDown",_keyDown],["KeyUp",_keyUp]];

false call ACS_fnc_system_dimMainControls;