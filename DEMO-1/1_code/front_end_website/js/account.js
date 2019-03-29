
var userinfo = {};

form_response['php/reserve.php'] = function(response,target) {
	
	response = trimResponse(response);
	
	switch(response) {
		case "set_success": case "change_success": {
			$("#reservation-zone input[type='submit']").slideUp(500);
			var verb = (response=="set_success"?"submitt":"chang");
			$("#reservation-zone > .status")
				.text("Reservation "+verb+"ed successfully.")
				.show()
				.hide()
				.slideDown(500)
				.delay(2e3)
				.queue(function(){
					$("#reservation-zone").slideUp(500).queue(function(){
						$("#reservation-zone").remove();
					});
				});
			updateReservationInfo();
		} break;
		case "set_failure": {
			$("#reservation-zone > .status").text("Invalid input.").css("color","red").hide().slideDown(500);
		} break;
	}
	
}

form_response['php/saveinfo.php'] = function(response,target) {
	
	response = trimResponse(response);
	
	var message = "Unknown error.";
	
	switch(response) {
		case "invalid_license_plate": { message = "Invalid license plate."; } break;
		case "invalid_email_address": { message = "Invalid email address."; } break;
		case "post_failure": { message = "Unexpected error. Please try again."; } break;
		case "post_success": { message = "Saved successfully."; } break;
		default: console.log(response); break;
	}
	
	$("#account-info > .status")
		.text(message)
		.hide().slideDown(500)
		.delay(2e3)
		.slideUp(500);
}

function updateReservationInfo() {
	
	$.ajax({
		url: "php/reserve.php",
		data: {
			username: userinfo.uname,
			sessionid: getCookie("inspark2019")
		},
		success: function(response) {
			
			response = trimResponse(response);
			response = JSON.parse(response);
			
			if(response.begin=="") {
				$("#reservation-info > .status").text("You do not currently have any reservations. Click a spot on the virtual map above to reserve a spot!");
				
				$("#reservation-info > button").slideUp(500);
			} else {
				var location_info = response.lot.split("#");
				
				$("#reservation-info > .status").text("You have a reservation from "+response.begin
					+" to "+response.end
					+" at "+location_info[0].trim()
					+", spot #"+location_info[1].trim()+".");
				
				$("#reservation-info > button").slideDown(500);
			}
			
		}
	});
	
}

function clearReservation() {
	$.ajax({
		url: "php/reserve.php",
		data: {
			username: userinfo.uname,
			sessionid: getCookie("inspark2019")
		},
		method: "POST",
		success: updateReservationInfo
	});
}

function loadVirtualMap() {
	// load all scripts in order
	var scripts = ["Account","CarSpace","GarageLayer","Garage","sketch"];
	var syncload = null;
	syncload = function(index) {
		if(index<scripts.length) {
			$.getScript("js/virtual_map/"+scripts[index]+".js",function(){
				syncload(index+1);
			});
		}
	}
	syncload(0);
}

function setupAccountFeatures() {
	
	$("#user-features").empty().css("margin-top","30px");

	$.ajax({
		url: "htm/account.htm",
		success: function(response) {
			
			$("#user-features").append(response);
			
			loadVirtualMap();
			
			var account_info = $("#account-info > form[action='php/saveinfo.php']");
			
			$.ajax({
				url: "content/userprops.json",
				success: function(response) {
					
					for(key in response) {
						$("<input>").prependTo(account_info).attr({
							type: "text",
							name: key,
						});
						$(account_info).prepend(response[key].label);
					}
					
					$.ajax({
						url: "php/saveinfo.php",
						data: {
							username: userinfo.uname,
							sessionid: getCookie("inspark2019")
						},
						success: function(response) {
							
							response = trimResponse(response);
							response = JSON.parse(response);
							
							for(name in response) {
								var value = response[name];
								
								console.log(name,value);
								
								if(name=="ccnum") {
									value = decrypt(value);
								}
								
								$("#account-info input[name='"+name+"']").val(value);
							}
							
							var params = getParams();
							if(params && params['lpnum']) {
								$("#account-info input[name='lpnum']").val(params['lpnum']);
							}
							
						}
					});
					
				}
			});
			
			handleFormSubmission();
			
			$(".greeting").text("Welcome, "+userinfo.uname);
			
			updateReservationInfo();
		}
	});

}

$.ajax({
	url: "php/database.php",
	data: "sessionid="+getCookie("inspark2019"),
	success: function(response) {
		
		response = trimResponse(response);
		response = JSON.parse(response);
		
		userinfo = response;
		
		setupAccountFeatures();
		
	}
});
