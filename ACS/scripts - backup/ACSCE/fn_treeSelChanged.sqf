///////////////////////////////////////
// Function file for Armed Assault 3 //
//     Created by: DreadedEntity     //
///////////////////////////////////////

if (ctrlShown ((findDisplay 12345) displayCtrl 1001)) then
{
	ctrlSetText [1400, tvText [1500, tvCurSel 1500]];
	ctrlSetText [1401, tvData [1500, tvCurSel 1500]];
};

if (ACSCE_DEBUG) then { systemChat str (tvData [1500, tvCurSel 1500]); systemChat str (tvCurSel 1500) };