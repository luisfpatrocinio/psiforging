/// @description 

// Inherit the parent event
event_inherited();

actionName = "Meditate";
buttonText = "";

onClick = function() {
  if (global.trainingType == actionName) {
    with (oGame) stopTraining(); 
    global.trainingType = undefined;
  } else {
    with (oGame) startTraining(); 
    global.trainingType = actionName;
  }
}
