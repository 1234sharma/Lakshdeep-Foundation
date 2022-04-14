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

	<div class="container bg-light mt-5 ">
		<div class="text-center mt-5">
			<h1 class="text-danger">
				<b>Contact Us</b>
			</h1>
		</div>

		<form id="idform" class="" style="margin-left: 40px">

			<div class="form-group mt-5">
				<label for="nameid">Name</label> <input type="text" name="username"
					style="width: 50%" class="form-control" id="nameid"
					aria-describedby="namehelp" placeholder="Enter name" required>
			</div>

			<div class="form-group mt-5">
				<label for="emailid">Email address</label> <input
					style="width: 50%" type="email" class="form-control" name="email"
					id="emailid" aria-describedby="emailHelp"
					placeholder="Enter email" required> <small id="emailHelp"
					class="form-text text-muted">We will reach out to you by
					this mail.</small>
			</div>

			<div class="form-group mt-5">
				<label for="massageid">Message</label>
				<textarea class="form-control" id="massageid" name="massage"rows="5" required></textarea>
			</div>


			<div class="container text-center mb-4 mt-5">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>

	<%@include file="common/commonBottomNavBar.jsp"%>
	<script>
		$(document).ready(function() {

			$("#foot").removeClass("fixed-bottom");
		});
		
		
		
		$("#idform").submit(function(e) {

			e.preventDefault(); // avoid to execute the actual submit of the form.

			console.log("hello");

			var name = $("#nameid").val();
			var email = $("#emailid").val();
			var massage=$("#massageid").val();

			var form = $(this);

			var str = {
				name : name,
				email : email,
				massage:massage
			};

			$.ajax({
				type : "POST",
				url : "/lakshdeep/contactus",
				data : str, // serializes the form's elements
				success : function(data) {

					// Ajax call completed successfully
					alert("Details submitted succesfully");
					window.location = "http://localhost:8082/lakshdeep/";
					//alert(data);

				},
				error : function(data) {

					// Some error in ajax call
					alert("Please Try Again");
				}

			});

		});

	</script>
</body>
</html>