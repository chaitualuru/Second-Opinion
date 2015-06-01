$(document).ready(function(){
	var x = ["","Allergist", "Anesthesiologist", "Cardiologist", "Dermatologist", "Gastroenterologist", "Neurologist", "Oncologist", "Nephrologist", "Obstetrician", "Gynecologist", "Ophthalmologist", "Pathologist", "Pediatrician", "Podiatrist", "Psychiatrist", "Urologist", "Radiation Oncologist", "Rhuematologist"];
	for (var i = 0; i < x.length; i++) {
		$('.categories').append("<option value=\""+x[i]+"\">"+x[i]+"</option>");
	};
});

$('.categories').change(function(){
	var str = $('.categories option:selected').text();
	var RequestObject = Parse.Object.extend("RequestObject");
	var query = new Parse.Query(RequestObject);
	query.equalTo("speciality",str);
	query.find({
	success: function(results) {
	    alert("Successfully retrieved");
	    for (var i = 0; i < results.length; i++) { 
	      var object = results[i];
		  console.log((object));
	      var k = i + 1
	      $('#details').append("<tr> <td>" + k + "</td> <td>" + object.get('patientName') + "</td> <td>" + object.get('start_time') +"-" + object.get('end_time') + "</td> <td>"+object.get('phone_number')+ "</td> <td><a href=\"./view_report.html?id="+ object['id'] +"\">View Report</a></td></tr>");
	    }
	  },
	  error: function(error) {
	    alert("Error: " + error.code + " " + error.message);
	  }
	});

});
