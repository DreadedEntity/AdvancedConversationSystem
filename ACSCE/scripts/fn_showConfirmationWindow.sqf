///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

disableSerialization;

true call ACSCE_fnc_dimMainControls;

_title = (_this select 0);
_message = (_this select 1);

_buttonNo = _this param [2, "NULL", [""]];
_buttonMiddle = _this param [3, "NULL", [""]];
_buttonYes = _this param [4, "NULL", [""]];

//default items that will always need to be added to code - This is automatically added to all button code UNLESS THE BUTTON NAME IS EMPTY
_default = "call ACSCE_fnc_closeConfirmationWindow;";

_buttonNoCode = _this param [5, "", [""]];
if (_buttonNoCode != "") then
{_buttonNoCode = _buttonNoCode + _default;};

_buttonMiddleCode = _this param [6, "", [""]];
if (_buttonMiddleCode != "") then
{_buttonMiddleCode = _buttonMiddleCode + _default;};

_buttonYesCode = _this param [7, "", [""]];
if (_buttonYesCode != "") then
{_buttonYesCode = _buttonYesCode + _default;};

buttonSetAction [1612, _buttonNoCode];
buttonSetAction [1613, _buttonMiddleCode];
buttonSetAction [1614, _buttonYesCode];

_newlines = 1;
_slashFound = false;
{
	if (_x == 92) then {
		_slashFound = true;
	};
	if (_x == 110 && {_slashFound}) then {
		_newLines = _newLines + 1;
		_slashFound = false;
	};
} forEach (toArray (toLower (_message)));

_messageStartPosition = [0.34254 * safezoneW + safezoneX, 0.29 * safezoneH + safezoneY, 0.314919 * safezoneW, 0.0205 * safezoneH];
_buttonStartHeight = 0.2975 * safezoneH + safezoneY;

_messagePosition = _messageStartPosition;

_messagePosition set [3, (_messagePosition select 3) * _newlines];

private _dialog = uiNamespace getVariable "ACS_CE";
(_dialog displayCtrl 1014) ctrlSetPosition _messagePosition;
(_dialog displayCtrl 1014) ctrlCommit 0;

{
	_buttonPosition = ctrlPosition _x;
	_buttonPosition set [1, _buttonStartHeight + (_messagePosition select 3)];
	_x ctrlSetPosition _buttonPosition;	
	_x ctrlCommit 0;
} forEach (uiNamespace getVariable ["ACSCE_CONFIRM_BUTTONS",[]]);

{
	_x ctrlSetText "";
	_x ctrlEnable true;
	if (!isNil {_this select _forEachIndex}) then {
		_x ctrlSetText (_this select _forEachIndex);
	};
	_x ctrlSetFade 0;
	_x ctrlCommit 0.25;
} forEach (uiNamespace getVariable ["ACSCE_CONFIRM",[]]);