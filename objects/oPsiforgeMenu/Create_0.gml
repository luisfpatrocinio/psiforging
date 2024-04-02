/// @description 

// Taxa de progresso da aparição
appearingProgress = 0;

/// Variável booleana que indica se o menu está desaparecendo.
fading = false;

// Instância do botão selecionado
selectedBodyPart = noone;

/// @func closeWindow()
/// @desc Encerra a janela de Psiforging
closeWindow = function() {
  fading = true;
}

/// @func cancel()
/// @desc Deselects the item if there is one or closes the menu
cancel = function() {
  if (selectedBodyPart != noone) {
    selectedBodyPart = noone; 
  } else {
    closeWindow();
  }
}

// Objects References
psiforgeButton = instance_create_depth(960/2, 540*2/3, depth - 1, oPsiforgeButton);

// BodyPart List
bodyParts = [
  new RightClavicle(),
  new BackMuscles()
];

bodyPartsButtonsList = ds_list_create();

// Instantiate body parts
array_foreach(bodyParts, function(_item, _index) {
  var _spacBetweenButtons = 34;
  var _bpbtn = instance_create_depth(960/2, 540/3 + _spacBetweenButtons * _index, depth - 1, oBodyPartButton)
  _bpbtn.myBodyPart = bodyParts[_index];
  ds_list_add(bodyPartsButtonsList, _bpbtn);
});
