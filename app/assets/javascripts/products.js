// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	$("#add-to-cart-submit").on('submit',function(e){
		e.preventDefault();
		var form_data = $(this).serializeArray();
		var user_id= form_data[1].value;
		var product_id= form_data[0].value;
		$.ajax({url: "/carts_products" ,
			method: 'post',
			data: {user_id: user_id, product_id: product_id}
		});
		$.get("/carts/:id", function(response){
			$("#placeholder").html("<br><br>Your Cart:<br><br>"+response)
		});
	});
})
