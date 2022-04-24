<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Scholership Exam</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<%@include file="common/navbar.jsp"%>
    <div class="container">
        <h2>Stacked form</h2>
        <form action="addQuestion" style="border: 2px solid;">
            <div class="form-group">
                <label for="Question">Question:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter Question" name="question">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="option1" placeholder="Enter option" name="option1">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="option2" placeholder="Enter option" name="option2">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="option3" placeholder="Enter option" name="option3">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="option4" placeholder="Enter option" name="option4">
            </div>
            <div class="form-group">
                <label for="option1">Answer:</label>
                <input type="text" class="form-control" id="answer" placeholder="Enter option" name="answer">
            </div>

    </div>
    <button type="submit" class="btn btn-primary"onclick="questionAnswer()" style="float:right">Submit</button>
    </form>
    </div>
<%@include file="common/commonBottomNavBar.jsp"%>
</body>
<script>
		
function questionAnswer()

{
	var Question = $("#question").val();
	var option1 = $("#option1").val();
	var option2=$("#option2").val();
	var option3 = $("#option3").val();
	var option4 = $("#option4").val();
	var answer=$("#answer").val();

var str = {
	//questionno questionno;
	"Question" :  Question;
	"option1" : option1;
	"option2" : option2;
	"option3" : option3;
	"option4"  : option4;
	"answer" : answer;
};

	$
	.ajax({
		type : "POST",
		url : "/lakshdeep/addQuestion",
		data : JSON.stringify(str), // serializes the form's elements
		contentType : "application/json",
		success : function(data) {

			// Ajax call completed successfully
			alert("Form Submited Successfully"
					+ data);
			//window.location = "http://localhost:8082/lakshdeep/signinpage";

		},
		error : function(data) {

			// Some error in ajax call
			alert("some Error");
		}

	});
	}
</script>
</html>