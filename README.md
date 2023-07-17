# homepage_design

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@page import="eStoreProduct.model.custCredModel" %>
<!DOCTYPE html>
<html>
<head>
  <title>SLAM Store</title>
 <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
   <style type="text/css">
   select {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #fff;
    color: #333;
    font-size: 14px;
    width: 200px;
  }

  /* Custom styles for the dropdown arrow */
  select::-ms-expand {
    display: none; /* Remove the default arrow in Internet Explorer */
  }

  select::after {
    content: '\25BC'; /* Unicode character for a down arrow */
    position: absolute;
    top: 10px;
    right: 10px;
    padding: 0 8px;
    background-color: #ccc;
    color: #fff;
    pointer-events: none; /* Prevent the arrow from being clickable */
  }

  /* Custom styles for the dropdown options */
  select option {
    background-color: #fff;
    color: #333;
    font-size: 14px;
  }
       .profile-dropdown {
  position: relative;
  display: inline-block;
  transition: visibility;
  /* Add your desired background and text colors here */
  background-color: white;
  color: black;
}
.fas fa-user{
background-color:transparent;
}

.profile-dropdown:hover .dropdown-content {
  display: block;
  opacity: 1;
  transition: opacity 0.3s ease;
}

.dropdown-content {
  position: absolute;
  top: 100%;
  left: -60px; /* Adjust this value as per your preference */
  display: none;
  overflow: hidden;
  background-color: inherit; /* Set the background color to match the navbar */
  min-width: 120px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  padding: 12px 10px;
  z-index: 1;
  opacity: 0;
  transition: opacity 0.3s ease;
  /* Add your desired background and text colors here */
  background-color: navy;
  color: black;
}

.dropdown-content a {
  display: block;
  margin-bottom: 5px;
  white-space: nowrap; /* Ensures the content stays in a single line */
  /* Add your desired text color here */
  color: black;
}

.profile-dropdown:hover .dropdown-content a:hover {
  /* Add your desired background color for hovered links here */
  background-color: white;
}

body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
    flex-direction: column;
    min-height: 100vh;
    }    
   
    header {
  background-color:#047bd5;
  color: #fff;
      padding: 20px;
      display: flex;
      
      justify-content: space-between;
      align-items: center;
}
       
    nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

nav ul {
  display: flex;
  align-items: center;
  list-style-type: none;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline;
}

nav ul li:not(:last-child) {
  margin-right: 10px;
}

    nav ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px 20px;
      text-decoration:none;
    }
    nav ul li a:hover {
      background-color: white;
      text-decoration:none;
    }
    .search-bar {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
    }    
    .search-bar input[type="text"] {
      width: 300px;
      padding: 6px;
      border: none;
    }   
    .search-bar input[type="submit"] {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 6px 10px;
      cursor: pointer;
    }    
    .slideshow-container {
      position: relative;
      width: 100%;
      max-width: 800px;
      margin: 0 auto;
    }    
       
    .slideshow-container .slide {
      display: none;
    }  
    .slideshow-container .slide.active {
      display: block;
    }
    .slideshow-container img {
    width: 100%;
    height: 500px; /* Adjust the height as per your preference */
    object-fit: cover; 
    }
    
     a{
     text-decoration:none;
     }
     
     #spinner-container {
		  display: none; /* Initially hide the spinner */
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
		  z-index: 9999; /* Ensure the spinner is on top */
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		#spinner {
		  width: 40px;
		  height: 40px;
		  border: 4px solid #f3f3f3;
		  border-top: 4px solid #3498db;
		  border-radius: 50%;
		  animation: spin 1s linear infinite;
		}
		
		@keyframes spin {
		  0% {
		    transform: rotate(0deg);
		  }
		  100% {
		    transform: rotate(360deg);
		  }
		}
		   main {
		    flex: 1;
		  }
		
		  footer {
		    background-color: #047bd5;
		    color: #fff;
		    padding: 10px;
		    text-align: center;
		    position: fixed;
		    bottom: 0;
		    left: 0;
		    width: 100%;
		  }
		  h1{
		  font-family: "ColfaxAI,sans-serif";
		  }
   </style>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  
<!--   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
  <script>
  function showSpinner() {
	  var spinnerContainer = document.getElementById('spinner-container');
	  spinnerContainer.style.display = 'flex';
	}

	function hideSpinner() {
	  var spinnerContainer = document.getElementById('spinner-container');
	  spinnerContainer.style.display = 'none';
	}
  toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-bottom-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		};
    $(document).ready(function() {
      function loadCategories() {
        loadAllProducts();
        $.ajax({
          url: "CategoriesServlet",
          method: 'GET',
          success: function(response) {
            $('#catg').html(response);
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      var currentPage = 1; // Initialize the current page

      $(window).scroll(function() {
        // Check if the user has reached the bottom of the page
        if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
          loadAllProducts(); // Call the function to load more products
        }
      });

      function loadAllProducts() {
        // Show a loading indicator or spinner here if desired
        showSpinner();
		console.log("in load products");
        // Make an AJAX request to fetch the next set of products
        $.ajax({
          url: "productsDisplay",
          method: 'GET',
          data: { page: currentPage }, // Send the current page as a parameter
          success: function(response) {
            // Hide the loading indicator or spinner here if shown
        	  hideSpinner();
            // Append the fetched products to the existing product list on the page
            $('#productsdisplay').append(response);

            // Increment the current page
            currentPage++;

            
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
            // Handle the error condition here if necessary
          }
        });
      }

      /* function loadAllProducts() {
        console.log("loadallproducts");
    	  showSpinner();
        $.ajax({
          url: "productsDisplay",
          method: 'GET',
          success: function(response) {
            $('#productsdisplay').html(response);
            hideSpinner();
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      } */

      function addToCart(productId,quantity) {
        $.ajax({
          url: "addToCart",
          method: 'GET',
          data: { productId: productId, qty:quantity },
          success: function(response) {
            /* window.alert(response); */
            if(response=="Added to cart"){
        	  toastr.success(response);
            }else{
            	toastr.info("Already added to cart");
            }
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      function addToWishlist(productId) {

    	  <% if (session.getAttribute("customer")==null) { %>
    	    window.location.href = "signIn";
    	 <% }
          else
          {%>
      
        console.log("Add to wishlist called");
        $.ajax({
          url: "addToWishlist",
          method: 'GET',
          data: { productId: productId },
          success: function(response) {

        	  toastr.success(response);         
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
        <%}%>
      }

      function removeFromCart(productId) {
        console.log("Remove from cart called");
        $.ajax({
          url: "removeFromCart",
          method: 'GET',
          data: { productId: productId },
          success: function(response) {
        	  toastr.options = {
        			  "closeButton": false,
        			  "debug": false,
        			  "newestOnTop": false,
        			  "progressBar": false,
        			  "positionClass": "toast-bottom-right",
        			  "preventDuplicates": false,
        			  "onclick": null,
        			  "showDuration": "300",
        			  "hideDuration": "1000",
        			  "timeOut": "5000",
        			  "extendedTimeOut": "1000",
        			  "showEasing": "swing",
        			  "hideEasing": "linear",
        			  "showMethod": "fadeIn",
        			  "hideMethod": "fadeOut"
        			};
        	  toastr.success(response);
              showCart(); // Set the response HTML as the inner HTML of the cart items element
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      function removeFromWishlist(productId) {
        console.log("Remove from wishlist called");
        $.ajax({
          url: "removeFromWishlist",
          method: 'GET',
          data: { productId: productId },
          success: function(response) {
        	  toastr.options = {
        			  "closeButton": false,
        			  "debug": false,
        			  "newestOnTop": false,
        			  "progressBar": false,
        			  "positionClass": "toast-bottom-right",
        			  "preventDuplicates": false,
        			  "onclick": null,
        			  "showDuration": "300",
        			  "hideDuration": "1000",
        			  "timeOut": "5000",
        			  "extendedTimeOut": "1000",
        			  "showEasing": "swing",
        			  "hideEasing": "linear",
        			  "showMethod": "fadeIn",
        			  "hideMethod": "fadeOut"
        			};
        	  toastr.success(response);
        	  showWishlist(); // Set the response HTML as the inner HTML of the cart items element
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      function showCart() {
        $.ajax({
          url: "cartDisplay",
          method: 'GET',
          success: function(response) {
        	  $('#payment').html(response); // Set the response HTML as the inner HTML of the cart items element
          },
          error: function(xhr, status, error) {
            console.log('AJAX Error: ' + error);
          }
        });
      }

      function showWishlist() {
    	    <% if (session.getAttribute("customer")==null) { %>
    	        window.location.href = "signIn";
    	    <% }
    	    else
    	    {%>
    	  
    	    $.ajax({
    	        url: "wishlistItems",
    	        method: 'GET',
    	        success: function(response) {
    	            console.log("response of wishlist " + response);
    	            $('#payment').html(response); // Set the response HTML as the inner HTML of the cart items element
    	        },
    	        error: function(xhr, status, error) {
    	            console.log('AJAX Error: ' + error);
    	        }
    	    });
    	    <%}%>
    	}

     function loadProductsByCategory() {
    	 console.log("category selected");
    	 
    	  var category=document.getElementById("catg").value;
    	  console.log("category id when loading category "+category);
    	  $.ajax({
    	      url: "categoryProducts",
    	      method: 'post',
    	      data:{category_id:category},
    	      success: function(response) {    	      
    	        $('#payment').html(response); // Set the response HTML as the inner HTML of the select element
    	        
    	      },
    	      error: function(xhr, status, error) {
    	        console.log('AJAX Error: ' + error);
    	      }
    	    });}

      // Call the loadCategories function when the page loads
      loadCategories();

      // Call the loadAllProducts function when the page loads
     // loadAllProducts();

      // Add event listener for the "Add to Cart" button
      $(document).on('click', '.addToCartButton', function(event) {
        event.preventDefault();
        var productId = $(this).data('product-id');
        var quantity=$(this).data('quantity');
        console.log(productId);
        console.log(quantity+" quantityyyyy");
        addToCart(productId,quantity);
      });

      $(document).on('click', '.removeFromCart', function(event) {
        event.preventDefault();
        var productId = $(this).data('product-id');
        console.log(productId);
        removeFromCart(productId);
      });

      $(document).on('click', '.addToWishlistButton', function(event) {
        event.preventDefault();
        var productId = $(this).data('product-id');
        console.log(productId);
        addToWishlist(productId);
      });

      $(document).on('click', '.removeFromWishlist', function(event) {
        event.preventDefault();
        var productId = $(this).data('product-id');
        console.log(productId);
        removeFromWishlist(productId);
      });

      $('#catg').change(function() {
        loadProductsByCategory();
      });

      $('#cart-button').click(function() {
        showCart();
      });

      $('#Wishlist-button').click(function() {
        showWishlist();
      });
      
      var slides = $('.slide');
      var currentSlide = 0;

      // Function to show the current slide
      function showSlide() {
        // Hide all slides
        slides.hide();
        // Show the current slide
        slides.eq(currentSlide).show();
      }

      // Function to move to the next slide
      function nextSlide() {
        currentSlide++;
        if (currentSlide >= slides.length) {
          currentSlide = 0;
        }
        showSlide();
      }

      // Start the slideshow
      setInterval(nextSlide, 3000); // Change slide every 3 seconds
    });
  </script>
  <script>
  $(document).ready(function() {
    function showProductDetails(productId) {
    	console.log("showproduct");   
    	$.ajax({
            type: "POST",
            url: "prodDescription",
            data: { productId: productId },
            success: function(response) {
            	 $('#payment').html(response);
            },
            error: function() {
                alert("Error occurred while retrieving product details.");
            }
        });
    }
    function sortProducts() {
    	console.log("sort");  
    	var sort=document.getElementById("sortSelect").value;
    	$.ajax({
            type: "POST",
            url: "sortProducts",
            data: { sortOrder: sort },
            success: function(response) {
            	 $('#prod').html(response);
            },
            error: function() {
                alert("Error occurred while sorting product details.");
            }
        });
    }
    function filterProducts() {
    	console.log("filters");   
    	var filter=document.getElementById("filterSelect").value;
    	$.ajax({
            type: "POST",
            url: "filterProducts",
            data: { priceRange: filter },
            success: function(response) {
            	 $('#payment').html(response);
            },
            error: function() {
                alert("Error occurred while filtering product details.");
            }
        });
    }
    $('#searchbtn').on('click', function(event) {
  	  event.preventDefault();
  	  search();
  	});

  	$('#search').keypress(function(event) {
  	  if (event.which === 13) {
  	    event.preventDefault();
  	    search();
  	  }
  	});

  	$('#search').on('input', function() {
  	  var searchTerm = $(this).val();
  	  $.ajax({
  	    type: "GET",
  	    url: 'SearchSuggestions',
  	    data: { search: searchTerm },
  	    success: function(response) {
  	      var suggestions = $('#suggestions');
  	      suggestions.empty(); // Clear existing suggestions

  	      // Iterate over the response and add each suggestion as an <option> element
  	      response.forEach(function(suggestion) {
  	        suggestions.append('<option value="' + suggestion + '">' + suggestion + '</option>');
  	      });
  	    },
  	    error: function() {
  	      alert("Error occurred while retrieving search suggestions.");
  	    }
  	  });
  	});
  });
  function search() {
	  var searchTerm = document.getElementById("search").value;
	  $.ajax({
	    type: "GET",
	    url: 'searchProducts',
	    data: { search: searchTerm },
	    success: function(response) {
	      $('#payment').html(response);
	    },
	    error: function() {
	      alert("Error occurred while filtering product details.");
	    },
	    complete: function() {
	      // Clear the search input after the search is completed
	      $('#search').val('');
	    }
	  });
	}
</script>
</head>
<body>

  <header>
  <h1><i class="fas fa-shopping-cart"></i> SLAM</h1>
  <nav>
    <ul>
      <li ><a href="loggedIn" style="font-weight: bold;">Home</a></li>
      <li><a href="#" style="font-weight: bold;">About Us</a></li>
      <li><a href="#" style="font-weight: bold;">Contact</a></li>
      <li>
        <form action="/process-category" method="POST">
          <select name="catg" id="catg"></select>
        </form>
      </li>
      <li style="margin-left: auto;"><button type="button" id="cart-button" class="btn btn-primary" style="background-color: '#047bd5'; color: white; font-weight: bold;">Cart</button></li>
      <li><button type="button" id="Wishlist-button" class="btn btn-primary" style="background-color: '#047bd5'; color: white; font-weight: bold;">Wishlist</button></li>
      
      <li class="profile-dropdown">
      
	  <% if (session.getAttribute("customer")==null) { %>
	  
	   <!-- <i class="fas fa-user"></i> -->
	   
		<div style="background-color:#047bd5; display: inline-block; padding: 5px;">			
			<svg xmlns="http://www.w3.org/2000/svg" width="26" height="36" fill="currentColor" class="bi bi-person-heart" viewBox="0 0 16 16">
			  <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
			</svg>
		</div>
	
	
	    <div class="dropdown-content" style="margin-left: -30px;">
	      <a href="signUp" style="background-color: navy; color: white; font-weight: bold;">Sign Up</a>
	      <a href="signIn" style="background-color: navy; color: white; font-weight: bold;">Sign In</a>
	    </div>
	  <% } else { %>
	    <!-- <i class="fas fa-user"></i> -->
	    <div style="background-color:#047bd5; display: inline-block; padding: 5px;">
	    	<svg xmlns="http://www.w3.org/2000/svg" width="26" height="36" fill="currentColor" class="bi bi-person-heart" viewBox="0 0 16 16">
			  <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
			</svg>
		</div>
	    <div class="dropdown-content" style="margin-left: -30px;">
	      <a href="profilePage" style="background-color: navy; color: white; font-weight: bold;">My Profile</a>
	      <a href="logout" style="background-color: navy; color: white; font-weight: bold;">Log Out</a>
	    </div>
	  <% } %>
	</li>
      
    </ul>
  </nav>
</header>

<!-- Spinner -->
<div id="spinner-container">
   <div id="spinner"></div>
</div>

 <div id="payment"> 
 	<br>
 	
 	<!-- SearchBar -->
		<div class="d-flex justify-content-center serachbar">
		  <div class="input-group mb-3" style="max-width: 500px;">
		    <input type="search" class="form-control bg-white" placeholder="Search products here.." id="search" list="suggestions">
		    <datalist id="suggestions"></datalist>
		    <div class="input-group-append">
		      <button class="btn btn-primary" type="button" id="searchbtn">Search</button>
		    </div>
		  </div>
		</div>


	<main>
	<div id="maindiv">
		 	<div class="text-center">
			    <b><label for="sortSelect">Sort By </label></b>
			    <select id="sortSelect" onchange="sortProducts()" class="form-select">
			        <option value="default">Default</option>
			        <option value="lowToHigh">Price (Low to High)</option>
			        <option value="highToLow">Price (High to Low)</option>
			    </select>
				
				<b><label for="filterSelect">Filter By </label></b>
			    <select id="filterSelect" onchange="filterProducts()" class="form-select">
			        <option value="default">All</option>
			        <option value="0-500">Price (Rs. 0-500)</option>
			        <option value="500-1000">Price (Rs. 500-1000)</option>
			        <option value="1000-2000">Price (Rs. 1000-2000)</option>
			        <option value="2000-4000">Price (Rs. 2000-4000)</option>
			    </select>
			</div>
	
	
	  		<div id="prod"> 
		  		
		        <div id="transitionSlideShowPage">
		                     <div class="slideshow-container">
		                         <div class="slide active">
		                             <img  src="https://www.stuff.tv/wp-content/uploads/sites/2/2021/04/Stuff-Best-Laptop-Lead.png"  onclick="loadProductsByCategory(1)"/>
		                         </div>
		                         <div class="slide">
		                             <img src="https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/05/Apple-Earbuds-and-Sony-headphones-side-by-side.jpg" alt="Slide 2" onclick="loadProductsByCategory(3)">
		                        </div>
		                        <div class="slide">
		                               <img src="https://chamberhill.com/wp-content/uploads/2021/10/pexels-cottonbro-3945683-scaled.jpg" alt="Slide 3" onclick="loadProductsByCategory(5)">
		                        </div>
		                        <div class="slide">
		                                <img src="https://assets.thehansindia.com/h-upload/2022/04/30/1600x960_1289668-mobiles-11.jpg" onclick="loadProductsByCategory(2)" alt="Slide 4">
		                        </div>
		                    </div>
		       	</div>
		    	<div id="productsdisplay"></div>
	    	</div>
	 </div>
</main>
<footer>
  <p>&copy; 2023 SLAM Store. All rights reserved.</p> 
</footer>
</div>
    


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

  $(document).ready(function() {
    var slides = $('.slide');
    var currentSlide = 0;    
    // Function to show the current slide
    function showSlide() {
      // Hide all slides
      slides.hide();     
      // Show the current slide
      slides.eq(currentSlide).show();
    }    
    // Function to move to the next slide
    function nextSlide() {
      currentSlide++;
      if (currentSlide >= slides.length) {
        currentSlide = 0;
      }
      showSlide();
    }    
    // Start the slideshow
    setInterval(nextSlide, 3000); // Change slide every 3 seconds
  });
  function loadProductsByCategory(catgId) {
 	 console.log("category selected");
 	 showSpinner();
 	  $.ajax({
 	      url: "categoryProducts",
 	      method: 'post',
 	      data:{category_id:catgId},
 	      success: function(response) {
 	    	  console.log("response of category based prod "+response);
 	      
 	        $('#maindiv').html(response); // Set the response HTML as the inner HTML of the select element
 	        hideSpinner(); 
 	      },
 	      error: function(xhr, status, error) {
 	        console.log('AJAX Error: ' + error);
 	      }
 	    });}
  $('#searchbtn').on('click', function(event) {
	  event.preventDefault();
	  search();
	});

</script>

</body>
</html>
