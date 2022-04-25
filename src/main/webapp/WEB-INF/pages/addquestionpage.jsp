<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



    <div class="container">
        <h2>Stacked form</h2>
        <form action="/addQuestion" style="border: 2px solid;">
            <div class="form-group">
                <label for="Question">Question:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter Question" name="Question">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter option" name="option2">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter option" name="option3">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter option" name="option4">
            </div>
            <div class="form-group">
                <label for="option1">Option:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter option" name="option5">
            </div>
            <div class="form-group">
                <label for="option1">Answer:</label>
                <input type="text" class="form-control" id="question" placeholder="Enter option" name="option6">
            </div>

    </div>
    <button type="submit" class="btn btn-primary" style="float:right">Submit</button>
    </form>
    </div>



</body>
</html>