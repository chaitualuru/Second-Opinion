	var obj_id = window.location.search.substring(1).split('=')[1];
	var RequestObject = Parse.Object.extend("RequestObject");
	var query = new Parse.Query(RequestObject);
	query.equalTo("objectId",obj_id);
	query.find({
	success: function(results) {
		console.log("yesy");
	    console.log(results);
	    $('#patient_name').html(results[0].get('patientName'));
	    $('#description').html(results[0].get('description'));
	    $('#timmings').html(results[0].get('start_time') + " hrs - " + results[0].get('end_time'));
	    $('#mobile_number').html(results[0].get('phone_number'));
	    $('#patient_uploaded_image').attr("src", results[0].get('image')['_url']);


	  },
	  error: function(error) {
	  	document.write("Page Not Found!!")
	  }
	});

	