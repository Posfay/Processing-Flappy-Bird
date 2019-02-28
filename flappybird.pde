int KEZD_X = 150;
int EMPTY_HEIGHT = 150;
int PIPE_WIDTH = 80;
int PIPE_VELOCITY = 5;
float GRAVITY = 0.95;
int BIRD_LIFT_ACCELERATION = -13;
float FRAME_PER_PIPE = 60;
int CLOSEST_PIPE_TO_SCREEN = 40;

/*

-------original flappy bird
int KEZD_X = 150;
int EMPTY_HEIGHT = 150;
int PIPE_WIDTH = 80;
int PIPE_VELOCITY = 5;
float GRAVITY = 0.95;
int BIRD_LIFT_ACCELERATION = -13;
float FRAME_PER_PIPE = 60;
int CLOSEST_PIPE_TO_SCREEN = 40;

*/

int count;
int kozepX;
int kezdY = 100;
ArrayList<Pipe> pipes;
int gamestate = 0;
int highScore = 0;
int score = 0;
Bird bird;

PImage birdImg;
PImage downBird;
PImage upBird;

void setup() {
  size(800,600);
  frameRate(60);
  kozepX = int(width/2-PIPE_WIDTH/2);
  bird = new Bird();
  pipes = new ArrayList();
  birdImg = loadImage("flappyBird.png");
  birdImg.resize(46,26);
}

void draw() { 
  //el-e meg
  isDead();
  
  if (gamestate == 1) {
    background(135,206,250);
    
    //birds
    bird.show();
    
    //pipeok
    if (frameCount % int(FRAME_PER_PIPE) == 0) {
      pipes.add(new Pipe());
    }
    
    
    for (int i = 0; i < pipes.size(); i++) {
      //pipe megjelenites
      pipes.get(i).show();
      
      //pont szamolas
      calcScore(pipes.get(i));
    }
    
  } else {
    background(135,206,250);
  }
  
  fill(0,0,200);
  textAlign(CENTER);
  textSize(35);
  text(""+score ,width/2, height-75);
  text(""+highScore, width-75, 75);
}

void isDead() {
  for (int i = 0; i < pipes.size(); i++) {
    if ((bird.x > pipes.get(i).x && bird.x < pipes.get(i).x+pipes.get(i).w) && (bird.y < pipes.get(i).y || bird.y > pipes.get(i).y+pipes.get(i).empty)) {
      gamestate = 0;
    } else if (bird.y < 0 || bird.y > height) {
      gamestate = 0;
    }
    if ((bird.x+birdImg.width > pipes.get(i).x && bird.x+birdImg.width < pipes.get(i).x+pipes.get(i).w) && (bird.y < pipes.get(i).y || bird.y > pipes.get(i).y+pipes.get(i).empty)) {
      gamestate = 0;
    }
    if ((bird.x+birdImg.width > pipes.get(i).x && bird.x+birdImg.width < pipes.get(i).x+pipes.get(i).w) && (bird.y+birdImg.height < pipes.get(i).y || bird.y+birdImg.height > pipes.get(i).y+pipes.get(i).empty)) {
      gamestate = 0;
    }
    if ((bird.x > pipes.get(i).x && bird.x < pipes.get(i).x+pipes.get(i).w) && (bird.y+birdImg.height < pipes.get(i).y || bird.y+birdImg.height > pipes.get(i).y+pipes.get(i).empty)) {
      gamestate = 0;
    }
  }
}

void restart() {
  gamestate = 1;
  score = 0;
  bird = new Bird();
  pipes.clear();
}

void calcScore(Pipe curr) {
  if (curr.x+curr.w+PIPE_VELOCITY+1 > KEZD_X && curr.x+curr.w < KEZD_X) {
      score++;
      if (score > highScore) {
        highScore = score;
      }
    }
}

void keyPressed() {
  if (key == 32) {
    bird.vel = bird.lift;
  } else if (key == 'b' || key == 'c' || key == 'v' || key == 'n' || key == 'm') {
    restart();
  }
}
