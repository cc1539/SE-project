
class GarageLayer {
	
	constructor(lot_begin_x,rows,cols,index) {
		
		this.floor = index;
		this.lbx = lot_begin_x;
		this.rows = rows;
		this.cols = cols;
		this.spaces = [];
		
		for(var i=0,l=this.spaceCount();i<l;i++) {
			this.spaces[i] = new CarSpace();
			
			if(random(0,10)<1) {
				
				var account = new Account();
				account.random();
				this.spaces[i].setAccount(account);
				if(random(0,10)>9) {
					this.spaces[i].setState("reserved");
				} else {
					this.spaces[i].setState("occupied");
				}
				
			} else {
				this.spaces[i].setState("empty");
			}
			
			this.spaces[i].index = i;
		}
		
	}
	
	randomChange(i) {
		
		if(i==null) {
			
			for(var j=0;j<this.spaces.length;j++) {
				this.randomChange(j);
			}
			
		} else {
			
			if(this.spaces[i].getAccount() && this.spaces[i].getAccount().real) {
				return;
			}
			
			if(random(0,10000)<1) {
				
				switch(this.spaces[i].getState()) {
					case "empty": {
					
						var account = new Account();
						account.random();
						this.spaces[i].setAccount(account);
						if(random(0,10)>9) {
							this.spaces[i].setState("reserved");
						} else {
							this.spaces[i].setState("occupied");
						}
						
					} break;
					case "reserved": {
						
						if(random(0,10)>9) {
							this.spaces[i].setState("empty");
							this.spaces[i].setAccount(null);
						} else {
							this.spaces[i].setState("occupied");
						}
						
					} break;
					case "occupied": {
						
						this.spaces[i].setAccount(null);
						this.spaces[i].setState("empty");
						
					} break;
				}
			
			}
			
		}
		
	}
	
	drawHalf(i,j,col_x,min_y,max_y,w,md,car_x,offset) {
		
		var shade = color(0,255,0);
		
		var space = this.spaces[(i*2-offset)*this.cols+j];
		var blue = space.getAccount()!=null && space.getAccount().belongsToUser?255:0;
		if(space.getState()=="occupied") { shade = color(255-blue,0,blue); }
		if(space.getState()=="reserved") { shade = color(255-blue,255,blue); }
		
		if(	mouseX>col_x && mouseX<col_x+w/this.cols &&
			mouseY>min_y && mouseY<max_y) {
			shade = lerpColor(shade,color(255),0.5);
			if(space) {
				this.focus = space;
			}
		}
		
		fill(shade);
		ellipse(car_x,(min_y+max_y)/2,md,md);
		
	}
	
	draw(x,y,w,h,sl) {
		
		this.focus = null;
		
		// offset by lbx
		x += this.lbx;
		w -= this.lbx;
		
		// add border
		{
			var border = 10;
			x += border;
			y += border;
			w -= border*2;
			h -= border*2;
		}
		
		strokeWeight(5);
		stroke(255);
		
		var car_length = sl; // space length
		
		for(var i=0;i<this.rows;i++) {
			var l = this.rows-1;
			var row_y = y+h*(i/l);
			line(x,row_y,x+w,row_y);
			var min_y = row_y;
			var max_y = row_y;
			if(i>0) { min_y -= car_length; }
			if(i<l) { max_y += car_length; }
			for(var j=0;j<this.cols;j++) {
				
				var col_x = x+w*(j/this.cols);
				var car_x = x+w*((j+0.5)/this.cols);
				
				line(col_x,min_y,col_x,max_y);
				
				if(j==this.cols-1) {
					line(x+w,min_y,x+w,max_y);
				}
				
				noStroke();
				var mark_diam = 20;
				
				if(i<l) { this.drawHalf(i,j,col_x,row_y,max_y,w,mark_diam,car_x,0); }
				if(i>0) { this.drawHalf(i,j,col_x,min_y,row_y,w,mark_diam,car_x,1); }
				stroke(255);
			}
		}
		
	}
	
	drawPreview(x,y,w,h,selected,floornum) {
		
		var userOnLayer = false;
		var mousehover = mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h;
		
		if(selected) {
			stroke(255);
			strokeWeight(2);
		} else {
			stroke(100);
			strokeWeight(2);
		}
		fill(150);
		rect(x,y,w,h);
		
		{
			var border = 4;
			x += border;
			y += border;
			w -= border*2;
			h -= border*2;
		}
		
		noStroke();
		
		var l = this.spaceCount();
		
		var gw = this.cols;
		var gh = floor(l/gw);
		
		var tile_w = w/gw;
		var tile_h = h/gh;
		
		var index = 0;
		for(var j=0;j<gh;j++) {
		for(var i=0;i<gw;i++) {
			var state = this.spaces[index].getState();
			if(this.spaces[index].getAccount() && this.spaces[index].getAccount().belongsToUser) {
			    userOnLayer = true;
			}
			{
				if(state=="empty")    { fill(0,255,0,60); }
				if(state=="occupied") { fill(255,0,0,60); }
				if(state=="reserved") { fill(255,255,0,60); }
				rect(x+i*tile_w,y+j*tile_h,tile_w,tile_h);
			}
			index++;
		}
		}
		
		textAlign(CENTER,CENTER);
		textSize(36);
		noStroke();
		fill(255,200);
		text(floornum,x+w/2,y+15);
		
		if(userOnLayer) {
		    
			stroke(0,0,200);
			strokeWeight(2);
    		noFill();
    		rect(x,y,w,h);
    		
		}
		
		return mousehover;
	}
	
	showFocusInformation() {
		
		if(this.focus) {
			
			var getter_name = [
				"License Plate",
				"E-mail Address",
				"Home Address",
				"First Name",
				"Last Name",
				"Car Make",
				"Car Model",
				//"Credit Card Number",
				"Payment Type"
			];
			
			var getters = [
				"getLicensePlate",
				"getEmailAddress",
				"getAddress",
				"getFirstName",
				"getLastName",
				"getCarMake",
				"getCarModel",
				//"getCreditCardNumber",
				"getPaymentType"];
				
			var w = 360;
			var h = 16*(getters.length+1)+20;
			var x = mouseX;
			var y = mouseY;
			
			var info = [];
			
			var state = this.focus.getState();
			if(state=="occupied") { info[0] = "This spot is occupied."; }
			if(state=="reserved") { info[0] = "This spot is reserved."; }
			if(state=="empty") { info[0] = "This spot is open. Click to reserve."; }
			if(state!="empty") {
				if(this.focus.getAccount().getVisible()) {
					for(var i=0,j=1;i<getters.length;i++) {
						var detail = this.focus.getAccount()[getters[i]]();
						if(!(detail==null || detail=="")) {
							info[j++] = getter_name[i]+": "+detail;
						}
					}
				} else {
					info[1] = "This user is anonymous.";
				}
			}
			if(this.focus.getAccount() && this.focus.getAccount().belongsToUser) {
				info[0] = "This spot is occupied and belongs to you.";
			}
			
			fill(0,200);
			noStroke();
			if(x+w>width) { x -= w; }
			if(y+h>height) { y -= h; }
			rect(x,y,w,h);
			
			textSize(16);
			fill(255);
			noStroke();
			textAlign(LEFT,TOP);
			for(var i=0;i<info.length;i++) {
				text(info[i],x+8,y+8+16*i);
			}
			
			if(state=="empty" && mousePressing()) {
				
				var spot_id = (this.focus.index+this.floor*this.spaces.length);
				var spot_num = this.focus.index+1;
				var floor_num = this.floor+1;
				
				function updateReservationFormValues() {
					$("#reservation-zone > .info").text("You have chosen to reserve spot #"+spot_num+" on floor #"+floor_num+" at Hypothetical Parking Lot 2B (spot #"+(spot_id+1)+" overall)").show();
					$("#reservation-zone [name='reservation_spot']").val(spot_id);
				}
				
				if($("#reservation-zone")[0]!=null) {
					
					updateReservationFormValues();
					
				} else {
					
					$.ajax({
						url: "htm/reserve.htm",
						success: function(response) {
							
							$("#user-features").append(response);
							
							$("#reservation-zone > .status").text("").show();
							$("#reservation-zone input[type='submit']").show();
							
							$("#reservation-zone").hide().slideDown(500);
							var reserve_top = $("#reservation-zone").offset().top;
							$("html,body").animate({
								scrollTop:reserve_top-window.displayHeight/2+250
							});
							
							updateReservationFormValues();
							handleFormSubmission();
						}
					});
					
				}
				
			}
			
		}
	}
	
	spaceCount() {
		return 2*this.cols+(this.rows-2)*this.cols*2;
	}
	
}
