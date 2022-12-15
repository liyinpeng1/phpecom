<?php

include('functions/userfunctions.php');
include('includes/header.php');


?>

<div class="container" style="margin-left:0px; background-color:#ff914d">
  <img src="assets/products/miss01.png" style=" margin-left:15px;  width:109%" class="image_full">
    <img src="assets/products/miss02.png"  class="image_mobile" >
</div>


<?php include('includes/footer.php'); ?>
<script>

$(document).ready(function () {
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:4
            }
        }
    })

});
</script>
