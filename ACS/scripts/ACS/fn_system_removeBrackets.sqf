_arr = toArray _this;
{
	if ((_x == 91) || (_x == 93)) then
	{
		if (_x == 91) then
		{
			_arr set [_forEachIndex, 123];
		}else
		{
			_arr set [_forEachIndex, 125];
		};
	};
	systemChat str _x;
}forEach _arr;
toString _arr;