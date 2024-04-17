/// @description 

// Inherit the parent event
event_inherited();

isPsiforgingThisPart = function() {
  var _selectedPart = undefined;
  if (instance_exists(oPsiforgeMenu.selectedBodyPart)) {
    _selectedPart = oPsiforgeMenu.selectedBodyPart.myBodyPart.key;
  }
  return global.psiforgingBodyPart == _selectedPart;
}

isPsiforgingSomething = function() {
  return global.psiforgingBodyPart != undefined 
}

onClick = function() {
  if (!isPsiforgingThisPart()) {
    // Define the part of the body that will be in psiforge.
    global.psiforgingBodyPart = oPsiforgeMenu.selectedBodyPart.myBodyPart.key;
  } else {
    // Reset psiforge
    global.psiforgingBodyPart = undefined; 
  }
}
