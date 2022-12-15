<?php

include('functions/userfunctions.php');
include('includes/header.php');

include('authenticate.php');

$cartItems = getCartItems();

if(mysqli_num_rows($cartItems) == 0)
{
    header('Location: index.php');
}

?>


<div class="py-3 " style="background-color:#ff914d">
    <div class="container">
        <h6 class="text-white">
            <a href="index.php" class="text-white">
                Home /
            </a>
            <a href="checkout.php" class="text-white">
                Checkout
            </a>
        </h6>
    </div>
</div>

<div class="py-5">
    <div class="container">
        <div class="card">
            <div class="card-body shadow">
                <form action="functions/placeorder.php" method="POST">
                    <div class="row">
                        <div class="col-md-7">
                            <h5>Basic Details</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Name</label>
                                    <input type="text" name="name" id="name" required placeholder="Enter your full name" class="form-control">
                                    <small class="text-danger name"></small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">E-mail</label>
                                    <input type="email" name="email" id="email" required placeholder="Enter your email" class="form-control">
                                    <small class="text-danger email"></small>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Phone</label>
                                    <input type="text" name="phone" id="phone" required placeholder="Enter your phone number" class="form-control">
                                    <small class="text-danger phone"></small>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Zip Code</label>
                                    <input type="text" name="zipcode" id="zipcode" required placeholder="Enter your zip code" class="form-control">
                                    <small class="text-danger zipcode"></small>

                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="fw-bold ">Address</label>
                                    <textarea name="address" id="address" required class="form-control" rows="5"></textarea>
                                    <small class="text-danger address"></small>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <h5>Order Details</h5>
                            <hr>
                                <?php $items = getCartItems();
                                $totalPrice = 0;
                                foreach ($items as $citem)
                                {
                                    ?>
                                    <div class="mb-1 border">
                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <img src="<?= $citem['image'] ?>" alt="Image" width="60px" class="m-2">
                                            </div>
                                            <div class="col-md-5 m-2">
                                                <label><?= $citem['name'] ?></label>
                                            </div>
                                            <div class="col-md-3 m-2">
                                                <label>$<?= $citem['selling_price'] ?></label>
                                            </div>
                                            <div class="col-md-2 m-2">
                                                <label>x <?= $citem['prod_qty'] ?></label>
                                            </div>
                                        </div>
                                    </div>

                                    <?php
                                    $totalPrice += $citem['selling_price'] * $citem['prod_qty'];
                                }
                                ?>
                                <hr>
                            <h5>Total Price : <span class="float-end fw-bold"> $<?= $totalPrice ?> </span> </h5>
                            <div class="">
                                 <div id="paypal-button-container" class="mt-3"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<?php include('includes/footer.php'); ?>

<!-- Replace "YOUR_CLIENT_ID_HERE" with your own sandbox Business account app client ID -->
<script src="https://www.paypal.com/sdk/js?client-id=AdP9ac4Kv_Da2UK2tnURJXXTG8K6lOUupMQQMEvwgfku7IPzOH9U4rO_dJTseDAswmvtFK3XDllyGwnb&currency=USD&intent=capture&enable-funding=venmo&disable-funding=credit,card"></script>

<script>

    paypal.Buttons({
        onClick(){
            var name = $('#name').val();
            var email = $('#email').val();
            var phone = $('#phone').val();
            var zipcode = $('#zipcode').val();
            var address = $('#address').val();

            if(name.length == 0)
            {
                $('.name').text("*This field is required");
            }else{
                $('.name').text("");
            }
            if(email.length == 0)
            {
                $('.email').text("*This field is required");
            }else{
                $('.email').text("");
            }
            if(phone.length == 0)
            {
                $('.phone').text("*This field is required");
            }else{
                $('.phone').text("");
            }
            if(zipcode.length == 0)
            {
                $('.zipcode').text("*This field is required");
            }else{
                $('.zipcode').text("");
            }
            if(address.length == 0)
            {
                $('.address').text("*This field is required");
            }else{
                $('.address').text("");
            }

            if(name.length == 0 || email.length == 0 || phone.length == 0|| zipcode.length == 0|| address.length == 0)
            {
                return false;
            }
        },
        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {

            return actions.order.create({
            purchase_units: [{
                amount: {
                value: '<?= $totalPrice ?>' // Can also reference a variable or function
              },
              shipping: {
                   options: [
                       {
                           id: "SHIP_123",
                           label: "ONLY IN MA AREA",
                           type: "SHIPPING",
                           selected: true,
                           amount: {
                               value: "5.00",
                               currency_code: "USD"
                           }
                       },
                       {
                           id: "SHIP_456",
                           label: "Other Areas in US",
                           type: "SHIPPING",
                           selected: false,
                           amount: {
                               value: "15.00",
                               currency_code: "USD"
                           }
                       }
                   ]
               }
            }]
            });
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
            return actions.order.capture().then(function(orderData) {
            // Successful capture! For dev/demo purposes:
            const transaction = orderData.purchase_units[0].payments.captures[0];

            var name = $('#name').val();
            var email = $('#email').val();
            var phone = $('#phone').val();
            var zipcode = $('#zipcode').val();
            var address = $('#address').val();

            var data = {
                'name': name,
                'email': email,
                'phone': phone,
                'zipcode': zipcode,
                'address': address,
                'payment_mode': "Paid by PayPal",
                'payment_id': transaction.id,
                'placeOrderBtn': true
            };

            $.ajax({
                method: "POST",
                url: "functions/placeorder.php",
                data: data,
                success: function (response) {
                    if(response == 201)
                    {
                        alertify.success("Order Placed Successfully");
                        // actions.redirect('my-orders.php');

                        window.location.href = 'my-orders.php';
                    }
                }
            });
            // When ready to go live, remove the alert and show a success message within this page. For example:
            // const element = document.getElementById('paypal-button-container');
            // element.innerHTML = '<h3>Thank you for your payment!</h3>';
            // Or go to another URL:  actions.redirect('thank_you.html');
            });
        }
    }).render('#paypal-button-container');
</script>
