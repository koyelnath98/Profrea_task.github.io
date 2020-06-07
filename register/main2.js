$(document).ready(function() {

    var current_fs, next_fs, previous_fs;
    var left, opacity, scale;
    var animating;
    $(".steps").validate({
        errorClass: 'invalid',
        errorElement: 'span',
        errorPlacement: function(error, element) {
            error.insertAfter(element.next('span').children());
        },
        highlight: function(element) {
            $(element).next('span').show();
        },
        unhighlight: function(element) {
            $(element).next('span').hide();
        }
    });
    $(".next").click(function() {
        $(".steps").validate({
            errorClass: 'invalid',
            errorElement: 'span',
            errorPlacement: function(error, element) {
                error.insertAfter(element.next('span').children());
            },
            highlight: function(element) {
                $(element).next('span').show();
            },
            unhighlight: function(element) {
                $(element).next('span').hide();
            }
        });
        if ((!$('.steps').valid())) {
            return true;
        }
        if (animating) return false;
        animating = true;
        current_fs = $(this).parent();
        next_fs = $(this).parent().next();
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
        next_fs.show();
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now, mx) {
                scale = 1 - (1 - now) * 0.2;
                left = (now * 50) + "%";
                opacity = 1 - now;
                current_fs.css({
                    'transform': 'scale(' + scale + ')'
                });
                next_fs.css({
                    'left': left,
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function() {
                current_fs.hide();
                animating = false;
            },
            easing: 'easeInOutExpo'
        });
    });
    $('.submit').click(function(){
   window.location.href='submit.html';
   return false;
})


 $('#gridCheck').on('click',function(){

   var address_m = $(".address_m input");
  if($(this).is(":checked")){
  for(let i=0;i<address_m.length;i++){
    $("[name="+$(address_m[i]).prop("name")+"_2]").val($(address_m[i]).val());
     $("[name="+$(address_m[i]).prop("name")+"_2]").prop('disabled', true);
       }
       $("[name="+$(".address_m select").prop("name")+"_2]").val($(".address_m select").val());
          $("[name="+$(".address_m select").prop("name")+"_2]").prop('disabled', true);
     $("#same_y").show();
        $("#same_n").hide();
      
  }else{
    $(".address_p input").val("");
     $(".address_p input").prop('disabled', false);
     $(".address_p select").val("");
     $(".address_p select").prop('disabled', false);
      $("#same_y").hide();
      $("#same_n").show();
  }

});

 $(".address_m input").on('keyup keypress keydown change',function(){

  if($('#gridCheck').is(":checked"))
  {
      var address_m = $(".address_m input");
     for(let i=0;i<address_m.length;i++)
    $("[name="+$(address_m[i]).prop("name")+"_2]").val($(address_m[i]).val());
    $("[name="+$(".address_m select").prop("name")+"_2]").val($(".address_m select").val());
  }

 });
 


   $('.input').on('keypress keydown keyup change',function(){
   var $this = $(this);
   $('.'+$this.attr('id')+'').val($this.val());
});
    

    $(".previous").click(function() {
        if (animating) return false;
        animating = true;
        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
        previous_fs.show();
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now, mx) {
                scale = 0.8 + (1 - now) * 0.2;
                left = ((1 - now) * 50) + "%";
                opacity = 1 - now;
                current_fs.css({
                    'left': left
                });
                previous_fs.css({
                    'transform': 'scale(' + scale + ')',
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function() {
                current_fs.hide();
                animating = false;
            },
            easing: 'easeInOutExpo'
        });
    });
});




function ValidateSize(file) {
        var FileSize = file.files[0].size / 1024 / 1024; 
    
        if ((FileSize > 0.2) || (FileSize < 0.06)) {
            $('#img').val(''); 
            $('#blah').attr('src','generic.png');
           document.getElementById('alert1').innerHTML='Sorry only supported image size is  b/w 60kb to 200kb ';
        } 

        else {
                
            var _URL = window.URL || window.webkitURL;

    
           var img = new Image();
    var imgwidth = 0;
    var imgheight = 0;
     var maxwidth = 800;
    var maxheight = 800;
      var minwidth = 400;
    var minheight = 400;
     img.src = _URL.createObjectURL(file.files[0]);
    img.onload = function() {
    imgwidth = this.width;
    imgheight = this.height;
    if(imgwidth > maxwidth || imgheight > maxheight || imgwidth < minwidth || imgheight < minheight){
         $('#img').val(''); 
        document.getElementById('alert1').innerHTML='Sorry only supported picture resolution  is b/w 400 to 800 px';
           $('#blah').attr('src','generic.png');
    }
    else
    {
        document.getElementById('alert1').innerHTML='';
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                    $('#blah2').attr('src', e.target.result);
                };

                reader.readAsDataURL(file.files[0]);
    }
};   

        }
    }




$(document).ready(function() {
    var max_fields = 15; //Maximum allowed input fields 
    var wrapper    = $(".wrapper"); 
    var wrapper_2   = $(".wrapper_2");
    var add_button = $(".add_fields"); 
    var x = 1; 
 
 $(add_button).click(function(e){
        e.preventDefault();
 
        if(x < max_fields){ 
            x++; 
 
$(wrapper).append('<div class="form-row"><a href="javascript:void(0);" class="remove_field">x &nbsp;</a><input class="input" type="text" name="input_array_name[]"style="width: 25%" /></div>');

   }
    });
 
   
    $(wrapper).on("click",".remove_field", function(e){ 
        e.preventDefault();
 $(this).parent('div').remove(); 
 x--; 
    });

  


});
