// Indicates if the button is highlighted.
highlighted = false;

// Text displayed on the button.
buttonText = "";

/// @func isMouseOver()
/// @desc Checks if the mosue cursor is over the button.
isMouseOver = function() {
  return mouse_x == clamp(mouse_x, bbox_left, bbox_right) && mouse_y == clamp(mouse_y, bbox_top, bbox_bottom)
}

/// @func onClick()
/// @desc Action that occurs when the button is pressed.
onClick = function() {
  show_debug_message("Button pressed."); 
}

// Adjusts button size
width = 96;
height = 32;