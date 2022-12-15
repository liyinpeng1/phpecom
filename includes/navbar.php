<?php
  $page = substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'],"/")+1);
?>
<nav class="navbar navbar-expand-lg navbar-dark sticky-top " style="background-color:#ff914d" >
  <div class="container" >
    <a class="navbar-brand font-size-20" href="index.php">MISS ORANGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item px-1 mt-1 ">
          <a href="https://www.instagram.com/miss.orange0905/" class="font-rale font-size-30 text-white-50 "><i class='bx bxl-instagram '></i></a>
        </li>
        <li class="nav-item px-3 font-size-20">
          <a class="nav-link <?= $page == "index.php"? 'active':''; ?>" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item px-3 font-size-20">
          <a class="nav-link <?= $page == "categories.php"? 'active':''; ?>" href="categories.php">Order</a>
        </li>
        <li class="nav-item px-3 font-size-20">
          <a class="nav-link <?= $page == "cart.php"? 'active':''; ?>" href="cart.php">Cart</a>
        </li>


        <?php
          if(isset($_SESSION['auth']))
          {
            ?>
              <li class="nav-item dropdown font-size-20 px-3">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <?= $_SESSION['auth_user']['name']; ?>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item <?= $page == "my-orders.php"? 'active':''; ?>" href="my-orders.php">My Orders</a></li>
                  <li><a class="dropdown-item" href="logout.php">Logout</a></li>
                </ul>
              </li>
            <?php
          }
          else
          {
            ?>
              <li class="nav-item font-size-20 px-3">
                <a class="nav-link <?= $page == "register.php"? 'active':''; ?>" href="register.php">Register</a>
              </li>
              <li class="nav-item font-size-20 px-3">
                <a class="nav-link <?= $page == "login.php"? 'active':''; ?>" href="login.php">Login</a>
              </li>
            <?php
          }
        ?>

      </ul>
    </div>
  </div>
</nav>
