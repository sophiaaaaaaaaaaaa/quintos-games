// screen resolution is 256x192

PImage imgBall = spriteArt(
"..wwww..\n" +
".wwwyww.\n" +
"wwwyywwww\n" +
"wwyyyyww\n" +
"wwyyyyww\n" +
"wwwywwwwww\n" +
".wwwwww.\n" +
"..wwww..");

PImage imgHand = spriteArt("......ww....\n".repeat(2) + "...wwbwwbww..\n".repeat(4) + "wwbwwbwwbww\n".repeat(4)+"wwwwwwwwwwwbww\n".repeat(5)+"wwwwwwwwwwwwww\n".repeat(3)+".wwwwwwwwwwww\n".repeat(2)+"..wwwwwwwwww\n".repeat(2)+"..wwwwwwww\n".repeat(5));

PImage imgWall = spriteArt(("wwwwwwwwwwbb".repeat(30) +"\n").repeat(5));

PImage imgStove = spriteArt((("ww".repeat(200))+"\n").repeat(2)+(("yy".repeat(30)+"bb").repeat(20)+"\n").repeat (3)+((("yy".repeat(13))+"bbbbbbbb"+("yy".repeat(13))+"bb").repeat(20)+"\n").repeat(3)+ (("yy".repeat(30)+"bb").repeat(20)+"\n").repeat (50));

PImage imgTap = spriteArt(("rrrrrrrrrrrr"+"\n").repeat(2)+("rrrrr.....cc"+"\n").repeat(8));

PImage imgLights = spriteArt(".......wyyyyw.......".repeat(10)+"\n"+".....wyyyyyyyyw.....".repeat(10)+"\n"+"...wyyyyyyyyyyyyw...".repeat(10)+"\n"+".wyyyyyyyyyyyyyyyyw.".repeat(10)+"\n"+"wyyyyyyyyyyyyyyyyyyw".repeat(10));

PImage imgPot = spriteArt("""
rrrrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrr
rbbrrrbrrbbbbr
rbrbrbrbrrrbrr
rbbrrbrbrrrbrr
rbrrrbrbrrrbrr
rbrrrbrbrrrbrr
rbrrrbrbrrrbrr
rbrrrrbrrrrbrr
rrrrrrrrrrrrrr""");

//PImage imgHand = spriteArt("..w..\n.www.\nwwww.\nwwww/\nwwwww\nwwwww\n.www.");

//PImage imgPan = spriteArt(".wwwwww.\nwwwwwwww\n" + "wwwwwwww\n".repeat(28) + "wwwwwwww\n.wwwwww\n"+"..wwww..\n..wwww..\n".repeat(5));

Sprite stove = createSprite(imgStove);

Sprite tap = createSprite(imgTap);

Sprite lights = createSprite(imgLights);

Sprite pot = createSprite(imgPot);

Sprite ball = createSprite(imgBall);

Sprite handL = createSprite(imgHand);

Sprite handR = createSprite(imgHand);

Sprite wallT = createSprite(imgWall);
Sprite wallB = createSprite(imgWall);

void setup() {
  size(256, 192);
  
  wallT.x = 0;
  wallT.y = 10;
  wallB.x = 0;
  wallB.y = 180;

  // places a ball in center of the screen
  ball.x = width / 2 - ball.h / 2;
  ball.y = height / 2 - ball.h / 2;
  ball.velocity.x = 1;
  ball.velocity.y = 1;

  handL.x = 10;
  handL.y = height / 2 - handL.h / 2;
  handL.immovable = true;

  handR.x = width - 10 - handR.w;
  handR.y = height / 2 - handR.h / 2;
  handR.immovable = true;
  handR.mirrorX(-1);

  stove.x = 0;
  stove.y = 125;

  tap.x = 20;
  tap.y = stove.y - tap.h;

  pot.x = 100;
  pot.y = stove.y - pot.h;

  lights.x = 20;
  lights.y = wallT.y + wallT.h;
}

void draw() {
  background(colorPal('b'));
  // draw rest of background here
  
 
  if (ball.x <= -20 || ball.x >= 270){
    ball.x = width / 2 - ball.h / 2;
    ball.y = height / 2 - ball.h / 2;
  }

  // if ball is at/above the top wall or ball is at/below the bottom wall, then invert it's velocity
  if (ball.y <= wallT.y + wallT.h || ball.y + ball.h >= wallB.y){
    ball.velocity.y = -ball.velocity.y;
  }
  
  handL.y = mouseY;
  handR.y = mouseY;
  
  ball.bounce(handL);
  ball.bounce(handR);

  drawSprites();
}
