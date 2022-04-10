<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="common/navbar.jsp"%>

	<div class="container shadow-lg p-3 mb-20 bg-grey rounded"
		style="border: 2px solid blue; margin-bottom: 10px; margin-top: 10px; width: 60%; height: 60%;">
		<div class="text-center" style="font-size: 40px">
			<b class="text-primary">Donate</b>
		</div>
		<div class="container">
			<form id="checkform" action="">

				<div class="form-group">
					<label for="amount">Amount</label> <input name="amt" type="number"
						class="form-control" style="width: 50%" id="amount"
						placeholder="Amount" required>

				</div>


				<div class="text-center mt-4 " style="">
					<button type="submit" class="btn btn-success">CHECKOUT</button>
				</div>
			</form>
		</div>


	</div>



	<%@include file="common/commonBottomNavBar.jsp"%>
	<script>
		$("#checkform").submit(function(e) {

			e.preventDefault(); // avoid to execute the actual submit of the form.

			var amt = $("#amount").val();

			var str = {
				amt : amt
			};

			$.ajax({
				type : "POST",
				url : "/lakshdeep/donationcheckout",
				data : str, // serializes the form's elements
				success : function(res) {
                   
					var data=JSON.parse(res);
					console.log("helloooo "+data.amount+" "+data)
					var options = {
						key : "rzp_test_9ax0XALM5hECdE",
						amount : data.amount,
						currency : "INR",
						name : "Lakshdeep Foundation",
						description : "Donation",
						image:"",
						order_id : data.id,
						handler : function(response) {
							alert("payment succesfull "+response.razorpay_payment_id);
							alert(response.razorpay_order_id);
							alert(response.razorpay_signature)
						},
						prefill : {
							"name" : "",
							"email" : "",
							"contact" : ""
						},
						notes : {
							"address" : "MA TECHNOLOGIES"
						},
					};

					let raz = new Razorpay(options);

					raz.on('payment.failed', function(response) {
						alert("paymnt failed")
					});

					raz.open();


				},
				error : function(data) {

					console.log(data.responseText)
					// Some error in ajax call
					alert(JSON.stringify(data.responseText));
				}

			});

		});
	</script>
</body>
</html>