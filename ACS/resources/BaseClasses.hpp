// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_LISTBOX          5
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13

// Static styles
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_MULTI          0x10
#define ST_FRAME          0x40
#define ST_PICTURE	  0x30

//0x200
#define NO_BORDER         512

#define FT_EMONO "EtelkaMonospacePro"

import Scrollbar;
import RscText;
import RscTitle;
import RscTree;
import RscButton;
import RscEdit;
import RscListbox;

////////////////
//Base Classes//
////////////////

class ACSText: RscText {
    type = CT_STATIC;
    style = ST_MULTI + NO_BORDER;
    //colorActive[] = {0,0,0,0};
    text = "";
    shadow = 2;
    font = FT_EMONO;
    SizeEx = 0.03000;
};

class ACSEdit: RscEdit {
	type = CT_EDIT;
	style = ST_LEFT;
	font = "PuristaLight";
	autocomplete = false;
	linespacing = 1;
	text = "";
	sizeEx = 0.03;
	colorText[] = {1,1,1,0.9};
	colorDisabled[] = {};
	colorSelection[] = {0.96,0.62,0,0.5};
	colorBackground[] = {0,0,0,0.5};
};

class ACSButton: RscButton {
    text = "";
    colorSecondary[] = {1,1,1,1};
    colorText[] = {1,1,1,1};
    colorTextActive[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,1};
    colorBackground[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,1};
    colorBackgroundActive[] = {1,1,1,1};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0, 0, 0, 0};
    font = "PuristaLight";
    sizeEx = 0.02345 * safeZoneH;
};

//class RscFrame {
//    type = CT_STATIC;
//    idc = -1;
//    style = ST_FRAME;
//    shadow = 2;
//    colorBackground[] = {1,1,1,1};
//    colorText[] = {1,1,1,0.9};
//    font = "PuristaLight";
//    sizeEx = 0.03;
//    text = "";
//};
//
//class RscBackground {
//    type = CT_STATIC;
//    idc = -1;
//    style = ST_CENTER;
//    shadow = 2;
//    colorBackground[] = {0,0,0,0.0};
//    colorText[] = {1,1,1,0.9};
//    font = "PuristaLight";
//    sizeEx = 0.03;
//    text = "";
//};

class ACSTitle: RscTitle {
    idc = -1;
    shadow = 2;
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03 * safeZoneH;
    text = "";
};

class ACSScrollBar: ScrollBar {
	colorDisabled[] = {};
};

class ACSListbox: RscListbox {
	idc = -1;
	style = ST_MULTI;
	sizeEx = 0.03000;
	shadow = 2;
	font = FT_EMONO;
	rowHeight = 0.03;
	borderColor[] = {0,0,0,0};
	maxHistoryDelay = 10;
	canDrag = 0;
	disableFiltering = 0;
	colorBackground[] = {0,0,0,0.0};
	colorDisabled[] = {1,1,1,1};
	colorSelect[] = {0,0,0,0.5};
	soundSelect[] = {"",0,0,0};
	class ListScrollBar: ScrollBar {};
};

class ACSTree: RscTree {
	idc = -1;
	type = CT_TREE;
	default = 0;
	blinkingPeriod = 0;
	colorBorder[] = {0,0,0,1};
	colorBackground[] = {0.2,0.2,0.2,0.5};
	colorSelect[] = {1,0.5,0,1};
	colorMarked[] = {1,0.5,0,0.5};
	colorMarkedSelected[] = {1,0.5,0,1};
	colorText[] = {1,1,1,1};
	colorSelectText[] = {0,0,0,0.5};
	colorMarkedText[] = {0,0,0,0.5};
	colorDisabled[] = {0,0,0,0};
	colorArrow[] = {0,0,0,0};
	sizeEx = 0.03;
	font = FT_EMONO;
	shadow = 1;
	//tooltip = "ACS_EDITOR";
	//tooltipColorShade[] = {0,0,0,1};
	//tooltipColorText[] = {1,1,1,1};
	//tooltipColorBox[] = {1,1,1,1};
	class TreeScrollBar: ScrollBar {};
};