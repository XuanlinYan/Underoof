console.log("hello")

$(document).on('turbolinks:load', function() {

  var selected_state = localStorage.getItem("state")
  $("#state").val(selected_state)
  var selected_city = localStorage.getItem("city")
  $("#city").html(selected_city)

$("#state").change(function () {
  var temp_selected_state = $("#state").val();
  localStorage.setItem("state", temp_selected_state);


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
          localStorage.setItem("city", opt);
        }
      }
    }); 
});
});