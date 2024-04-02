///@func BodyPart()
///@desc Parte do corpo.
///@param
///@returns
function BodyPart() constructor {
  // Identity Variables
  name = "";
  desc = "";
  sprite = sUndefinedIcon;
  
  // Level Variables
  level = 0;
  maxLevel = 1000;
  training = 100; // Training Percentage
}

function BackMuscles() : BodyPart() constructor {
  name = "Back Muscles";
  desc = "Muscles of the character's back.";
  sprite = sMuscleIcon;
}

function RightClavicle() : BodyPart() constructor {
  name = "Right Clavicle";
  desc = "Bone from the character's right collarbone.";
  sprite = sBoneIcon;
}