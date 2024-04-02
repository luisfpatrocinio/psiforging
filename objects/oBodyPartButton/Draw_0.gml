/// @description 
event_inherited();

// Don't draw if don't have a bodypart.
if (is_undefined(myBodyPart)) exit;

// Draw Icon
var _border = 4;
draw_sprite(myBodyPart.sprite, 0, bbox_left + sprite_get_width(myBodyPart.sprite) / 2 + _border, y);

// Draw Text
draw_set_font(fntText);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_color(bbox_left + _border * 2 + sprite_get_width(myBodyPart.sprite), y, buttonText, c_white, c_white, c_white, c_white, 1);