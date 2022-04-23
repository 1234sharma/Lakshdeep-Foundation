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
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet">

<script src="js/RdataTB-main/dist/index.js"></script>




<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'segoe ui';
}

.navb {
	height: 50px;
	width: 100%;
	background-color: #4d4d4d;
	position: relative;
	z-index: 4;
}

.navb>.nav-header {
	display: inline;
}

.navb>.nav-header>.nav-title {
	display: inline-block;
	font-size: 22px;
	color: #fff;
	padding: 7px 7px 7px 7px;
}

.navb>.nav-btn {
	display: none;
}

.navb>.nav-links {
	display: inline;
	float: right;
	font-size: 18px;
}

.navb>.nav-links>a {
	display: inline-block;
	padding: 13px 10px 13px 10px;
	text-decoration: none;
	color: #efefef;
}

.navb>.nav-links>a:hover {
	background-color: rgba(0, 0, 0, 0.3);
}

.navb>#nav-check {
	display: none;
}

@media ( max-width :600px) {
	.navb>.nav-btn {
		display: inline-block;
		position: absolute;
		right: 0px;
		top: 0px;
	}
	.navb>.nav-btn>label {
		display: inline-block;
		width: 50px;
		height: 50px;
		padding: 13px;
	}
	.navb>.nav-btn>label:hover, .nav  #nav-check:checked ~ .nav-btn>label {
		background-color: rgba(0, 0, 0, 0.3);
	}
	.navb>.nav-btn>label>span {
		display: block;
		width: 25px;
		height: 10px;
		border-top: 2px solid #eee;
	}
	.navb>.nav-links {
		position: absolute;
		display: block;
		width: 100%;
		background-color: #333;
		height: 0px;
		transition: all 0.3s ease-in;
		overflow-y: hidden;
		top: 50px;
		left: 0px;
	}
	.navb>.nav-links>a {
		display: block;
		width: 100%;
	}
	.navb>#nav-check:not(:checked) ~ .nav-links {
		height: 0px;
	}
	.navb>#nav-check:checked ~ .nav-links {
		height: calc(100vh - 50px);
		overflow-y: auto;
	}
}

#titletrans {
	animation: mymove 5s;
}

@
keyframes mymove { 0% {
	font-size: 2px;
}
100
















%
{
font-sze
















:
















20px
















}
;
}
</style>
</head>
<body>
	<%
	String username = (String) session.getAttribute("uname");
	String role = (String) session.getAttribute("role");
	%>
	<div class="navb"
		style="text-align: center; color: white; background-color: red; height: 100px">
		<div id="titletrans" class="nav-title"
			style="padding: 10px; font-size: 40px">
			<img style="height: 80px; width: 10%; margin-left: 30px"
				src="https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884__340.png">
			Lakshdeep Foundation
		</div>
	</div>
	<div class="navb" style="height: 100px">
		<input type="checkbox" id="nav-check">
		<div class="nav-header">
			<div class="nav-title text-center"
				style="margin-top: 1px; margin-bottom: 15px">

				<img style="height: 80px; width: 100%; margin-left: 30px"
					src="https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884__340.png">
			</div>
		</div>
		<div class="nav-btn">
			<label for="nav-check"> <span></span> <span></span> <span></span>
			</label>
		</div>

		<div class="nav-links">
			<a href="hello"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
			<a href="#">AboutUs</a> <a href="contactuspage"><i
				class="fa fa-phone" aria-hidden="true"></i> ContactUs</a>
			<!-- comman tabs -->

			<%
			if (username != null) {
			%>
			<!-- After login -->
			<%
			if (role.equals("user")) {
			%>
			<a href="donationpage"><i class="fas fa-donate"
				aria-hidden="true"></i>Donate</a>
		    <a href="scholarshippage"><i
				class="fa fa-graduation-cap" aria-hidden="true"></i>Scholarship</a>
			<%
			}
			%>
			<%
			if (role.equals("admin")) {
			%>
			<a href="userlistpage"><i class="fas fa-registered"
				aria-hidden="true"></i>UserList</a>
			<%
			}
			%>
			<a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>LogOut</a>
			<%
			} else {
			%>
			<!-- Before login -->
			<a href="signuppage"><i class="fas fa-registered"
				aria-hidden="true"></i>SignUp</a> <a href="signinpage"><i
				class="fa fa-sign-in" aria-hidden="true"></i>UserLogin</a> <a href="#"><i
				class="fa fa-sign-in" aria-hidden="true"></i>AdminLogin</a>
			<%
			}
			%>
		</div>
	</div>

	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</body>
</html>