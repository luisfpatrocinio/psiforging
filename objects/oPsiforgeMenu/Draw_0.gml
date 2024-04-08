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
  draw_set_valign(fa_top);
  
  // Name
  draw_text(32, 540/2, _bodyPart.name);
  
  // Desc
  draw_text_ext(32, 540/2 + 32, _bodyPart.desc, 16, gui_width/2);
  
  var _exp = variable_struct_get(oGame.psiforgingStatus[$ _bodyPart.key], "training");
  
  // Training
  var _bx = 128;
  var _by = 540/2;
  var _bw = 64;
  var _bh = 16;
  draw_healthbar(_bx - _bw/2, _by - _bh/2, _bx + _bw/2, _by + _bh/2,
    _exp, c_black, c_orange, c_orange, 0, true, true);
}