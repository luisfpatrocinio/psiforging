/// @description 
draw_set_font(fntText);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if (global.psiforgingBodyPart != undefined) {
  draw_text(32, 32, string("Now training: {0}\nExp: {1}", 
    getBodyPartByKey(global.psiforgingBodyPart).name, 
    variable_struct_get(psiforgingStatus[$ global.psiforgingBodyPart], "training")));
}