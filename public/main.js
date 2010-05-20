function main() {
  $("#myform").submit(function() {
    $("ul").append("<li><input type='checkbox' />" + $("input[type='textbox']").val() + "</li>");
    $("input[type='textbox']").val("");
    $("input[type='checkbox']").click(function()
    {
        $(this).parent().css("text-decoration", "line-through");
        $(this).parent().fadeOut(1500);
    });
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