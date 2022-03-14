
$( "#myForm" ).submit(function( event ) {
 
    $(".overlay").show();
    $("#submitBtn").attr("disabled", true);
    $("#submitBtn").text('請稍後 Please wait...');	
});

$('input[name="q5_1"]').change(function() {
  var r = $(this).val();
  
  if(r == 'N')
  {
    $('#q6div').show("fast");
    $('input[name="q6"').prop('required', true);
  }
  else
  {
    $('#q6div').hide("fast");
    $('input[name="q6"').prop('required', false);
  }
});

$('.input-group.date').datepicker({
});