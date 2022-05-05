/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

false call ACSCE_fnc_showRightMouseMenu;

_element = tvCurSel 1500;

if (ACSCE_DEBUG) then { hint str _element; };

_curSel = tvCurSel 1500;
_clicked = _curSel select ((count _curSel) - 1);

if (count _element > 0) then
{
	_children = (tvCount [1500, _element]) - 1;
	
	for "_i" from _children to 0 step -1 do
	{
		if (_i == _clicked) then
		{
			tvSetValue [1500, _element + [_i], _i + 1];
		} else
		{
			if (_clicked == _i + 1) then
			{
				tvSetValue [1500, _element + [_i], _i - 1];
			} else
			{
				tvSetValue [1500, _element + [_i], _i];
			};
		};
	};

	((findDisplay 12345) displayCtrl 1500) tvSortByValue [_element select [0, (count _element) - 1], false];
};