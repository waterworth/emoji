class Emoji {

  float x;
  float y;
  float diameter;

  PImage img;

  Emoji(PImage tempImg, float tempX, float tempY, float tempD){
    x = tempX;
    y = tempY;
    diameter = tempD;
    img = tempImg;
  }

  void display(){
    stroke(0);
    imageMode(CENTER);
    image(img, x, y, diameter, diameter);
  }
}

PImage[] emoji = new PImage[845];
Emoji[] emojis = new Emoji[845];
int maxframes = 50;

void setup(){
  //Document attributes
  size(750,750);
  background(255);
  //Load images
  for (int i = 0; i < emoji.length; i++) {
    emoji[i] = loadImage("emoji-" + i + ".png");
  }
    
}

void draw(){
  background(random(255),random(255),random(255)); 
 for(int i= 0; i < emoji.length; i++){
  int index = int(random(0, emoji.length));
  emojis[i] = new Emoji(emoji[index], random(100,650), random(100,650), random(100));
 }
  
  for(int i = 0; i < emojis.length; i++) {
   emojis[i].display();
  }
  
  float frames = 0;
  if(frames < maxframes){
    saveFrame("frame_##.png");
    frames += int(frames);
  }else{
    noLoop();
  }
}