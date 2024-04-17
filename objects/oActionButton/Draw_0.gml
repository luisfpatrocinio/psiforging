/// @description 

// Inherit the parent event
event_inherited();

var _preText = (global.trainingType != actionName) ? "Start" : "Stop";
buttonText = _preText + " " + actionName;

draw_set_font(fntText);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

width = string_width(buttonText) + 4
draw_text_color(x, y, buttonText, c_white, c_white, c_white, c_white, 1);
