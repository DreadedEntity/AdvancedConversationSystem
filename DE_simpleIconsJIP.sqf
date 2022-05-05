/////////////////////////////////////
// Function file for Armed Assault //
// Created by: DreadedEntity       //
/////////////////////////////////////

/*
	USAGE:

	_handle = ["P1", "P2", [P3_a, P3_b, P3_c, etc.], "P4"] execVM "DE_simpleIconsJIP.sqf";
	
	_handle = Can be anything. Multiple instances can use the exact same handle without issue.
	P1: STRING - UNIQUE(!!!) name for the onEachFrame event. Name must be unique or instances will be overwritten.
	P2: STRING - Text you want to appear under each icon.
	P3: ARRAY - Array of OBJECTS you want to make icons for.
	P4: STRING (OPTIONAL) - Name of icon you want to use. (include filetype)
	
	EXAMPLE:
	null = ["eachFrame", "Kill", enemyUnits] execVM "DE_simpleIconsJIP.sqf";
*/

_name = _this select 0;
_text = _this select 1;
_units = _this select 2;
_icon = [_this, 3, "None", [""]] call BIS_fnc_param;

waitUntil {time > 0};

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 22);
    toString _arr
}; //Kudos to Killzone_Kid for this

[_name, "onEachFrame", 
{
	{
		if ((alive _x) && {!isPlayer _x}) then
		{
			_iSize = (0.5) - (0.01 / (player distance _x));
			_unitPos = [(getPos _x) select 0, (getPos _x) select 1, ((getPos _x) select 2) + 2];
			if (_this select 2 != "None") then
			{
				drawIcon3D[MISSION_ROOT + "\icons\" + (_this select 2), [1,1,1,0.5], _unitPos, _iSize, _iSize, 0, _this select 1];
			} else
			{
				switch (side _x) do
				{
					case west: {drawIcon3D[MISSION_ROOT + "\icons\targetWest.jpg", [1,1,1,0.5], _unitPos, _iSize, _iSize, 0, _this select 1];};
					case east: {drawIcon3D[MISSION_ROOT + "\icons\targetEast.jpg", [1,1,1,0.5], _unitPos, _iSize, _iSize, 0, _this select 1];};
					case independent: {drawIcon3D[MISSION_ROOT + "\icons\targetGuer.jpg", [1,1,1,0.5], _unitPos, _iSize, _iSize, 0, _this select 1];};
					case civilian: {drawIcon3D[MISSION_ROOT + "\icons\targetCiv.jpg", [1,1,1,0.5], _unitPos, _iSize, _iSize, 0, _this select 1];};
				};
			};
		};
	}forEach (_this select 0);
}, [_units, _text, _icon]] call BIS_fnc_addStackedEventHandler;

waitUntil {{alive _x} count _units == 0};
[_name, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;