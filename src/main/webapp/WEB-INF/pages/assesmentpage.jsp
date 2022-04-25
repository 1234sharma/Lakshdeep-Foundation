<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lakshdeep Foundation Scholarship Examination</title>
<style type="text/css">
div#test {
	border: #000 1px solid;
	padding: 10px 40px 40px 40px;
	width: 640px;
	margin: auto;
	margin-bottom:5%;
	border-radius: 12px;
	background-color: grey;
	color: white;
}
</style>

<script language="javascript" type="text/javascript"
	src="js/assesmentpage.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/easytimer@1.1.1/dist/easytimer.min.js"></script>


</head>
<body>

	<%@include file="common/navbar.jsp"%>

<center class="mt-2">
	<h1 style="background-color: blue; color: white;">Lakshdeep Foundation Scholarship Exam</h1>
</center>
<div class="container">
	<div id="startValuesAndTargetExample">
		<div class="values" style="font-size: 30px"></div>

	</div>

	<h2 id="test_status" style="text-align: center;"></h2>
	<div id="test"></div>
</div>

	<%@include file="common/commonBottomNavBar.jsp"%>


	<script>
	$(document).ready(function() {

		$("#foot").removeClass("fixed-bottom");
	});
		var timer = new Timer();

		timer.start({
			precision : 'seconds',
			startValues : {
				seconds : 0
			},
			target : {
				minutes : 0,
				seconds : 30
			}
		});

		$('#startValuesAndTargetExample .values').html(
				timer.getTimeValues().toString());

		timer.addEventListener('secondsUpdated', function(e) {

			$('#startValuesAndTargetExample .values').html(
					timer.getTimeValues().toString());
		});

		timer.addEventListener('targetAchieved', function(e) {
			alert("Test Finished your response will get submit automatically");
			$('#startValuesAndTargetExample .progress_bar').html('COMPLETE!!');
		});
	</script>
</body>
</html>