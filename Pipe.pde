class Pipe {
  
  int x;
  int y;
  int empty;
  int vel;
  int w;
  
  Pipe() {
    this.x = width;
    this.empty = EMPTY_HEIGHT;
    this.y = int(random(CLOSEST_PIPE_TO_SCREEN,height-this.empty-CLOSEST_PIPE_TO_SCREEN));
    this.vel = PIPE_VELOCITY;
    this.w = PIPE_WIDTH;
  }
  
  void show() {
    fill(0,200,0);
    stroke(0,120,0);
    strokeWeight(8);
    rect(this.x, 0, this.w, this.y);                                    //felso pipe
    rect(this.x, this.y+this.empty, this.w, height-this.y-this.empty);  //also pipe
    this.x -= this.vel;
    strokeWeight(1);
  }
  
}
