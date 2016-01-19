direction d = new direction();
drawing dw = new drawing();
int[][] b= new int[4][4];
int[][][] prevb = new int[4][4][3];
int score = 0;
int scoreAdd = 0;
boolean dead = false;
PFont font;
int time = 0;
boolean moving = false;
boolean winState = false;
boolean cont = false;

void setup(){
  size(525, 700);
  restart();
  font = loadFont("try1.vlw");
  textFont(font);
  //b[0][0] = 10;
  //b[0][1] = 10;
  //b[0][2] = 5;
  //b[0][3] = 5;
}
void restart(){
    b = new int[4][4];
    score = 0;
    noStroke();
    dw.create(b);
    dead = false;
}

void draw(){
   dw.grid(b);
   dw.dt(""+2048, 10, 30, 200, 200, color(118,95,71), 70, CENTER);
   dw.dt("HOW TO PLAY: Use you arrow keys to move the tiles. When two tiles of the same number touch, they merge into one!", 10, 700-90, 505,80, color(118,95,71), 20, CENTER);
   dw.r(300, 30, 75, 50, 5, color(118,95,71));
   dw.dt("SCORE", 307, 35, 60, 20, color(255), 10, CENTER);
   dw.dt(""+score, 307, 50, 60, 50, color(255), 25, CENTER);
   if(win() && !cont){winState = true; dw.doWinThings();}
   if(dead){dw.doDeadThings();}
}

void keyPressed(){
  if(gameover()){dead = true;}
  if(!dead && !winState){
 int kC = keyCode;
 int x = 0, y = 0;
 if(key == 'r' || key == 'R'){restart();}
 if(kC == UP){x = 0; y = 1;}
 if(kC == DOWN){x = 0; y = -1;}
 if(kC == LEFT){x = -1; y = 0;}
 if(kC == RIGHT){x = 1; y = 0;}
 if(d.canMove(b,kC)){moving = true;}
 while(d.canMove(b,kC)){
 int[][] newb = move(x,y);
 b = newb; 
 dw.board(b);}
 if(moving){dw.create(b);}
  moving = false;
  score += scoreAdd;
  scoreAdd = 0;
}}

boolean gameover(){
  boolean gO = true;
  int[] h = {RIGHT, LEFT, UP, DOWN};
  for(int k = 0; k < h.length; k++){if(d.canMove(b,h[k])){gO=false;}}
  return gO;
}

boolean win(){ 
  for(int k = 0; k < b.length; k++){
   for(int i = 0; i < b.length; i++){
     if(b[k][i] == 11){ return true;}
   }
  }
  return false;
}


int[][] move(int x, int y){
  int[][] newb = d.copy(b);
  if(x==1){d.right(newb);}
  if(x==-1){d.left(newb);}
  if(y==1){d.up(newb);}  
  if(y==-1){d.down(newb);}
  return newb;
}