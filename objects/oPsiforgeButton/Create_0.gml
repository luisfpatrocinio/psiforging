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
    global.psiforgingBodyPart = oPsiforgeMenu.selectedBodyPart.myBodyPart.key;
    with (oGame) {
      time_source_reconfigure(trainingTimeSource, 0.10, time_source_units_seconds, trainBodyPart, [global.psiforgingBodyPart], -1, time_source_expire_after);
      time_source_start(trainingTimeSource); 
    }
  } else {
    global.psiforgingBodyPart = undefined; 
    with (oGame) {
      time_source_stop(trainingTimeSource); 
    }
  }
}
