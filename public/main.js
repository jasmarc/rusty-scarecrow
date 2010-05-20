function main() {
  $("#myform").submit(function() {
    $("ul").append("<li><input type='checkbox' />" + $("input[type='textbox']").val() + "</li>");
    $("input[type='textbox']").val("");
  });

  $(document).keyup(function(event) {
    if (event.keyCode == 13) {
      $("#myform").submit();
    }
  });
  
  $("input[type='submit']").click(function() {
    $("#myform").submit();
  });
  
  $("#sortable").sortable();
}