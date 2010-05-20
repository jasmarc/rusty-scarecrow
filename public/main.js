function main() {
  var recalculate_progress = function() {
    var checked_boxes = $("input:checked").length
    var all_boxes = $("input[type='checkbox']").length
    var progress = 1
    if(all_boxes > 0) {
      progress = (100*checked_boxes/all_boxes) + 1
    }
    $("#progressbar").progressbar({
      value: progress
    });
  }
  
  recalculate_progress();
  
  $("#myform").submit(function() {
    $("ul").append("<li><input type='checkbox' />" + $("input[type='textbox']").val() + "</li>");
    $("input[type='textbox']").val("");
    $("input[type='checkbox']").click(function()
    {
        if($(this).is(":checked")){
          $(this).parent().css("text-decoration", "line-through");
        } else {
          $(this).parent().css("text-decoration", "");
        }
        recalculate_progress();
    });
    recalculate_progress();
  });

  $(document).keyup(function(event) {
    if (event.keyCode == 13) {
      $("#myform").submit();
    }
  });
  
  $("img").click(function() {
    $("#myform").submit();
  });
  
  $("#sortable").sortable();
}