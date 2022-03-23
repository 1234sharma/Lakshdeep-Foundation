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
		style="border: 2px solid red; margin-bottom: 10px; margin-top: 10px; width: 60%; height: 60%;">
		<div class="text-center" style="font-size: 40px">
			<b>USER LOGIN</b>
		</div>
		<div class="container">
			<form id="idform" action="">
				<div class="form-group">
					<label for="username">User Name</label> <input name="uname"
						style="width: 50%" type="text" class="form-control" id="username"
						placeholder="abc@1234" required>

				</div>
				<div class="form-group">
					<label for="psw">Password </label> <input name="password"
						type="password" class="form-control" style="width: 50%" id="psw"
						placeholder="Password" required>

				</div>


				<div class="text-center mt-4 " style="">
					<button type="submit" class="btn btn-success">LOGIN</button>
				</div>
			</form>
		</div>


	</div>


	<%@include file="common/commonBottomNavBar.jsp"%>
	<script>
		//form submit
		$("#idform").submit(function(e) {

			e.preventDefault(); // avoid to execute the actual submit of the form.

			console.log("hello");

			var uname = $("#username").val();
			var password = $("#psw").val();

			var form = $(this);

			var str = {
				"uname" : uname,
				"password" : password
			};

			$.ajax({
				type : "POST",
				url : "/lakshdeep/signin",
				data : JSON.stringify(str), // serializes the form's elements
				contentType : "application/json",
				success : function(data) {

					// Ajax call completed successfully
					alert(data);

				},
				error : function(data) {

					// Some error in ajax call
					alert(JSON.stringify(data.responseText));
				}

			});

		});
	</script>

</body>
</html>