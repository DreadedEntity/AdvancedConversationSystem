/////////////////////////////////////
// Function file for Armed Assault //
//    Created by: DreadedEntity    //
/////////////////////////////////////

false call ACSCE_fnc_showRightMouseMenu;

_element = tvCurSel 1500;

if (ACSCE_DEBUG) then { hint str _element; };

_clicked = _element select ((count _element) - 1);
_parent = _element select [0, (count _element) - 1];

if (count _element > 0) then
{
	_children = (tvCount [1500, _parent]);
	_steps = 0;
	
	for "_i" from _children to 1 step -1 do
	{
		tvSetValue [1500, _element + [_steps], _i];
		_steps = _steps + 1;
	};
//	tvSetValue [1500, _element + [_clicked], (_children - _clicked) + 1];
//	if (_clicked > 0) then
//	{
//		tvSetValue [1500, _element + [_steps], (_children - _clicked) - 1];
//	};

	((findDisplay 12345) displayCtrl 1500) tvSortByValue [_parent, true];
};