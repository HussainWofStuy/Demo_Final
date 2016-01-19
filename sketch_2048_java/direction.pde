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
    if(dir == RIGHT){compN = right(compN);}
    if(dir == LEFT){left(compN);}
    if(dir == UP){up(compN);}
    if(dir == DOWN){down(compN);}
    return !compFunc(compN, rN);
  }
  
  int[][] right(int[][] data){
   for(int i = 2; i > -1; i--){
     for(int k = 0; k < data.length; k++){
       if(data[k][i]!=0){
         if(data[k][i+1]==data[k][i]){
          data[k][i+1]+=1;
          data[k][i]=0;
          scoreAdd += data[k][i+1]*(int)Math.pow(2,data[k][i+1]);
          }
         if(data[k][i+1] == 0 && i < 3){
          data[k][i+1] = data[k][i];
          data[k][i] = 0;
         }}
       }
      }
      return data;
     }
   
  int[][] left(int[][] data){
    for(int i = 1; i < 4; i++){
       for(int k = 0; k < data.length; k++){
         if(data[k][i]!=0){
           if(data[k][i-1]==data[k][i]){
              data[k][i-1]+=1;
              data[k][i]=0;
              scoreAdd += data[k][i-1]*(int)Math.pow(2,data[k][i-1]);
           }
           while(data[k][i-1] == 0 && i > 0){
            data[k][i-1] = data[k][i];
            data[k][i] = 0;
           }  
           }}}
           return data;
  }
  
  int[][] up(int[][] data){
     for(int k = 1; k < 4; k++){
       for(int i = 0; i < data.length; i++){
         if(data[k][i]!=0){
           if(data[k-1][i]==data[k][i]){
              data[k-1][i]+=1;
              data[k][i]=0;
              scoreAdd += (data[k-1][i]-1)*(int)Math.pow(2,(data[k-1][i]-1));
           }
           while(data[k-1][i] == 0 && k > 0){
            data[k-1][i] = data[k][i];
            data[k][i] = 0;
           }
           
           
           }}}
           return data;
  }
  
  int[][] down(int[][]data){
    for(int k = 2; k > -1; k--){
       for(int i = 0; i < data.length; i++){
         if(data[k][i]!=0){
           if(data[k+1][i]==data[k][i]){
              data[k+1][i]+=1;
              data[k][i]=0;
              scoreAdd += data[k+1][i]*(int)Math.pow(2,data[k+1][i]);
            }
           while(data[k+1][i] == 0 && k < 3){
            data[k+1][i] = data[k][i];
            data[k][i] = 0;
           }
           }}} 
           return data;
  }
}