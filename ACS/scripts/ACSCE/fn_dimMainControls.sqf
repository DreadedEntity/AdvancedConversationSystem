///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

switch (_this) do {
	case true: { {
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0.75;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach [1000, 1500, 1600, 1609];
	};
	case false: { {
			ctrlEnable [_x, !_this];
			((findDisplay 12345) displayCtrl _x) ctrlSetFade 0;
			((findDisplay 12345) displayCtrl _x) ctrlCommit 0.25;
		} forEach [1000, 1500, 1600, 1609];
	};
	default {
		systemChat "You broke my shit.";
	};
};