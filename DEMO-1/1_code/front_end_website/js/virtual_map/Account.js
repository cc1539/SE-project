
class Account {
	
	constructor(lp,eaddr,haddr,fname,lname,cmake,cmod,ccnum,pt,vis) {
		this.lp = lp;			// license plate
		this.eaddr = eaddr;		// e-mail address
		this.haddr = haddr;		// actual address
		this.fname = fname;		// user's first name
		this.lname = lname;		// user's last name
		this.cmake = cmake;		// car's make
		this.cmod = cmod;		// car's model
		this.ccnum = ccnum;		// credit card number
		this.pt = pt;			// payment type/method
		this.visible = vis;
	}
	
	loadFromID(id) {
		this.visible = true;
		var target = this;
		$.ajax({
			url: "php/database.php",
			data: {
				sessionid: getCookie("inspark2019"),
				accountid: id+""
			},
			method: "GET",
			success: function(response) {
				
				response = response.substring(response.lastIndexOf("\n")+1);
				response = JSON.parse(response);
				
				//console.log(response);
				for(key in response) {
					target[key] = response[key];
				}
				
				if(response.uname.toLowerCase()==userinfo.uname) {
					target.belongsToUser = true;
				}
				
				target.real = true;
			}
		});
	}
	
	rndint(min,max) {
		return floor(random(min,max+1));
	}
	
	rndstr(len) {
		var palette = "abcdefghijklmnopqrstuvwxyz0123456789";
		var str = "";
		for(var i=0;i<len;i++) {
			str += palette[this.rndint(0,palette.length-1)];
		}
		return str;
	}
	
	random() {
		this.lp = this.rndstr(6);
		this.eaddr = this.rndstr(this.rndint(4,8))+"@gmail.com";
		this.haddr = "420 "+this.rndstr(8)+" st";
		this.fname = "kevin";
		this.lname = "bacon";
		this.cmake = "kevin";
		this.cmod = "bacon";
		this.ccnum = this.rndstr(3)+"-"+this.rndstr(3)+"-"+this.rndstr(3)+"-"+this.rndstr(3)+"-"+this.rndstr(3);
		this.pt = "spendbuddy";
		this.visible = random(0,10)<=7;
	}
	
	setLicensePlate		(value) { this.lp		=value; }
	setEmailAddress		(value) { this.eaddr	=value; }
	setAddress			(value) { this.haddr	=value; }
	setFirstName		(value) { this.fname	=value; }
	setLastName			(value) { this.lname	=value; }
	setCarMake			(value) { this.cmake	=value; }
	setCarModel			(value) { this.cmod		=value; }
	setCreditCardNumber	(value) { this.ccnum	=value; }
	setPaymentType		(value) { this.pt		=value; }
	
	getLicensePlate		() { return this.lp; }
	getEmailAddress		() { return this.eaddr; }
	getAddress			() { return this.haddr; }
	getFirstName		() { return this.fname; }
	getLastName			() { return this.lname; }
	getCarMake			() { return this.cmake; }
	getCarModel			() { return this.cmod; }
	getCreditCardNumber	() { return this.ccnum; }
	getPaymentType		() { return this.pt; }
	getVisible			() { return this.visible; }
	
}
