// $("document").ready(function() {
//     setTimeout(function() {
//         $("#popup-button").trigger('click');
//     },10);
// });
$(document).ready(function(){ 
  $("#popup-button").trigger('click');
  $("#popup-wrapper").modal({
  escapeClose: false,
  clickClose: false,
  showClose: false
  });
  $("#categories_multiselect").multiSelect({
   // selectableHeader: "<div class='categories_header left_one'>Untracked Areas<a href='#' class='categories_select' id='select-all'>Select All</a></div>",
  //  selectedHeader: "<div class='categories_header right_one'>Tracked Areas<a href='#'  class='categories_select' id='deselect-all'>Deselect All</a></div>"
      selectableHeader: "<div class='categories_header left_one'><a href='#' class='categories_select pull-right' id='select-all'>Select All</a></div>",
      selectedHeader: "<div class='categories_header right_one'><a href='#'  class='categories_select pull-right' id='deselect-all'>Deselect All</a></div>"
  });

  $('#select-all').click(function(){
    $('#categories_multiselect').multiSelect('select_all');
    return false;
  });
  $('#deselect-all').click(function(){
    $('#categories_multiselect').multiSelect('deselect_all');
    return false;
  });

});
