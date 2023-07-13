<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <style>
        .container {
            margin-top: 50px;
        }

        .product-card {
            margin-bottom: 20px;
        }

        .card-img-top {
            width: 200px;
            height: 200px;
            object-fit: contain;
        }

        .product-details {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        .stockp {
            color: red;
            font-weight: bold;
        }

        .btn-minus,
        .btn-plus {
            padding: 0;
            width: 30px;
            height: 30px;
            line-height: 1;
            border-radius: 50%;
            font-size: 12px;
        }

        .btn-minus {
            margin-right: 10px;
        }

        .btn-plus {
            margin-left: 10px;
        }

        .input-width {
            width: 60px;
            text-align: center;
        }

        .removeFromCart {
            background-color: red;
            color: #fff;
            margin-top: 10px;
        }

        .addToWishlistButton {
            background-color: blue;
            color: #fff;
            margin-top: 10px;
        }

        #checkout {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Cart</h2>
    <div class="row mt-4">
        <div th:if="${lists.isEmpty(products)}">No Cart Items</div>

        <div th:each="product : ${products}">
            <div class="product-card">
                <a th:href="@{'prodDescription?productId=' + ${product.prod_id}}">
                    <img class="card-img-top" th:src="${product.image_url}" alt="${product.prod_title}">
                </a>
                <div class="product-details">
                    <h5 class="card-title" th:text="${product.prod_title}"></h5>
                    <p class="card-text" th:text="${product.prod_desc}"></p>
                    <div th:if="${product.product_stock &lt;= 5 &amp;&amp; product.product_stock &gt; 0}">
                        <input type="hidden" id="stockval" th:value="${product.product_stock}">
                        <p class="card-text">
                            <i><b>Only <span th:text="${product.product_stock}"></span> left..Hurry Up!!</b></i>
                        </p>
                    </div>
                    <div th:unless="${product.product_stock &gt; 5}">
                        <b><p class="stockp">Out of Stock</p></b>
                        <script th:inline="javascript">
                            $(document).ready(function() {
                                disableBuyNow();
                            });
                            function disableBuyNow() {
                                $("#checkout").attr("disabled", true);
                            }
                        </script>
                    </div>
                    <p class="card-text"><b>Price:</b> <span th:text="${product.prod_price}"></span></p>
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-default btn-minus" th:onclick="'decrementQty(\'' + ${product.prod_id} + '\')'">-</button>
                        </span>
                        <input type="number" class="form-control input-width" th:id="'qty' + ${product.prod_id}" th:value="${product.quantity}">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-default btn-plus" th:onclick="'incrementQty(\'' + ${product.prod_id} + '\')'">+</button>
                        </span>
                    </div>
                    <button type="button" class="btn btn-primary removeFromCart" th:onclick="'removeFromCart(\'' + ${product.prod_id} + '\')'">Remove from Cart</button>
                    <button type="button" class="btn btn-primary addToWishlistButton" th:onclick="'addToWishlist(\'' + ${product.prod_id} + '\')'">Add to Wishlist</button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <form id="shipment-form" th:action="@{/updateshipment}" th:object="${customer}" method="post">
        <p id="ship"></p>
            <table class="shipment-table">
                <tr>
                    <td>Delivery Location:</td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="custName" name="custName" value="${cust != null ? cust.custName : ""}"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" id="custSAddress" name="custSAddress" value="${cust != null ? cust.custSAddress : ""}"></td>
                </tr>
                <tr>
                    <td>Pincode:</td>
                    <td>
                    <input type="number" class="custPincode" id="custPincode" name="custPincode" value="${cust != null ? cust.custSpincode: ""}"  oninput="checkPincodeAvailability(this.value);">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="btn btn-primary changeaddress" type="submit">Change Address</button>
                    </td>
                </tr>
            </table>
    </form>
    <br>
    <button class="btn btn-primary btn-lg btn-block" id="checkout">Checkout</button>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script th:inline="javascript">
$(document).ready(function(){
	console.log("hiiiiiiiiiii");
	  var pin=$("#custPincode");
	  console.log(pin.val());
	  checkPincodeAvailability(pin.val());
	  
	});
  
  

function checkPincodeAvailability(pincode) {
    console.log("Checking pincode availability for Product ID: "+pincode);

    $.ajax({
        type: "POST",
        url: "checkPincode",
        data: { pincode: pincode },
        success: function(response) {
            var availabilityElement = $("#availability");
            console.log(response);
            if (response=="true") {
                availabilityElement.text("Shipment is Available for this Pincode").removeClass("not-available").addClass("available");
            } else {
                availabilityElement.text("Shipment is not Available for this Pincode").removeClass("available").addClass("not-available");
            }
        },
        error: function(error) {
            console.error(error);
        }
    });
}

$(document).ready(function() {
    $('.changeaddress').click(function(e) {
        e.preventDefault();
        var submitButton = $(this);
        console.log("shipment address");

        var name = $("#custName").val();
        var add = $("#custSAddress").val();
        var pin = $(".custPincode").val(); // Corrected id here
        console.log(pin);

        $.ajax({
            type: 'POST',
            url: 'updateshipment',
            data: { name: name, custSAddress: add, custSpincode: pin },
            success: function(response) {
                console.log(response);
                if (response === "Valid") {
                    toastr.success("Address Changed");
                } else {
                    toastr.info("Shipment is Not available for this Address");
                }
            },
            error: function(error) {
                console.error(error);
            }
        });
    });
});

</script>
</body>
</html>
