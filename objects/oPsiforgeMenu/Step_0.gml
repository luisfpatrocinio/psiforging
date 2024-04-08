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
  pageScrollTo += _pageMove * 17;
  pageScrollTo = clamp(pageScrollTo, -1 * ds_list_size(bodyPartsButtonsList) * SPAC_BETWEEN_BUTTONS + 540, 0)
}
pageScroll = lerp(pageScroll, pageScrollTo, 0.20);

// Move Buttons
if (ds_exists(bodyPartsButtonsList, ds_type_list)) {
  for (var i = 0; i < ds_list_size(bodyPartsButtonsList); i++) {
    if (instance_exists(bodyPartsButtonsList[| i])) {
      bodyPartsButtonsList[| i].y = SPAC_BETWEEN_BUTTONS/2 + pageScroll + i * SPAC_BETWEEN_BUTTONS;
      bodyPartsButtonsList[| i].x = 960 + 192/2 - appearingProgress * 192
    }
  }
}