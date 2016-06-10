var ready;

ready = function(){

$('#dropdown-time li').on('click', function(){
    $('#sort-time').val($(this).text());
});

}; // end

$(document).ready(ready);
$(document).on('page:load', ready);






