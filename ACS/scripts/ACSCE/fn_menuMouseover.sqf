///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

//hint str _this;
_thisCtrl = (_this select 0);
private _colorInfo = [[1,1,1,0.90],[0,0,0,0.90]];
if (_this select 3) then { _colorInfo = [[0,0,0,0.90],[1,1,1,0.90]]; };
_thisCtrl ctrlSetTextColor (_colorInfo # 0);
_thisCtrl ctrlSetBackgroundColor (_colorInfo # 1);