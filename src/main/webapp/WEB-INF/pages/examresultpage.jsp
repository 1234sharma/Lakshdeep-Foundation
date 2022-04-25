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
	<div class="container mt-5">
		<table table table-striped table-bordered table-hover id="myTable"
			border="1">
			<thead>
				<tr>
					<th>UserName</th>
					<th>Marks</th>
					<th>OutOf</th>
					<th>Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<%@include file="common/commonBottomNavBar.jsp"%>

	<script>
	var table;
		$(document).ready(function() {
			table=$('#myTable').DataTable();

			tabledataload();

		});

		function tabledataload() {
			$.ajax({
				url : "/lakshdeep/examresultlist",
				type : 'GET',
				success : function(data) {
					console.log(data);
					for (let i = 0; i < data.length; i++) {
						$('#myTable').DataTable().row.add(
								[
										data[i].username,
										data[i].marks,
										data[i].outof,
										data[i].date,
									
										'<button  class="btn btn-danger" onclick="deleteuser(`'
												+ data[i].username
												+ '`)">DELETE</button>' ])
								.draw();

					}

				},
				error : function() {
					console.log('error');
				}
			});
		}

		function deleteuser(val) {
			alert("calling delete for username " + val);

			$.ajax({
				url : "/lakshdeep/deleteresult/" + val,
				type : 'DELETE',
				success : function(data) {
					alert(data.status)
					table.clear().draw();
						tabledataload();
					

				},
				error : function() {
					console.log('error');
				}
			});

		}
	</script>

</body>
</html>