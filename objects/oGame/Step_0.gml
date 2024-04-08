/// @description 
var _keyMenu = keyboard_check_pressed(vk_escape);

if (_keyMenu) {
  if (!instance_exists(oPsiforgeMenu)) {
    instance_create_depth(0, 0, 0, oPsiforgeMenu);
  } else {
    with (oPsiforgeMenu) {
      cancel();
    }
  }
}

global.isPsiforging = global.psiforgingBodyPart != undefined;
