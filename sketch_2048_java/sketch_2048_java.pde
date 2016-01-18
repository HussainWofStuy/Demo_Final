direction d = new direction();
drawing dw = new drawing();
int[][] b= new int[4][4];
int[][][] prevb = new int[4][4][3];
int score = 0;
boolean dead = false;
PFont font;

void setup(){
  size(525, 600);
  restart();
  font = loadFont("try1.vlw");
  textFont(font);
  //b[0][0] = 11;
  //b[0][1] = 6;
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
   if(dead){dw.doDeadThings();}
}

void keyPressed(){
  if(gameover()){dead = true;}
  if(!dead){
 int kC = keyCode;
 int x = 0, y = 0;
 if(kC == UP){x = 0; y = 1;}
 if(kC == DOWN){x = 0; y = -1;}
 if(kC == LEFT){x = -1; y = 0;}
 if(kC == RIGHT){x = 1; y = 0;}
 if(d.canMove(b,kC)){
 int[][] newb = move(x,y);
 b = newb; dw.create(b);
 } }
  
}

boolean gameover(){
  boolean gO = true;
  int[] h = {RIGHT, LEFT, UP, DOWN};
  for(int k = 0; k < h.length; k++){if(d.canMove(b,h[k])){gO=false;}}
  return gO;
}


int[][] move(int x, int y){
  int[][] newb = d.copy(b);
  if(x==1){d.right(newb, prevb);}
  if(x==-1){d.left(newb, prevb);}
  if(y==1){d.up(newb, prevb);}  
  if(y==-1){d.down(newb, prevb);}
  return newb;
}