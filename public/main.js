function main() {
  $("#myform").submit(function() {
    $("ul").append("<li>" + $("input[type='text']").val() + "</li>");
    $("input[type='text']").val("");
  });

  $(document).keyup(function(event) {
    if (event.keyCode == 13) {
      $("#myform").submit();
    }
  });
  
  $("input[type='submit']").click(function() {
    $("#myform").submit();
  })
}



