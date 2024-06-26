/// @description 
#macro SPAC_BETWEEN_BUTTONS 34

live_auto_call

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
psiforgeButton = instance_create_depth(960/2, 540*4/5, depth - 1, oPsiforgeButton);

// List that stores instances of the buttons.
bodyPartsButtonsList = ds_list_create();

// Instantiate body parts
array_foreach(global.bodyParts, function(_item, _index) {
  var _bpbtn = instance_create_depth(960 - 192/2, 16 + SPAC_BETWEEN_BUTTONS * _index, depth - 1, oBodyPartButton)
  _bpbtn.myBodyPart = global.bodyParts[_index];
  ds_list_add(bodyPartsButtonsList, _bpbtn);
});

// Page Scroll
pageScroll = 0;
pageScrollTo = 0;