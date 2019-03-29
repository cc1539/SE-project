
class Garage {
	
	constructor(layer_count,w,h) {
		this.layers = [];
		for(var i=0;i<layer_count;i++) {
			this.layers[i] = new GarageLayer(100,3,10,i);
		}
		this.viewlayer = 0;
		this.w = w;
		this.h = h;
		
		// put in some disabled parking spots
		var groundfloor = this.layers[0];
		for(var i=0;i<3;i++) {
			groundfloor.spaces[i].setDisabled(true);
		}
		
		this.parked_ids = {};
		this.updateLive();
	}
	
	updateLive() {
		
		var target = this;
		
		$.ajax({
			url: "php/traffic.php",
			data: "sessionid="+getCookie("inspark2019"),
			success: function(response) {
				
				response = response.substring(response.lastIndexOf("\n")+1);
				response = JSON.parse(response);
				
				var new_parked_ids = {};
				
				for(var i=0;i<response.length-1;i++) {
					var spot_num = parseFloat(response[i].spot);
					if(!target.parked_ids[spot_num]) {
						target.parked_ids[spot_num] = spot_num;
						
						var account = new Account();
						account.loadFromID(response[i].id);
						var spot_layer = Math.floor(spot_num/40);
						var spot_space = spot_num%40;
						target.layers[spot_layer].spaces[spot_space].setAccount(account);
						target.layers[spot_layer].spaces[spot_space].setState("occupied");
					}
					new_parked_ids[spot_num] = true;
				}
				
				for(var id in target.parked_ids) {
					if(!new_parked_ids[id]) {
						var spot_layer = Math.floor(id/40);
						var spot_space = id%40;
						target.layers[spot_layer].spaces[spot_space].setAccount(null);
						target.layers[spot_layer].spaces[spot_space].setState("empty");
						
						target.parked_ids[id] = null;
					}
				}
				
			}
		});
		
	}
	
	randomize() {
		for(var i=0;i<this.layers.length;i++) {
			this.layers[i].randomChange();
		}
	}
	
	showLayer(index) {
		this.viewlayer = min(max(index,0),this.layers.length-1);
	}
	
	draw() {
		var space_length = 70;
		
		var spacing = 30;
		var preview_height = 50;
		
		var x = width-spacing-this.w;//(width-this.w)/2;
		var y = (height-this.h)/2;
		stroke(100);
		fill(128);
		rect(x,y,this.w,this.h);
		this.layers[this.viewlayer].draw(x,y,this.w,this.h,space_length);
		
		noStroke();
		fill(200);
		textAlign(CENTER,CENTER);
		textSize(48);
		text(this.viewlayer+1,x+50,y+this.h/2);
		
		//var preview_x = x+this.w+spacing;
		var preview_x = spacing;
		for(var i=0;i<this.layers.length;i++) {
			var j = this.layers.length-1-i;
			var mousehover = this.layers[i].drawPreview(
				preview_x,
				spacing+j/(this.layers.length-1)*(height-spacing*2-preview_height),
				width-spacing*3-this.w,
				preview_height,
				this.viewlayer==i,
				i+1);
			if(mousehover && mousePressing()) {
				this.viewlayer = i;
			}
		}
		
		this.layers[this.viewlayer].showFocusInformation();
		
	}
	
}