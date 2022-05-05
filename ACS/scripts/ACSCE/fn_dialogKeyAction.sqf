///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_input = _this;
_key = _this select 1;

if (!ACSCE_IGNORE_KEY) then {
	if (_key == 56) then {
		ACSCE_ALT_PRESSED = !ACSCE_ALT_PRESSED;
		call ACSCE_fnc_windowMenu;
	};
};

ACSCE_IGNORE_KEY = true;