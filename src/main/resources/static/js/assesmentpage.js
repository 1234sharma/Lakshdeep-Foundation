
var pos = 0, test, test_status, questions,  choice, choices, chA, chB, chC, correct = 0; 

	function _(x){
		return document.getElementById(x);
	}
	
	function renderQuestionwithajaxcall()
	{		
		alert("test");
		
		$.ajax({
				url : "/lakshdeep/questionlist",
				type : 'GET',
				success : function(data) {
					console.log(data);
					questions=data;
					renderQuestion();
				},
				error : function() {
					console.log('error');
				}
			});

		
		
		
		
		
	/*	questions=[
		["Who created python flask?", "Armin Ronacher", "Jude Suares", "Adrian Mercurio", "A" ],
		["Who created javascript?", "Brendan Eich", "Kimmy Matillano", "Saxon Ong", "A"],
		["Who created java?", "James Gosling", "Princely Ceasar", "July King Kadayuna", "A"],
		["Who created c# language?", "Microsoft Corporation", "Google Company", "You Tube Corporation", "A"],
		["Who created php?", "Rasmus Lerdorf", "Grace Patulada", "Nikko Curaza", "A"],
		["Who created itsourcecode.com?", "Charlotte Villanueva", "Joken Villanueva", "Niko Embang", "B"],
		["Who created laravel?", "Boknoi Villaflor", "Taylor Otwell", "Ryan Manaay", "B"],
		["Who created database?", "Edgar Frank Codd", "Paul Niar", "Given Bariacto", "A"],
		["Who created c++ language?", "Kirk Eriman", "Bjarne Stroustrup", "Jomhel Dulla", "B"],	
		["Who created c language?", "Dennis Ritchie", "Daniel Bandiola", "Carlan Pellobello", "A"]
	];*/

	}
	
	function renderQuestion(){
		console.log(questions[0].question)
		test = _("test");
		if(pos >= questions.length){
			/*test.innerHTML = "<h3>You got "+correct+" of "+questions.length+" questions correct</h3>";
			_("test_status").innerHTML = "Exam Completed";
			pos = 0;
			correct =0;*/
			var str={
				  marks:correct,
				  outof:questions.length
			}
			$.ajax({
				type : "POST",
				url : "/lakshdeep/submitscore",
				data : JSON.stringify(str), // serializes the form's elements
				contentType : "application/json",
				success : function(data) {
                alert("Your score has been submitted Succesfully ");
					// Ajax call completed successfully
                	window.location = "http://localhost:8082/lakshdeep/scholarshippage";
					//alert(data);
				},
				error : function(data) {

					// Some error in ajax call
					alert(JSON.stringify(data.responseText));
				}
			});
			return false;
		}
		_("test_status").innerHTML = "Question "+(pos+1)+" of "+questions.length;
		question = questions[pos].question;
		chA = questions[pos].option1;
		chB = questions[pos].option2;
		chC = questions[pos].option3;
		chD=  questions[pos].option4;
		
		test.innerHTML = "<h3>"+question+"</h3>";
		test.innerHTML += "<input type='radio' name='choices' value='A'> "+chA+"<br>";
		test.innerHTML += "<input type='radio' name='choices' value='B'> "+chB+"<br>";
		test.innerHTML += "<input type='radio' name='choices' value='C'> "+chC+"<br>";
		test.innerHTML += "<input type='radio' name='choices' value='D'> "+chD+"<br><br>";

		test.innerHTML += "<button onclick='checkAnswer()'>Submit Answer</button>";	
	}
	function checkAnswer(){
		choices = document.getElementsByName("choices");
        var flag=0;
		for(var i=0; i<choices.length; i++){
			if(choices[i].checked){
				
				choice = choices[i].value;
				console.log(choice)
                flag=1;
			}
		}
		console.log(choice +" "+flag)
        if(flag==0)
		{
			alert("Please choose atleast one option");
			return false;
		}
		if (choice == questions[pos].answer){
			correct++;
		}
		pos++;
		renderQuestion();
	}
	window.addEventListener("load", renderQuestionwithajaxcall, false);
	