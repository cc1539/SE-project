
class Part {
  
  constructor(x,y,vx,vy,radius) {
    this.x = x;
    this.y = y;
    this.px = x-vx;
    this.py = y-vy;
    this.radius = radius;
  }
  
  move() {
    this.x += -this.px+(this.px=this.x);
    this.y += -this.py+(this.py=this.y);
  }
  
  draw() {
    var diameter = this.radius*2;
    noStroke();
    fill(0);
    ellipse(this.x,this.y,diameter,diameter);
  }
  
  interact(part) {
    var dx = this.x - part.x;
    var dy = this.y - part.y;
    if(dx!=0 || dy!=0) {
      var dst2 = dx*dx+dy*dy;
      var rads = this.radius+part.radius;
      if(dst2<rads*rads) {
        var force = (1-rads/sqrt(dst2)) * .5;
        dx *= force;
        dy *= force;
        part.x += dx;
        part.y += dy;
        this.x -= dx;
        this.y -= dy;
      }
    }
  }
  
}

var parts = [];
var mic;
var bgm;

function preload() {
  bgm = loadSound('assets/ontheDANK.mp3');
}

function setup() {
  createCanvas(window.innerWidth,window.innerHeight);
  bgm.play();
}

function keyPressed() {
  getAudioContext().resume();
  switch(key) {
    case 'n': {
      // add a part
      parts.push(new Part(
        mouseX,
        mouseY,
        mouseX-pmouseX,
        mouseY-pmouseY,
        20));
    } break;
    case 'c': {
      // remove all parts
      parts.length = 0;
    } break;
  }
}

function mousePressed() {
  getAudioContext().resume();
  parts.push(new Part(
    mouseX,
    mouseY,
    mouseX-pmouseX,
    mouseY-pmouseY,
    20));
}

function draw() {
  
  clear();
  
  // apply collisions between all particles
  for(var t=0;t<10;t++) {
    for(var i=0;i<parts.length;i++) {
    for(var j=i+1;j<parts.length;j++) {
      parts[i].interact(parts[j]);
    }
    }
  }
  
  // draw all particles
  for(var i=0;i<parts.length;i++) {
    parts[i].draw();
  }
  
  // allow all particles to move using verlet integration
  for(var i=0;i<parts.length;i++) {
    
    parts[i].py -= .1; // apply a little gravity
    
    parts[i].move();
    
    // confine parts to the canvas
    var radius = parts[i].radius;
    parts[i].x = min(max(parts[i].x,radius),width-radius);
    parts[i].y = min(max(parts[i].y,radius),height-radius);
    
  }
  
}

function windowResized() {
  resizeCanvas(window.innerWidth,window.innerHeight);
}
