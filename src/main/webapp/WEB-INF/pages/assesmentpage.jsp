<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Itsourcecode Examination Application</title>
<style type="text/css">
div#test {
	border: #000 1px solid;
	padding: 10px 40px 40px 40px;
	width: 640px;
	margin: auto;
	border-radius: 12px;
	background-color: blue;
	color: white;
}
</style>
<center>
	<h1 style="background-color: blue; color: white;">CHMSC
		Examination Apps System</h1>
</center>
<script language="javascript" type="text/javascript"
	src="js/assesmentpage.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/easytimer@1.1.1/dist/easytimer.min.js"></script>


</head>
<body>


	<div id="startValuesAndTargetExample">
		<div class="values"></div>

	</div>

	<h2 id="test_status" style="text-align: center;"></h2>
	<div id="test"></div>



	<script>
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