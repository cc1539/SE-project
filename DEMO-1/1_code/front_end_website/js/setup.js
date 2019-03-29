
// get URL parameters as an array
function getParams(str) {
	if(str==null) {
		str = location.search;
	}
	var params={};
	str.replace(/[?&]+([^=&]+)=([^&]*)/gi,function(s,k,v){params[k]=v});
	return params;
}

function trimResponse(response) {
	return response.substring(response.lastIndexOf("\n")+1);
}

// is the user logged in?
var logged_in = false;
var pass_hash = null;

function encrypt(data) {
	var result = "";
	for(var i=0;i<data.length;i++) {
		var letter = (data.charCodeAt(i)^pass_hash.charCodeAt(i%pass_hash.length)).toString(16);
		if(letter.length==1) {
			letter = "0"+letter;
		}
		result += letter;
	}
	return result;
}

function decrypt(data) {
	var result = "";
	for(var i=0;i<data.length;i+=2) {
		//console.log(parseInt(data.substring(i,i+2),16));
		result += String.fromCharCode(parseInt(data.substring(i,i+2),16)^pass_hash.charCodeAt(i%pass_hash.length));
	}
	return result;
}

function realencrypt(data) {
	return encrypt(decrypt(encrypt(data)));
}

function login(session_id,username,password) {
	
	function loadAccountUI(session_id) {
		
		if(password!=null) {
			pass_hash = Sha256.hash(password);
			setCookie("inspark2019_passhash",pass_hash);
		} else {
			pass_hash = getCookie("inspark2019_passhash");
		}
		
		console.log("Password hash: "+pass_hash);
		
		// for now, only logout; later there will be more features(?)
		$('#header > [name="login"]').text("Logout");
		
		logged_in = true;
		if(session_id!=null) {
			setCookie("inspark2019",session_id);
		}
		$.getScript("js/account.js");
		$("#login-div").fadeOut(200,function(){
			$(this).remove();
		});
		
	}
	
	if(session_id==null) {
		$.ajax({
			url: "php/session.php",
			data: "username="+username,
			success: function(response) {
				response = trimResponse(response);
				loadAccountUI(response);
			}
		});
	} else {
		loadAccountUI(session_id);
	}
	
}

function logout() {
	
	//$('#header > [name="login"]').text("My Account");
	
	logged_in = false;
	
	$.ajax({
		url: "php/session.php",
		data: "sessionid="+getCookie("inspark2019"),
		method: "POST"
	});
	
	setCookie("inspark2019","");
	
	location.reload();
}

var form_response = {};

form_response['php/signin.php'] = function(response,target) {
	
	response = trimResponse(response).split(" ");
	
	switch(response[0]) {
		case "account_found": {
			login(null,
				$("#signin input[name='username']").val(),
				$("#signin input[name='password']").val());
		} break;
		case "account_not_found": {
			$("#signin > .status")
				.text("Invalid credentials.")
				.css("color","red")
				.hide()
				.slideDown(500);
		} break;
	}
	
}

form_response['php/signup.php'] = function(response,target) {
	
	response = trimResponse(response);
	
	//console.log(response);
	
	switch(response) {
		case "account_created": {
			login(null,
				$("#signup input[name='username']").val(),
				$("#signup input[name='password']").val());
		} break;
		case "account_already_exists": {
			$("#signup > .status")
				.text("Username taken.")
				.css("color","red")
				.hide()
				.slideDown(500);
		} break;
	}
	
}

form_response['php/search.php'] = function(response,target) {
	//console.log(response);
	
}

function buildLoginForm(response) {
	
	let login_form = $.parseHTML(response);
	
	// make it transition into view
	$("body").append(login_form);
	$(login_form).hide();
	$(login_form).fadeIn(200);
	
	// if we click away from the form, make it transition away
	$(".overlay").click(function(e){
		if(e.target==this) {
			let deletion_target = this;
			$(login_form).fadeOut(200,function(){
				$(deletion_target).parent().remove();
			});
		}
	});
	
	handleFormSubmission();
}

function handleFormSubmission() {
	
	$("form").submit(function(e){
		
		var response_name = $(this).attr('action');
		e.preventDefault();
		var submitted_form = this;
		
		var ajaxData = getParams("data/?"+$(this).serialize());
		for(key in ajaxData) {
			ajaxData[key] = decodeURIComponent(ajaxData[key]);
		}
		
		if(getCookie("inspark2019")!="") {
			ajaxData.sessionid = getCookie("inspark2019");
			ajaxData.username = userinfo.uname;
		}
		
		if(ajaxData.ccnum) {
			ajaxData.ccnum = realencrypt(ajaxData.ccnum);
		}
		
		if(ajaxData.password) {
			pass_hash = Sha256.hash(ajaxData.password);
			ajaxData.password = realencrypt(realencrypt(ajaxData.password));
		}
		if(ajaxData.repeat_password && pass_hash) {
			ajaxData.repeat_password = realencrypt(realencrypt(ajaxData.repeat_password));
		}
		
		$.ajax({
			url: response_name,
			data: ajaxData,
			type: "POST",
			success: function(response) {
				form_response[response_name](response,submitted_form);
			}
		});
		
	});
	
}

function loadPage() {
	
	if(getCookie("inspark2019")!="") {
		login(getCookie("inspark2019"));
	}
	
	$('#header > [name="login"]').click(function(){
		if(logged_in) {
			logout();
		} else {
			$.ajax({url:"htm/login.htm",success:buildLoginForm});
		}
	});
	
	handleFormSubmission();
	
	$('#header > :not([name="login"])').click(function(){
		var name = $(this).attr("name");
		var offset = $("#"+name).offset();
		//console.log(offset);
		$("html,body").animate({
			scrollTop: offset.top,
			scrollLeft: offset.left
		});
	});
	
	{
		var show_return = false;
		$(window).scroll(function(){
			if(show_return!=(show_return=window.scrollY>0)) {
				if(show_return) {
					$("#return-to-top").animate({bottom:"20px"});
				} else {
					$("#return-to-top").animate({bottom:"-70px"});
				}
			}
		});
		$("#return-to-top").click(function(){
			$("html,body").animate({scrollTop:0});
			//console.log("hey");
		});
	}
	
	$("body > div:last-of-type").hide();
	
	var params = getParams();
	if(params['lpnum']) {
		
		if(getCookie("inspark2019")!="") {
			$.ajax({
				url: "php/saveinfo.php",
				data: "username="+getCookie("inspark2019"),
				success: function(response) {
					
					response = trimResponse(response);
					response = JSON.parse(response);
					
					if(response.lpnum!=params['lpnum']) {
						logout();
					}
					
				}
			});
		} else {
		
			$.ajax({url:"htm/login.htm",success:buildLoginForm});
		
		}
	}
	
}

$(function(){
	$.getScript("js/sha256.js",loadPage);
});

