/// @description 
global.isPsiforging = false;
global.psiforgingBodyPart = undefined;
global.bodyParts = loadBodyPartsDatabase();

global.isTraining = false;
global.trainingType = undefined;

statusString = "";

psiforgingStatus = {};

array_foreach(global.bodyParts, function(_item) {
  bodyPartStatus = {
    training: 0,
    level: 0,
    injured: 0
  }
  variable_struct_set(psiforgingStatus, _item.key, bodyPartStatus);
});

train = function() {  
  var _psiforgingBodyPart = global.psiforgingBodyPart;
  var _trainingBodyParts = getBodiesPartFromTrainingType();
  
  partsToTrain = [];
  array_push(partsToTrain, _psiforgingBodyPart);
  array_foreach(_trainingBodyParts, function(_bodyPart) {
    array_push(partsToTrain, _bodyPart);
  });
  
  for (var i = 0; i < array_length(partsToTrain); i++) {
    var _thisPartKey = partsToTrain[i];
    if (is_undefined(_thisPartKey)) continue;
    var _actualExp = variable_struct_get(psiforgingStatus, _thisPartKey).training;
    _actualExp += 1;
    
    // Level Up
    if (_actualExp >= 100) {
      _actualExp = _actualExp mod 100;
      var _actualLevel = variable_struct_get(psiforgingStatus[$ _thisPartKey], "level");
      var _newLevel = _actualLevel + 1;
      _newLevel = clamp(_newLevel, 0, getBodyPartByKey(_thisPartKey).maxLevel);
      variable_struct_set(psiforgingStatus[$ _thisPartKey], "level", _newLevel);
    }
  
    variable_struct_set(psiforgingStatus[$ _thisPartKey], "training", _actualExp);
  }
}

trainingTimeSource = time_source_create(time_source_game, 0.50, time_source_units_seconds, train, [global.psiforgingBodyPart], -1, time_source_expire_after);

// Start Timer
/// @func startTraining()
startTraining = function() {
  time_source_reconfigure(trainingTimeSource, 0.10, time_source_units_seconds, train, [global.psiforgingBodyPart], -1, time_source_expire_after);
  time_source_start(trainingTimeSource); 
}

// Stop Timer
/// @func stopTraining()
stopTraining = function() {
  time_source_stop(trainingTimeSource); 
}


// Train Button
instance_create_depth(room_width/2, room_height - 64, 0, oActionButton);