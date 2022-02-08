//$(document).ready(function() {
//	$(".btn-star").click(function() {
//		alert("Bạn đã click tôi")
//	})
//});
//$(document).ready(function() {
//		$("tr[data-id]input").on("input", function() {
//			var id = $(this).closest("tr").attr("data-id");
//			var price = $(this).closest("tr").attr("data-price");
//			var discount = $(this).closest("tr").attr("data-discount");
//			var quantity = $(this).val();
//			$.ajax({
//			
//				url: "/cart/update/${quantity}",
//				success: function(response) {
//					$("#cart-cnt").html(response[0]);
//					$("#cart-amount").html(response[1]);
//				}
//			});
//			var amount = (price - price * discount / 100) * quantity;
//			$(this).closest("tr").find("td.amount").html(amount);
//		});
//	});