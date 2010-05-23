function main() {
  window.setInterval(function() {
      $("ul").load("/ajax/articles");
  }, 1000);

  var options = {
      //target: '#output',
      // target element(s) to be updated with server response
      //beforeSubmit: showRequest,
      // pre-submit callback
      success: function(responseText, statusText, xhr, $form) {
          $("ul").append(responseText);
      },
      // post-submit callback
      // other available options:
      //url:       url         // override for form's 'action' attribute
      //type:      type        // 'get' or 'post', override for form's 'method' attribute
      //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
      clearForm: true
      // clear all form fields after successful submit
      //resetForm: true        // reset the form after successful submit
      // $.ajax options can be used here too, for example:
      //timeout:   3000
  };

  // bind form using 'ajaxForm'
  $('#myform').ajaxForm(options);
}