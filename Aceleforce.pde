import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

Being [] beings1 = new Being[20];
Being [] beings2 = new Being[2];
Surface [] ficie = new Surface[4] ;
PVector gravity ;
PVector wind;
PImage capadelantera;
PImage capatrasera;

boolean acelerison = true ;

float hue;

void setup(){
  //fullScreen();
  size(displayWidth,displayHeight);
  
          
  imageMode(CENTER);
  rectMode(CENTER);

  sensor = new KetaiSensor(this);
  sensor.start();
  
  capadelantera = loadImage("capadelantera.png");
  capadelantera.resize(width ,height);
   
  capatrasera = loadImage("capatrasera.png");
  capatrasera.resize(width ,height);
   
  colorMode(HSB);
    background(0);
  
  for (int l=0; l<beings1.length; l++){
   color c = color(random(255),0,255);
   beings1[l] = new Being (5,0.5,random(width),random(height),c,random(1,100),random(1,100)); 
  }
 
  for (int l=0; l<beings2.length; l++){
   color c = color(random(255),255,255);
   float rdmsize = random(50,150);
   beings2[l] = new Being (10,0,random(width),random(height),c,rdmsize,rdmsize-10); 
  }
   
}

void draw() {
 
  image(capatrasera,width/2+map(accelerometerX,-10,10, width * 1/20, -width * 1/20 ),height/2+map(accelerometerY,-10,10,- height * 1/20 ,height * 1/20));
  image(capadelantera,width/2+map(accelerometerX,-10,10,- width * 1/50, width * 1/50 ),height/2+map(accelerometerY,-10,10,height * 1/50 ,-height * 1/50));
    
  noFill();
  strokeWeight(3);
  stroke(255,255,255);
  ellipse(map(accelerometerX,-10,10,width,0),map(accelerometerY,-10,10,0,height),20,20); 
  
  for (int k=0; k<beings1.length; k++){
    wasd(beings1[k],3); 
    if (acelerison){
    accelforce(beings1[k],15);
    }    
   beings1[k].display();
   beings1[k].upgrade();
   }
 
  for (int k=0; k<beings2.length; k++){
    wasd(beings2[k],3); 
    if (acelerison){
    accelforce(beings2[k],15);
    }
   beings2[k].display();
   beings2[k].upgrade();
   }
}

void mousePressed(){
   acelerison = ! acelerison;
   println("acelerison",acelerison);
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}