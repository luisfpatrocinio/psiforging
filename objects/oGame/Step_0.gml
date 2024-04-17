/// @description 

// Open Menu if press Esc Button
var _keyMenu = keyboard_check_pressed(vk_escape);
if (_keyMenu) {
  if (!instance_exists(oPsiforgeMenu)) {
    instance_create_depth(0, 0, 0, oPsiforgeMenu);
  } else {
    // Close Menu
    with (oPsiforgeMenu) {
      cancel();
    }
  }
}

global.isPsiforging = global.psiforgingBodyPart != undefined;
global.isTraining = global.trainingType != undefined;