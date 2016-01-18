class direction{
  direction(){}
  
  int[][] copy(int[][] data){
    int[][] rN = new int[4][4];
    for(int k = 0; k < data.length; k++){
      for(int i = 0; i < data[k].length; i++){
        rN[k][i] = data[k][i];
      }
    } 
    return rN;
  }
  
  boolean compFunc(int[][] data1, int[][] data2){
      boolean s = true; 
      for(int k = 0; k < 4 && s; k++){
       for(int i = 0; i < 4 && s; i++){
        if(data1[k][i]!=data2[k][i]){s = false;}
       }
      }
      return s;
  }
  
  boolean canMove(int[][] data, int dir){
    int[][] compN = copy(data);
    int[][] rN = copy(data);  
    if(dir == RIGHT){right(compN, prevb);}
    if(dir == LEFT){left(compN, prevb);}
    if(dir == UP){up(compN, prevb);}
    if(dir == DOWN){down(compN, prevb);}
    return !compFunc(compN, rN);
  }
  
  void right(int[][] data,int[][][] stData){
   for(int i = 2; i > -1; i--){
     for(int k = 0; k < data.length; k++){
       stData[k][i][2] = RIGHT;
       if(data[k][i]!=0){
         if(data[k][i+1]==data[k][i]){
            data[k][i+1]+=1;
            data[k][i]=0;
           stData[k][i][1] +=1;
          }
         while(data[k][i+1] == 0 && i < 3){
          data[k][i+1] = data[k][i];
          data[k][i] = 0;
           stData[k][i][1] +=1;
          if(i!=2){i++;}
         }
           
         if(data[k][i+1]==data[k][i]){
           data[k][i+1]+=1;
           data[k][i]=0; 
           stData[k][i][1] +=1;
         }
        }
       }
      }
     }
   
  void left(int[][] data, int[][][] stData){
    for(int i = 1; i < 4; i++){
       for(int k = 0; k < data.length; k++){
         stData[k][i][2] = LEFT;
         if(data[k][i]!=0){
           if(data[k][i-1]==data[k][i]){
              data[k][i-1]+=1;
              data[k][i]=0;
              stData[k][i][1] -= 1;
           }
           while(data[k][i-1] == 0 && i > 0){
            data[k][i-1] = data[k][i];
            data[k][i] = 0;
            stData[k][i][1] -= 1;
            if(i!=1){i--;}
           }
           
           if(data[k][i-1]==data[k][i]){
              data[k][i-1]+=1;
              data[k][i]=0;
              stData[k][i][1] -= 1;
           }
           
           }}}
  }
  
  void up(int[][] data, int[][][] stData){
     for(int k = 1; k < 4; k++){
       for(int i = 0; i < data.length; i++){
         stData[k][i][2] = UP;
         if(data[k][i]!=0){
           if(data[k-1][i]==data[k][i]){
              data[k-1][i]+=1;
              data[k][i]=0;
              stData[k][i][0]-=1;
           }
           while(data[k-1][i] == 0 && k > 0){
            data[k-1][i] = data[k][i];
            data[k][i] = 0;
            stData[k][i][0]-=1;
            if(k!=1){k--;}
           }
           
           if(data[k-1][i]==data[k][i]){
              data[k-1][i]+=1;
              data[k][i]=0;
              stData[k][i][0]-=1;
           }
           
           }}}
  }
  
  void down(int[][]data, int[][][] stData){
    for(int k = 2; k > -1; k--){
       for(int i = 0; i < data.length; i++){
         stData[k][i][2] = DOWN;
         if(data[k][i]!=0){
           if(data[k+1][i]==data[k][i]){
              data[k+1][i]+=1;
              data[k][i]=0;
              stData[k][i][0]+=1;
            }
           while(data[k+1][i] == 0 && k < 3){
            data[k+1][i] = data[k][i];
            data[k][i] = 0;
            stData[k][i][0]+=1;
            if(k!=2){k++;}
           }
           
           if(data[k+1][i]==data[k][i]){
              data[k+1][i]+=1;
              data[k][i]=0;
              stData[k][i][0]+=1;
           }
           
           }}} 
  }
}