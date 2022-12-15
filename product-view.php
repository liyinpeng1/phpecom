<?php

include('functions/userfunctions.php');
include('includes/header.php');

if(isset($_GET['product']))
{
    $product_slug = $_GET['product'];
    $product_data = getSlugActive("products",$product_slug);
    $product = mysqli_fetch_array($product_data);

    if($product)
    {
        ?>
        <div class="py-3 " style="background-color:#ff914d">
            <div class="container">
                <h6 class="text-white">
                    <a class="text-white" href="index.php">
                        Home /
                    </a>
                    <a class="text-white" href="categories.php">
                        Order /
                    </a>
                    <?= $product['name']; ?></h6>
            </div>
        </div>

        <div class=" py-4" style="background-color:#ffd480" >
            <div class="container product_data mt-3" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="shadow">
                            <img src="<?= $product['image']; ?>" alt="Product Image" class="w-100">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h4 class="fw-bold"><?= $product['name']; ?>
                        </h4>
                        <hr>
                        <p><?= $product['small_description']; ?></p>
                        <div class="row">
                            <div class="col-md-6">
                                <h4>$ <span class="text-black fw-bold"> <?= $product['selling_price']; ?> </span></h4>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4">
                                <div class="input-group mb-3" style="width:130px">
                                    <button class="input-group-text decrement-btn">-</button>
                                    <input type="text" class="form-control text-center input-qty bg-white" value="1" disabled>
                                    <button class="input-group-text increment-btn">+</button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <button class="btn px-4 addToCartBtn" style="background-color:#ff914d; color:white" value="<?= $product['id']; ?>"> <i class="fa fa-shopping-cart me-2"></i>Add to Cart</button>
                            </div>
                        </div>
                        <hr>

                        <h6>Ingredients:</h6>

                        <p><?= $product['description']; ?></p>
                    </div>
                </div>
            </div>
        </div>


        <?php
    }
    else
    {
        echo "Product Not Found";
    }
}
else
{
    echo "Something Went wrong";
}
include('includes/footer.php'); ?>
