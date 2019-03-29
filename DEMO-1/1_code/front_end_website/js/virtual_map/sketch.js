
var garage;
var font;

var pmousePressed;

function mousePressing() {
	return mouseIsPressed && !pmousePressed;
}

function preload() {
	font = loadFont("assets/fonts/industry/Industry Bold.ttf");
}

function setup() {
	
	createCanvas(700,480);
	
	$("#virtual-map > :not(:first-child)").remove();
	$("#virtual-map").append($("#defaultCanvas0"));
	$("#defaultCanvas0").hide().slideDown(500);
	
	textFont(font);
	garage = new Garage(7,480,420);
	
	setInterval(function(){
		garage.updateLive();
	},2000);
	
}

function draw() {
	background(200);
	garage.draw();
	pmousePressed = mouseIsPressed;
	
	garage.randomize();
	
}

$.getScript("https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/p5.min.js");