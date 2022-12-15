

<footer id="footer" class="text-white text-center py-5" style="background-color:#ff914d">
  <div class="container">
    <div class="row justify-content-center">
  <div class="col-lg-8 col-6 ">
    <h4 class="font-rubik font-size-20 text-center ">Contact</h4>
  <a href="mailto:missorangehomebakeries@gmail.com" class="font-rale font-size-16  text-white-50 ">missorangehomebakeries<br>@gmail.com </a>
    </div>
  </div>
  </div>
</footer>


    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>

  <!-- ALERTIFY JS -->
  <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

  <script>

      alertify.set('notifier','position', 'top-right');
      <?php
          if(isset($_SESSION['message']))
          {
              ?>
                alertify.success('<?= $_SESSION['message']; ?>');
              <?php
              unset($_SESSION['message']);
          }
      ?>
  </script>


  </body>
</html>
