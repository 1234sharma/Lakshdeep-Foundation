<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Scholership Exam</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<%@include file="common/navbar.jsp"%>


	<div class="container bg-light mt-5 " style="height: 40%; width: 40%">
		<div class="text-center mt-5">
			<h1 class="text-danger">
				<b>Add Question</b>
			</h1>
		</div>

		<form id="idform" class="" style="margin-left: 40px">

			<div class="form-group">
				<label for="Question">Question:</label> <input type="text"
					class="form-control" id="question" placeholder="Enter Question"
					name="question">
			</div>
			<div class="form-group">
				<label for="option1">Option1:</label> <input type="text"
					class="form-control" id="option1" placeholder="Enter option"
					name="option1">
			</div>
			<div class="form-group">
				<label for="option1">Option2:</label> <input type="text"
					class="form-control" id="option2" placeholder="Enter option"
					name="option2">
			</div>
			<div class="form-group">
				<label for="option1">Option3:</label> <input type="text"
					class="form-control" id="option3" placeholder="Enter option"
					name="option3">
			</div>
			<div class="form-group">
				<label for="option1">Option4:</label> <input type="text"
					class="form-control" id="option4" placeholder="Enter option"
					name="option4">
			</div>


			<div class="form-group">
				<label for="answer">Answer</label> <select class="form-control"
					id="answer">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>

				</select>
			</div>
			<div class="container text-center mb-4 mt-5">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>


	<div class="container mt-5">
		<table table table-striped table-bordered table-hover id="myTable"
			border="1">
			<thead>
				<tr>
					<th>Question</th>
					<th>Option1</th>
					<th>Option2</th>
					<th>Option3</th>
					<th>Option4</th>
					<th>Answer</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>

	<%@include file="common/commonBottomNavBar.jsp"%>
</body>
<script>
	var table;
	$(document).ready(function() {
		table = $('#myTable').DataTable();

		tabledataload();

	});

	function tabledataload() {
		$.ajax({
			url : "/lakshdeep/questionlist",
			type : 'GET',
			success : function(data) {
				console.log(data);
				for (let i = 0; i < data.length; i++) {
					$('#myTable').DataTable().row.add(
							[
									data[i].question,
									data[i].option1,
									data[i].option2,
									data[i].option3,
									data[i].option4,
									data[i].answer,

									'<button  class="btn btn-danger" onclick="deletequestion(`'
											+ data[i].questionno
											+ '`)">DELETE</button>' ]).draw();

				}

			},
			error : function() {
				console.log('error');
			}
		});
	}

	function deletequestion(val) {

		$.ajax({
			url : "/lakshdeep/deletequestion/" + val,
			type : 'DELETE',
			success : function(data) {
				alert("Deleted Succesfully")
				table.clear().draw();
				tabledataload();
			},
			error : function() {
				console.log('error');
			}
		});

	}

	$(document).ready(function() {

		$("#foot").removeClass("fixed-bottom");
	});

	$("#idform").submit(function(e) {

		e.preventDefault(); // avoid to execute the actual submit of the form.

		console.log("hello");

		var question = $("#question").val();
		var option1 = $("#option1").val();
		var option2 = $("#option2").val();
		var option3 = $("#option3").val();
		var option4 = $("#option4").val();
		var answer = $("#answer").val();

		var str = {
			//questionno questionno;
			"question" : question,
			"option1" : option1,
			"option2" : option2,
			"option3" : option3,
			"option4" : option4,
			"answer" : answer
		};

		$.ajax({
			type : "POST",
			url : "/lakshdeep/addQuestion",
			data : JSON.stringify(str), // serializes the form's elements
			contentType : "application/json",
			success : function(data) {

				// Ajax call completed successfully
				alert("Form Submited Successfully" + data);
				table.clear().draw();
				tabledataload();
				//window.location = "http://localhost:8082/lakshdeep/signinpage";

			},
			error : function(data) {

				// Some error in ajax call
				alert("some Error");
			}

		});

	});
</script>
</html>