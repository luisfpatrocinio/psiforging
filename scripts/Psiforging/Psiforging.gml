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
    
    // Conferir se a key é válida:
    var _thisKey = ds_grid_get(fileGrid, 0, i);
    
    // Ignore column if it's empty
    if (_thisKey == "") continue;
    
    
    // Alimentar essa bodypart com o valor de cada coluna.
    for (var j = 0; j < ww; j++) {
      var _thisColumn = ds_grid_get(fileGrid, j, 0);      
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

///@func getBodyPartByKey(_bodyPartKey)
///@desc Obtém a estrutura da parte do corpo a partir de uma key
///@param {string} _bodyPartKey
///@returns BodyPart
function getBodyPartByKey(_bodyPartKey) {
  bodyPartKey = _bodyPartKey;
  var _bps = array_filter(global.bodyParts, function(_item) {
    return _item.key == bodyPartKey
  });
  if (array_length(_bps) > 0) {
    return _bps[0]; 
  }
}

///@func getPlayerPsiforgingStatusByKey(_bodyPartKey)
///@desc Obtém a estrutura da parte do corpo a partir de uma key
///@param {string} _bodyPartKey
function getPlayerPsiforgingStatusByKey(_bodyPartKey) {
  bodyPartKey = _bodyPartKey;
  return oGame.psiforgingStatus[$ bodyPartKey];
}