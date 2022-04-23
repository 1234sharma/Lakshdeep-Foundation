<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="common/navbar.jsp" %>

<div class="container mt-5 ">
<p>When it comes to paying for college, scholarships are the best form of financial aid, since they offer students free money that never needs to be repaid. But let’s face it: completing scholarship applications, especially the essays, can feel overwhelming. The scholarship essay is arguably the most important part of the application and should be well-thought-out. In this article, we’ll walk  through five scholarship essay examples and explain why they worked, so that you can write your own winning scholarship essays.

<div>
<h5>If you are looking for an scholarship then You will need to give  one assesment. Based on marks scored we will proceed with your scholarship</h5>
</div>

<div class="container text-center mb-5">
<button class="btn btn-dark" onclick="checkattempt('${uname}')" >Start Test</button>
</div>
</div>

<%@include file="common/commonBottomNavBar.jsp" %>
<script >

function checkattempt(uname)
{
	$.ajax({
		type : "POST",
		url : "/lakshdeep/checkattempt",
		data : {username:uname}, // serializes the form's elements
		success : function(data) {

			// Ajax call completed successfully
        alert("Your assesment will start Now")
	window.location = "http://localhost:8082/lakshdeep/startassesment";
			//alert(data);

		},
		error : function(data) {
				
			alert("You already have attended the Test ")
			// Some error in ajax call
			alert(JSON.stringify(data.responseText));
		}

	});

}

</script>
</body>
</html>