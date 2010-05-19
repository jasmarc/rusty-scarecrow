function set_add_del(){
  $('.remove_cat').hide();
  $('.add_cat').hide();
  $('.add_cat:last').show();
  $("#content > .category_block:only-child > .remove_cat").hide();
  $("div.coolstuff").hover(
  function() {
    $(this).find("img.remove_cat").show();
  },
  function() {
    $(this).find("img.remove_cat").hide();
  }
  );
}
function selrem(clickety){
  $(clickety).parent().parent().remove(); 
  set_add_del(); 
  return false;
}
function seladd(clickety){
  $('#content > .category_block:last').after(
    $('#content > .category_block:last').clone()); 
  set_add_del(); 
  return false;
}

function main(){
  set_add_del();
}