<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="css/navbarcss.css" rel="stylesheet">
<link href="css/animationcss.css" rel="stylesheet">
</head>
<body>
	<div class="navb"
		style="text-align: center; color: white; background-color: red; height: 100px">
		<div id="titletrans" class="nav-title"
			style="padding: 10px; font-size: 40px">Lakshdeep Foundation</div>
	</div>
	<div class="navb">
		<input type="checkbox" id="nav-check">
		<div class="nav-header">
			<div class="nav-title"
				style="border: 2px solid; border-radius: 10px; margin-top: 1px; margin-bottom: 15px">Lakshdeep
				Foundation</div>
		</div>
		<div class="nav-btn">
			<label for="nav-check"> <span></span> <span></span> <span></span>
			</label>
		</div>

		<div class="nav-links">
			<a href="hello"><i class="fa fa-home"
				aria-hidden="true"></i>Home</a> <a href="#">AboutUs</a> <a href="#"><i
				class="fa fa-phone" aria-hidden="true"></i> ContactUs</a> <a
				href="signuppage"><i class="fas fa-registered"
				aria-hidden="true"></i>SignUp</a> <a href="signinpage"><i
				class="fa fa-sign-in" aria-hidden="true"></i>UserLogin</a> <a href="#"><i
				class="fa fa-sign-in" aria-hidden="true"></i>AdminLogin</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	 crossorigin="anonymous"></script>

</body>
</html>