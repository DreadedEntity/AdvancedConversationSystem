/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////
diag_log format ["fn_system_converse: %1", _this];

params ["_offset",["_textArray", "", [""]],["_soundArray", "", [""]],["_soundLengthArray", "", [""]]];
diag_log format ["Offset: %1", _offset];

_textArray = [call compile _textArray, []] select (_textArray == ""); diag_log format ["TextArray: %1", _textArray];
_soundArray = [call compile _soundArray, []] select (_soundArray == ""); diag_log format ["SoundArray: %1", _soundArray];
_soundLengthArray = [call compile _soundLengthArray, []] select (_soundLengthArray == ""); diag_log format ["SoundLengthArray: %1", _soundLengthArray];

private _count = selectMax [
	if (_offset) then { (count _textArray) - 1 } else { count _textArray },
	count _soundArray,
	count _soundLengthArray
];

if (_count > 0) then {
	{
		_x resize _count;
		{
			if (isNil "_x") then {
				_x = "";
			};
		} forEach _x;
	} forEach [_soundArray, _soundLengthArray];
	
	private _lists = if (_offset) then { _textArray select [1, _count] } else { _textArray };
	{
		diag_log format ["Beginning loop %1", _forEachIndex];
		private _text = if (_x find "STR_" == 0) then { localize _x } else { _x };
		diag_log format ["Text: %1", _text];
		_text call ACS_fnc_system_setDialogueTextbox;
		private _sound = _soundArray # _forEachIndex;
		diag_log format ["SelectedSound: %1", _sound];
		if (_sound != "") then {
			_sound = if (_sound find "STR_" == 0) then { localize _sound } else { _sound };
			diag_log format ["Sound: %1", _sound];
			private _speaker = if (_offset) then { ACS_CALLER } else { ACS_SPEAKER };
			private _soundSource = _speaker say3D _sound;
			waitUntil {isNull _soundSource || ACS_INTERRUPT};
		};
	} forEach _lists;
};