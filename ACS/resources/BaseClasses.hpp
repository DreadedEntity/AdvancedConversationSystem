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

////////////////
//Base Classes//
////////////////

class RscListbox
{
	access = 0;
	idc = -1;
	type = CT_LISTBOX;
	style = ST_MULTI;
	sizeEx = 0.03000;
	shadow = 2;
	font = FT_EMONO;
	rowHeight = 0.03;
	
	borderColor[] = {0,0,0,0};
	
	maxHistoryDelay = 10;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	canDrag = 0;
	disableFiltering = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.0};
	colorDisabled[] = {1,1,1,1};
	colorSelect[] = {0,0,0,0.5};
	soundSelect[] = {"",0,0,0};
	
	class ListScrollBar
	{
	color[] = {1, 1, 1, 0.6};
	colorDisabled[] = {};
	colorActive[] = {1, 1, 1, 1};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_MULTI + NO_BORDER;
    linespacing = 1;
    colorActive[] = {0,0,0,0};
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    shadow = 2;
    font = FT_EMONO;
    SizeEx = 0.03000;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
   
};

class RscEdit
{
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

class RscButton
{
    
    access = 0;
    type = CT_BUTTON;
    style = 2;
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
    borderSize = 0;
    colorBorder[] = {0, 0, 0, 0};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaLight";
    sizeEx = 0.02345 * safeZoneH;
    
    // Determines how far to offset the main control from the shadow. Positive numbers move it left/up. Use small numbers ex. 0.003
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
};

class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};

class RscBackground
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorBackground[] = {0,0,0,0.0};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};

class RscTitle
{
    type = CT_STATIC;
    idc = -1;
    style = ST_LEFT;
    shadow = 2;
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03 * safeZoneH;
    text = "";
};

class ScrollBar
{
	color[] = {1, 1, 1, 0.6};
	colorDisabled[] = {};
	colorActive[] = {1, 1, 1, 1};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
};

class RscTree
{
	access = 0;
	idc = CT_TREE;
	type = CT_TREE;
	style = ST_LEFT;
	default = 0;
	blinkingPeriod = 0;

	colorBorder[] = {0,0,0,1};

	colorBackground[] = {0.2,0.2,0.2,0.5};
	colorSelect[] = {1,0.5,0,1};
	colorMarked[] = {1,0.5,0,0.5};
	colorMarkedSelected[] = {1,0.5,0,1};
	
	sizeEx = 0.03;
	font = FT_EMONO;
	shadow = 1;
	colorText[] = {1,1,1,1};
	colorSelectText[] = {0,0,0,0.5};
	colorMarkedText[] = {0,0,0,0.5};

	//tooltip = "ACS_EDITOR";
	tooltipColorShade[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};

	multiselectEnabled = 0;
	expandOnDoubleclick = 1;
	hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
	maxHistoryDelay = 1;

	
	class ScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};

	colorDisabled[] = {0,0,0,0};
	colorArrow[] = {0,0,0,0};

	//onKeyDown = "systemChat str ['onKeyDown',_this]; false";

	//onTreeLButtonDown = "systemChat str ['onTreeLButtonDown',_this]; false";
};