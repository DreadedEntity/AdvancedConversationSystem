///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

_inString = false;
_output = [];
{
	if (_x == 34) then {_inString = !_inString};
	if (_inString) then
	{
		_output pushBack _x;
	} else
	{
		switch (_x) do
		{
			case 91:
			{
				_output pushBack 123;
			};
			case 93:
			{
				_output pushBack 125;
			};
			default { _output pushBack _x };
		};
	};
} forEach toArray str _this;
copyToClipboard toString _output;