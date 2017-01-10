import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

Being [] beings1 = new Being[20];
Being [] beings2 = new Being[2];

PVector gravity ;
PVector wind;

PImage capadelantera;
PImage capatrasera;

boolean acelerison = true ;

float hue;
float speed;

float Acelwasd;

void setup(){
  //fullScreen();
  
   size(displayWidth,displayHeight);
  //size(1200,600);
          
  shapeMode(CENTER);
  rectMode(CENTER);


   sensor = new KetaiSensor(this);
   sensor.start();
   
  imageMode(CENTER);
  
  capadelantera = loadImage("delantera.png");
 
   capadelantera.resize(width +width * 1/2 ,height + height * 1/2);
   capatrasera = loadImage("trasera.png");
   capatrasera.resize(width  + width * 1/2 ,height + height * 1/2);
   
  colorMode(HSB);
    background(0);
  
  for (int l=0; l<beings1.length; l++){
   color c = color(random(255),0,255);
   beings1[l] = new Being (3,0.4,random(width),random(height),c,random(20,100),random(20,100),45); 
  }
 
  for (int l=0; l<beings2.length; l++){
   color c = color(random(255),255,255);
   float rdmsize = random(50,150);
   beings2[l] = new Being (15,0,random(width),random(height),c,rdmsize,rdmsize-10,35); 
  }
   Acelwasd = 15;
   
}

void draw() {
 
  background(0);

  image(capatrasera,width/2+map(accelerometerX,-10,10, width * 1/50, -width * 1/50 ),height/2+map(accelerometerY,-10,10,- height * 1/50 ,height * 1/50));
  image(capadelantera,width/2+map(accelerometerX,-10,10,-width * 1/2, width * 1/2 ),height/2+map(accelerometerY,-10,10,height * 1/2 ,-height * 1/2));
     
  //image(capatrasera,width/2,height/2);
  //image(capadelantera,width/2,height/2);
  
  noFill();
  stroke(255,255,255);
  ellipse(map(accelerometerX,-10,10,width,0),map(accelerometerY,-10,10,0,height),20,20);
 
  for (int k=0; k<beings1.length; k++){
    wasd(beings1[k],Acelwasd); 
    if (acelerison){
    accelforce(beings1[k],Acelwasd);
    }    
   beings1[k].display();
   beings1[k].upgrade();
   }
 
  for (int k=0; k<beings2.length; k++){
    wasd(beings2[k],Acelwasd); 
    if (acelerison){
    accelforce(beings2[k],Acelwasd);
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