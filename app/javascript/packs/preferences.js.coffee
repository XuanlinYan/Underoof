# Run this example by adding <%= javascript_pack_tag 'hello_coffee' %> to the head of your layout file,
# like app/views/layouts/application.html.erb.
jQuery ->
    console.log("------Here---------")
    counties = $('#county_id').html()

    if (!state = $('#state_id :selected').val())
        $("#county_id").empty()
    # cities = $('#city_id').html()
    $('#state_id').change ->
        console.log("------Here2---------")
        state = $('#state_id :selected').val()
        county_options = $(counties).filter("optgroup[label='#{state}']").html()
        if county_options
            $('#county_id').html(county_options)
            $("label[for='county_label']").show()
            $('#county_id').show()

            # $('#county_id').change ->
            #     county = $('#county_id :selected').val()
            #     city_options = $(cities).filter("optgroup[label='#{county}']").html()
            #     #console.log(state)
            #     #console.log(county)
            #     #console.log(city_options)
            #     if city_options
            #         $('#city_id').html(city_options)
            #         $("label[for='city_label']").show()
            #         $('#city_id').show()
            #     else
            #         $('#city_id').empty()
            #         $("label[for='city_label']").hide()
            #         $('#city_id').hide()
            
        else
            $("#county_id").empty()

    $("tr[data-link]").click ->
        window.location = $(this).data("link")
