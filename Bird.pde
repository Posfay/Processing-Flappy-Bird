class Bird {
  
  int x;
  float y;
  float vel;
  int lift;
  float grav;  //szorzo (1 = normalis)
  
  PImage upB, downB;
  
  
  Bird() {
    this.x = KEZD_X;
    this.y = kezdY;
    this.vel = 0;
    this.grav = GRAVITY;
    this.lift = BIRD_LIFT_ACCELERATION;
    
    this.upB = loadImage("upBird.png");
    this.upB.resize(46,26);
    this.downB = loadImage("downBird.png");
    this.downB.resize(46,26);
  }
  
  void show() {
    //bird
    if (this.vel < 0) {
      image(upB,this.x,this.y);
    } else if (this.vel > 0) {
      image(downB,this.x,this.y);
    }
    this.y += this.vel;
    this.vel += GRAVITY;
  }
  
}
