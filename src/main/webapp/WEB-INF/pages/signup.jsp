<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<style type="text/css">
#message {
	display: none;
	background: #f1f1f1;
	color: #000;
	position: relative;
	padding: 20px;
	margin-top: 10px;
}

#message p {
	padding: 10px 35px;
	font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

.valid:before {
	position: relative;
	left: -35px;
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color: red;
}

.invalid:before {
	position: relative;
	left: -35px;
}
</style>
</head>
<body style="">
	<%@include file="common/navbar.jsp"%>

	<div class="container shadow-lg p-3 mb-20 bg-grey rounded"
		style="border: 2px solid red; margin-bottom: 10px; margin-top: 10px; width: 60%; height: 60%;">
		<div class="text-center" style="font-size: 40px">
			<b>SIGN UP</b>
		</div>
		<form id="idform" action="">

			<div class="form-group">
				<label for="firstname">First Name</label> <input name="fname"
					style="width: 50%" type="text" class="form-control" id="firstname"
					placeholder="Enter First Name" required>
			</div>
			<div class="form-group">
				<label for="lastname">Last Name</label> <input name="lname"
					type="text" class="form-control" id="lastname"
					placeholder="Enter Last Name" required>
			</div>
			<div class="form-group">
				<label for="inputEmail4">Email</label> <input name="email"
					style="width: 50%" type="email" class="form-control"
					id="inputEmail4" placeholder="Email" required>
			</div>

			<div class="form-group">
				<label for="mobilenumber">Mobile No</label> <input type="tel"
					style="width: 50%" name="mobileno" id="mobilenumber"
					class="form-control" pattern="[0-9]{10}"
					placeholder="10 digit number" title="Ten digits code" required />
			</div>



			<div class="form-group">
				<label for="inputAddress">Address 1</label> <input name="addr1"
					type="text" class="form-control" id="inputAddress"
					placeholder="1234 Main St" required>
			</div>
			<div class="form-group">
				<label for="inputAddress2">Address 2</label> <input name="addr2"
					type="text" class="form-control" id="inputAddress2"
					placeholder="Apartment, studio, or floor" required>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputState">State</label> <input name="state"
						type="text" class="form-control" id="inputState"
						placeholder="Enter Country" required>
				</div>
				<div class="form-group col-md-6">
					<label for="inputCity">City</label> <input name="city" type="text"
						class="form-control" id="inputCity" placeholder="Enter City"
						required>
				</div>

				<div class="form-group col-md-2">
					<label for="inputZip">Zip</label> <input name="pin" type="text"
						class="form-control" id="inputZip" placeholder="Enter PinCode"
						required>
				</div>
			</div>
			<div class="form-group">
				<label for="username">User Name <b class="text-danger"
					style="font-size: 10px">(Use any combination of lower
						case,upper case Alph or number including special character
						also.Range limit 6-15)</b></label> <input name="uname" style="width: 50%"
					onchange="usernamevalidate()" type="text" class="form-control"
					id="username" placeholder="abc@1234"
					pattern="^[A-Za-z0-9\W+]{6,15}$"
					title="Use any combination of lower case,upper case Alph or number including special character also.Range limit 6-15"
					required> <span class="text-success" id="avail"
					style="display: none"> Available </span> <span class="text-danger"
					id="notavail" style="display: none">Not Available</span>

			</div>
			<div class="form-group">
				<label for="psw">Password <b class="text-danger"
					style="font-size: 10px">(Must contain at least one number and
						one uppercase and lowercase letter, and at least 8 or more
						characters)</b></label> <input name="password" type="password"
					class="form-control" style="width: 50%" id="psw"
					placeholder="Password"
					title="Must contain at
					 least one number and one uppercase and lowercase letter,
					  and at least 8 or more characters"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>

			</div>


			<div class="text-center " style="margin-bottom: 5px">
				<button type="submit" class="btn btn-success">Sign-Up</button>
			</div>
		</form>

		<div id="message">
			<h3>Password must contain the following:</h3>
			<p id="letter" class="invalid">
				A <b>lowercase</b> letter
			</p>
			<p id="capital" class="invalid">
				A <b>capital (uppercase)</b> letter
			</p>
			<p id="number" class="invalid">
				A <b>number</b>
			</p>
			<p id="length" class="invalid">
				Minimum <b>8 characters</b>
			</p>
		</div>

	</div>


	<%@include file="common/commonBottomNavBar.jsp"%>


	<script>
		// form submit
		$("#idform")
				.submit(
						function(e) {

							if ($("#notavail").attr("style") == "display:block") {
								e.preventDefault(); // avoid to execute the actual submit of the form.
								alert("Please Choose another username")
							} else {
								console.log("hello");
								e.preventDefault(); // avoid to execute the actual submit of the form.
								var fname = $("#firstname").val();
								var lname = $("#lastname").val();
								var email = $("#inputEmail4").val();
								var mobileno = $("#mobilenumber").val();
								var addr1 = $("#inputAddress").val();
								var addr2 = $("#inputAddress2").val();
								var state = $("#inputState").val();
								var city = $("#inputCity").val();
								var pin = $("#inputZip").val();
								var uname = $("#username").val();
								var password = $("#psw").val();

								console.log(fname);
								var form = $(this);

								var str = {
									"fname" : fname,
									"lname" : lname,
									"email" : email,
									"mobileno" : mobileno,
									"addr1" : addr1,
									"addr2" : addr2,
									"state" : state,
									"city" : city,
									"pin" : pin,
									"uname" : uname,
									"password" : password
								};

								$
										.ajax({
											type : "POST",
											url : "/lakshdeep/signup",
											data : JSON.stringify(str), // serializes the form's elements
											contentType : "application/json",
											success : function(data) {

												// Ajax call completed successfully
												alert("Form Submited Successfully"
														+ data);
												window.location = "http://localhost:8082/lakshdeep/signinpage";

											},
											error : function(data) {

												// Some error in ajax call
												alert("some Error");
											}

										});
							}
						});

		// username validation

		function usernamevalidate() {

			var x = document.getElementById("username").value;
			var len = Number(x.length);
			//alert(len.valueOf());
			if (len >= 6 && len <= 15) {
				//alert("ready");

				$.ajax({
					type : "GET",
					url : "/lakshdeep/getuserbyusername/" + x,
					success : function(data) {

						$("#notavail").attr("style", "display:block")
						$("#avail").attr("style", "display:none")
						// Ajax call completed successfully
						///alert("Form Submited Successfully" + data);

					},
					error : function(data) {

						$("#avail").attr("style", "display:block")
						$("#notavail").attr("style", "display:none")
						// Some error in ajax call
						//alert("some Error"+data);
					}

				});

			} else {
				$("#notavail").attr("style", "display:none")
				$("#avail").attr("style", "display:none")
			}

		}

		// Password validation
		var myInput = document.getElementById("psw");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");

		// When the user clicks on the password field, show the message box
		myInput.onfocus = function() {
			document.getElementById("message").style.display = "block";
		}

		// When the user clicks outside of the password field, hide the message box
		myInput.onblur = function() {
			document.getElementById("message").style.display = "none";
		}

		// When the user starts to type something inside the password field
		myInput.onkeyup = function() {
			// Validate lowercase letters
			var lowerCaseLetters = /[a-z]/g;
			if (myInput.value.match(lowerCaseLetters)) {
				letter.classList.remove("invalid");
				letter.classList.add("valid");
			} else {
				letter.classList.remove("valid");
				letter.classList.add("invalid");
			}

			// Validate capital letters
			var upperCaseLetters = /[A-Z]/g;
			if (myInput.value.match(upperCaseLetters)) {
				capital.classList.remove("invalid");
				capital.classList.add("valid");
			} else {
				capital.classList.remove("valid");
				capital.classList.add("invalid");
			}

			// Validate numbers
			var numbers = /[0-9]/g;
			if (myInput.value.match(numbers)) {
				number.classList.remove("invalid");
				number.classList.add("valid");
			} else {
				number.classList.remove("valid");
				number.classList.add("invalid");
			}

			// Validate length
			if (myInput.value.length >= 8) {
				length.classList.remove("invalid");
				length.classList.add("valid");
			} else {
				length.classList.remove("valid");
				length.classList.add("invalid");
			}
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>