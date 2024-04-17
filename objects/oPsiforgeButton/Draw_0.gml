/// @description 
event_inherited();

draw_set_font(fntText);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x, y, buttonText, c_white, c_white, c_white, c_white, 1);

if (isMouseOver()) {
  var _str = "Clicking this button starts the Psiforging process on the associated bodypart. Then whenever you gain xp towward your core stats, a portion of that xp converts into xp for this bodypart.";
  var _w = 220;
  var _h = string_height_ext(_str, 12, _w);
  draw_text_ext(mouse_x, mouse_y - _h / 2, _str, 12, _w);
}