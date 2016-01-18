color[] hueconverter = {color(150), color(247, 242, 242), color(250, 240, 215), color(245, 186, 138), color(245, 157, 114), color(245, 121, 72), color(245, 94, 35), color(242, 222, 139), color(247, 213, 75), color(247, 208, 47), color(250, 203, 13), color(252, 228, 0)};
int[][] board = new int[4][4];
int score = 0;
boolean notgameover = true;
PFont font;

void drawRect(float xcor, float ycor, float rectwidth, float rectheight, float roundness, color hue) {
  fill(hue);
  rect(xcor, ycor, rectwidth, rectheight, roundness);
}

void drawText(String text, float xcor, float ycor, float textwidth, float textheight, color hue, float size, int align){
   fill(hue);
   textAlign(align);
   textSize(size);
   text(text, xcor, ycor, textwidth, textheight);
}

void setup() {
  size(525, 600);
  font = loadFont("try1.vlw");
  textFont(font);
  initializeBoard();
}

void draw() {
  background(250, 249, 237);
  drawRect(25, 100, 475, 480, 10, color(193, 181, 162));
  float rectwidth = 100;
  float rectheight = 100;
  float roundness = 5;
  int hue = color(216, 205, 186);
  for (int row = 0; row < board.length; row++) {
    float ycor = 115 * (row + 1);
    for (int col = 0; col < board[row].length; col++) {
      float xcor = 115 * col + 40;
      drawRect(xcor, ycor, rectwidth, rectheight, roundness, hue);
      if (board[row][col] > 0) {
        for (int power = 1; power < 11; power++) {
          if (millis() > 50 * power) {
            float xcortemp = 40 + 115 * col - (power - 10) * 5;
            float ycortemp = 115 * (row + 1) - (power - 10) * 5;
            float rectwidthtemp = 10 * power;
            float rectlengthtemp = 10 * power;
            int huetemp = hueconverter[board[row][col]];
            drawRect(xcortemp, ycortemp, rectwidthtemp, rectlengthtemp, roundness, huetemp);
          }
        }
        float ycortemp = 115 * row + 150;
        String text = "" + (int)Math.pow(2, board[row][col]);
        float size = 40;
        int align = CENTER;
        if (board[row][col] > 2) {
          int huetemp = 255;
          drawText(text, xcor, ycortemp, rectwidth, rectheight, huetemp, size, align);
        } else {
          int huetemp = 0;
          drawText(text, xcor, ycortemp, rectwidth, rectheight, huetemp, size, align);
        }
      }
    }
  }
}

void initializeBoard() {
  board = new int[4][4];
  score = 0;
  notgameover = true;
  noStroke();
  background(250, 249, 237);
  drawRect(25, 100, 475, 480, 10, color(193, 181, 162));
  float rectwidth = 100;
  float rectheight = 100;
  float roundness = 5;
  int hue = color(216, 205, 186);
  for (int row = 0; row < board.length; row++) {
    float ycor = 115 * (row + 1);
    for (int col = 0; col < board[row].length; col++) {
      float xcor = 115 * col + 40;
      drawRect(xcor, ycor, rectwidth, rectheight, roundness, hue);
    }
  }
  spawn(2);
}

void spawn(int count) {
  ArrayList<Integer> posX = new ArrayList<Integer>();
  ArrayList<Integer> posY = new ArrayList<Integer>();
  for (int row = 0; row < board.length; row++) {
    for (int col = 0; col < board[0].length; col++) {
      if (board[row][col] == 0) {
        posX.add(row);
        posY.add(col);
      }
    }
  }
  for (int i = 0; i < count; i++) {
    if (posX.size() > 0) {
      int rand = (int)random(0, posX.size());
      int row = posX.get(rand);
      int col = posY.get(rand);
      if (random(0, 1) < .9) {
        board[row][col] = 1;
      } else {
        board[row][col] = 2;
      }
    }
  }
}