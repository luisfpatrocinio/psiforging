///@func BodyPart()
///@desc Parte do corpo.
///@param
///@returns
function BodyPart() constructor {
  key = "";
  
  // Identity Variables
  name = "";
  desc = "";
  sprite = sUndefinedIcon;
  
  // Level Variables
  level = 0;
  maxLevel = 1000;
  training = 100; // Training Percentage
  
  // Status
  injured = false;
}

function loadBodyPartsDatabase() {
  fileName = "bodyParts.csv";
  fileGrid = load_csv(fileName);
  var ww = ds_grid_width(fileGrid);
  var hh = ds_grid_height(fileGrid);
  
  databaseArray = [];
  
  // Para cada linha (a linha 0 é o header)
  for (var i = 1; i < hh; i++) {
    var _thisBodyPart = new BodyPart();
    
    // Alimentar essa bodypart com o valor de cada coluna.
    for (var j = 0; j < ww; j++) {
      var _thisColumn = ds_grid_get(fileGrid, j, 0);
      
      // Ignore column if it's empty
      if (_thisColumn == "") continue;
      
      var _thisValue = ds_grid_get(fileGrid, j, i);
      _thisBodyPart[$ _thisColumn] = _thisValue;
      show_debug_message("Coluna selecionada: {0}\nValor atribuído: {1}", _thisColumn, _thisValue);
    }
    
    // Adicionar bodypart ao database
    array_push(databaseArray, _thisBodyPart);
  }
  
  show_debug_message("Resultado: \n{0}", databaseArray);
  return databaseArray
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