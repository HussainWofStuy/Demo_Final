class drawing{
color[] c = {color(150),color(247,242,242),color(250,240,215),color(245,186,138),color(245,157,114),color(245,121,72),color(245,94,35),color(242,222,139),color(247,213,75),color(247,208,47),color(250,203,13),color(252,228,0)};
  

drawing(){}
  
  //helper
void r(float x, float y, float w, float h, float r, color c){
   fill(c);
   rect(x, y, w, h, r);
}

void dt(String t, float x, float y, float w, float h, color c, float s, int al){
   fill(c);
   textAlign(al);
   textSize(s);
   text(t, x, y, w, h);
}
  
  void blankTile(int[][] b, int k, int i){
       r(40+115*i,115+115*k,100,100,5,color(216,205,186));
  }
  
  void grid(int[][] b){
    background(250,249,237);
   r(25,100,475,480,10,color(193,181,162));
   for(int k = 0; k < b.length; k++){
     for(int e = 0; e < b[k].length; e++){
       blankTile(b, k, e);
       if(b[k][e] > 0){
        r(40+115*e,115+115*k,100,100,5,c[b[k][e]]);
        if(b[k][e] > 2){
        dt(""+(int)Math.pow(2, b[k][e]), 40+115*e, 150+115*k, 100, 100, 255, 40, CENTER);
        }if(b[k][e] < 3){
         dt(""+(int)Math.pow(2, b[k][e]), 40+115*e, 150+115*k, 100, 100, 0, 40, CENTER);
        }
        
       }
     }}
     
  }
  
  void doDeadThings(){
     fill(255,100);
     rect(0,0,width,height);
     fill(0);
     textAlign(CENTER);
     textSize(30);
     text("Gameover! Click to restart", 0, height/2,width,50);
     if(mousePressed){restart();}
  }
  
  void create(int[][] b){
   ArrayList<Integer> ex = new ArrayList<Integer>();
   ArrayList<Integer> ey = new ArrayList<Integer>();
   for(int k = 0; k < b.length; k++){
      for(int i = 0; i < b[0].length; i++){
         if(b[k][i] == 0){
            ex.add(k);
            ey.add(i);
          }
      }
   }
   if(ex.size() > 0){
   int rand = (int)random(0,ex.size());
   int x = ex.get(rand);
   int y = ey.get(rand);
   if(random(0,1) < .9){
      b[x][y] = 1; 
   }else{
      b[x][y] = 2;
   }}
  }
  
  
}