/// @description 
live_auto_call

// Destroy after fade
if (fading && appearingProgress <= 0) {
  instance_destroy(); 
}

// Show psiforge action button
with (psiforgeButton) {
  visible = other.selectedBodyPart != noone; 
}

var _pageMove = mouse_wheel_up() - mouse_wheel_down()
if (_pageMove != 0) {
  pageScroll += _pageMove * 17;
  pageScroll = clamp(pageScroll, -1 * ds_list_size(bodyPartsButtonsList) * SPAC_BETWEEN_BUTTONS + 540, 0)
}

// Move Buttons
for (var i = 0; i < ds_list_size(bodyPartsButtonsList); i++) {
  bodyPartsButtonsList[| i].y = SPAC_BETWEEN_BUTTONS/2 + pageScroll + i * SPAC_BETWEEN_BUTTONS;
}