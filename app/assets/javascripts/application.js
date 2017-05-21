// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .



/* global $*/
$(document).ready(function(){

    // http://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded
    function readFromFile(input){
        if(input.files && input.files[0]){
            var freader = new FileReader();
            
            freader.onload = function(event){
                var $imageParent = $(".image-preview-area");
                
                // if image element doesn't exists, append img, or just replace the img of existing ones
                if($imageParent.has("img").length == 0){
                    $imageParent.append("<img src='" + event.target.result + "'>");
                } else {
                    $(".image-preview-area img").attr("src", event.target.result);
                }
            }
            
            freader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#course_image").change(function(){
        readFromFile(this);
    });
    
});
