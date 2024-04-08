/// @description 
global.isPsiforging = false;
global.psiforgingBodyPart = undefined;
global.bodyParts = loadBodyPartsDatabase();

psiforgingStatus = {};

array_foreach(global.bodyParts, function(_item) {
  bodyPartStatus = {
    training: 0,
    level: 0,
    injured: 0
  }
  variable_struct_set(psiforgingStatus, _item.key, bodyPartStatus);
});

trainBodyPart = function(_bodyPartKey) {
  if (is_undefined(_bodyPartKey)) {
    show_debug_message("Bodypart is undefined. Cannot train.");
    return;
  }
  var _actualExp = variable_struct_get(psiforgingStatus, _bodyPartKey).training;
  _actualExp += 1;
  
  // Level Up
  if (_actualExp >= 100) {
    _actualExp = _actualExp mod 100;
    var _actualLevel = variable_struct_get(psiforgingStatus[$ _bodyPartKey], "level");
    var _newLevel = _actualLevel + 1;
    _newLevel = clamp(_newLevel, 0, getBodyPartByKey(_bodyPartKey).maxLevel);
    variable_struct_set(psiforgingStatus[$ _bodyPartKey], "level", _newLevel);
  }
  
  variable_struct_set(psiforgingStatus[$ _bodyPartKey], "training", _actualExp);
}

trainingTimeSource = time_source_create(time_source_game, 0.50, time_source_units_seconds, trainBodyPart, [global.psiforgingBodyPart], -1, time_source_expire_after);