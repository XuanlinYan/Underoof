console.log("hello")
$(document).on('turbolinks:load', function() {
$("#state").change(function () {
  console.log("state changed")
  input_state = $(this)
  cities_of_state = $('#city');
  $.ajax({
      url: '/cities/' + input_state.val(),
      success: function(data) {
        var opt;
        opt = '<option value="" selected>Select Your City</option>';
        if (data.length === 0) {

        } else {
          data.forEach(function(i) {
            opt += '<option value="' + i + '">' + i + '</option>';
          });
          cities_of_state.html(opt);
        }
      }
    });
});
});