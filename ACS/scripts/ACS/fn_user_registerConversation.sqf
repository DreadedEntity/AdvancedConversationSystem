///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

/*
if (typeName (_this select 1) == "ARRAY") then
{
	(_this select 0) setVariable ["ACS_CONVERSATION", (_this select 1)];
} else
{
	if (type (_this select 1) == "STRING") then
	{
		(_this select 0) setVariable ["ACS_CONVERSATION", (_this select 1)];
	} else
	{

	};
};
*/

_set = [];
switch (typeName (_this select 1)) do
{
	case "ARRAY": { _set = (_this select 1); };
	case "STRING": { _set = getArray (missionConfigFile >> "CfgACSConversations" >> (_this select 1)); };
	case "CONFIG": { _set = getArray (_this select 1); };
	default { ["fnc_registerConversation must be type ARRAY, STRING, or CONFIG. Input type was %1", typeName (_this select 1)] call BIS_fnc_error; _set = nil; };
};

(_this select 0) setVariable ["ACS_CONVERSATION", _set];