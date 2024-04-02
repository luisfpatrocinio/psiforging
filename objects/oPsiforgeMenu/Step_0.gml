/// @description 

// Destroy after fade
if (fading && appearingProgress <= 0) {
  instance_destroy(); 
}

// Show psiforge action button
with (psiforgeButton) {
  visible = other.selectedBodyPart != noone; 
}