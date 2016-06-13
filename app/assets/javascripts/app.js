// var ready;

// ready = function(){

  $(document).ready(function(){

$("#main-nav li").on('click',function(){
         // remove classes from all
      $("#main-nav li").removeClass("active");
      // add class to the one we clicked
      $(this).addClass("active");
     
   });
  });

    //class="active"



// }; // end

// $(document).ready(ready);
// $(document).on('page:load', ready);






