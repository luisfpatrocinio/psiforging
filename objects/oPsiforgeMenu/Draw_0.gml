/// @description 
live_auto_call

// Setup Screen Size
var gui_width = 960;
var gui_height = 540;
display_set_gui_size(gui_width, gui_height);

// Manage appearing variable
appearingProgress = lerp(appearingProgress, 1 - fading, 0.168);

// Draw Background
var _window = {
  w: gui_width * 0.40,
  h: gui_height * 0.92,
  x: gui_width/2,
  y: gui_height/2,
  c: c_black,
  getPosition: function(appearingProgress) {
    return [x - w/2, y - h/2 * appearingProgress, x + w/2, y + h/2 * appearingProgress]
  }
}

var _pos = _window.getPosition(appearingProgress);
draw_rectangle_color(_pos[0], _pos[1], _pos[2], _pos[3], _window.c, _window.c, _window.c, _window.c, false);

// Draw Selected Body Part Info
if (selectedBodyPart != noone) {
  var _bodyPart = selectedBodyPart.myBodyPart;
  draw_set_halign(fa_left);
  draw_text(32, 540*2/3, _bodyPart.name);
  draw_text(32, 540*2/3 + 32, _bodyPart.desc);
}