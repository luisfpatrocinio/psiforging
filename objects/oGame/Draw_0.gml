/// @description 
draw_set_font(fntText);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

statusString = "";
if (global.isTraining) {
  
}

if (global.trainingType != undefined) {
  statusString += "Now training:\n";
  statusString += string("{0}\n", global.trainingType);
  var _trainingParts = getBodiesPartFromTrainingType();
  array_foreach(_trainingParts, function(_bodypart) {
    statusString += string("Name: {0} --- Exp: {1} --- Level: {2}\n",
    getBodyPartByKey(_bodypart).name, 
    psiforgingStatus[$ _bodypart][$ "training"],
    psiforgingStatus[$ _bodypart][$ "level"]);
  });
}

if (global.psiforgingBodyPart != undefined) {
    statusString += string("Psiforging: {0} --- Exp: {1} --- Level: {2}", 
      getBodyPartByKey(global.psiforgingBodyPart).name, 
      psiforgingStatus[$ global.psiforgingBodyPart][$ "training"],
      psiforgingStatus[$ global.psiforgingBodyPart][$ "level"]
    );
}

draw_text(32, 32, statusString);