<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="eStoreProduct.utility.ProductStockPrice" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
		
        <style>
           body {
            font-family: Arial, sans-serif;
      		margin: 0;
      		padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .product-card {
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: box-shadow 0.3s;
            cursor: pointer;
            margin-bottom: 20px;
            display: flex;
        }

        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 200px;
            height: 200px;
            object-fit: cover;
        }

        .product-details {
            padding: 20px;
            flex-grow: 1;
        }

        .product-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .product-description {
            font-size: 14px;
            margin-bottom: 10px;
            color: #666;
        }
		#pcd{
		  flex: 0 0 auto;
		  width: 25%;
		}
		#btn{
		  flex: 0 0 auto;
		  width: 15%;
		}
        .product-price {
            font-size: 16px;
            font-weight: bold;
            color: #e91e63;
        }
         .input-button-container {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		  }
		
		  .input-button-container .form-control {
		    margin-right: -10px; /* Adjust the margin as needed */
		  }
		   .not-available {
        color: red;
        font-style: italic;
    }

    .available {
        color: green;
    }
    .input-width{
	    width: 50px; /* Adjust the width as per your preference */
	}
	
	    
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>

<body>
       <div class="container mt-5">
        <h2>Wishlist</h2>
        <div class="row mt-4">
            <%-- Iterate over the products and render the HTML content --%>
            <%
            List<ProductStockPrice> products = (List<ProductStockPrice>) request.getAttribute("products");
             for (ProductStockPrice product : products) {
                	
            %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="<%= product.getImage_url() %>" alt="<%= product.getProd_title() %>">
                    <br>
                    
                    <div class="card-body">
                                      
                       <h5 class="card-title"><%= product.getProd_title() %></h5>
                    <p class="card-text"><%= product.getProd_desc() %></p>
                    <p class="card-text"><%= product.getPrice() %></p> 
                        <button class="btn btn-primary removeFromWishlist" data-product-id="<%= product.getProd_id() %>">Remove from Wishlist</button>
                        <button class="btn btn-secondary addToCartButton" data-product-id="<%= product.getProd_id() %>">Add to cart</button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>